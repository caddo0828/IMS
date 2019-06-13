package com.ssm.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ssm.common.Result;
import com.ssm.mapper.TOutputMapper;
import com.ssm.pojo.TOutput;
import com.ssm.pojo.TOutputExample;
import com.ssm.service.OutputService;
import com.ssm.service.ProdService;
import com.ssm.utils.PageUtils;
@Service
public class OutputServiceImpl implements OutputService{
	@Resource
	private TOutputMapper tOutputMapper;
	@Resource
	private ProdService prodServiceImpl;
	
	@Override
	public PageUtils findOutputList(int page) {
		PageUtils pageUtils = new PageUtils();
		//设置分页条件
		PageHelper.startPage(page, pageUtils.getPageSize());
		//默认按照出库时间降序查询全部
		TOutputExample example = new TOutputExample();
		example.setOrderByClause("outputtime desc");
		List<TOutput> list = tOutputMapper.selectByExample(example );
		PageInfo<TOutput> pageInfo = new PageInfo<>(list);
		//取出分页后的数据
		pageUtils.setPageNo(page); //第几页
		pageUtils.setTotalPage(pageInfo.getPages()); //总页数
		pageUtils.setTotalRecord(pageInfo.getTotal());  //总记录数
		pageUtils.setResults(pageInfo.getList());   //当前页的总数据
	
		return pageUtils;
	}


	@Override
	public Result delOutputs(String id) throws Exception {
		Result result = new Result();
		String[] ids = id.split(",");
		int index = 0;
		for (String i : ids) {
			index += tOutputMapper.deleteByPrimaryKey(Integer.parseInt(i));
		}
		if(index==ids.length) {
			result.setStatus(200);
			return result;
		}else {
			throw new Exception("操作失败，数据回滚");
		}
		
	}


	@Override
	public int insOutput(TOutput output, int pid) throws Exception {
		output.setOutputtime(new Date());
		int index = 0;
		try {
			//新增出库产品
			index += tOutputMapper.insertSelective(output);
			//修改产品数量
			index += prodServiceImpl.updCount(output.getPcount(), pid);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		if(index==2) {
			//新增成功
			return 1;
		}else {
			throw new Exception("新增失败，数据回滚");
		}
		
	}


	/**
	 * 根据产品名称，出库时间，经办人姓名查询对应的出库记录
	 */
	@Override
	public Map<String, Object> search(String name, Date outputtime, String annt) {
		TOutputExample example = new TOutputExample();
		//默认根据时间降序排序
		example.setOrderByClause("outputtime desc");
		
		List<TOutput> list = new ArrayList<>();
		int totalCount = 0; //总数量
		double totalPrice = 0; //总价	
				
		if(name==null||name.equals("")) {
			if(outputtime!=null) {
				//根据出库时间查询
				example.createCriteria().andOutputtimeEqualTo(outputtime);
				list = tOutputMapper.selectByExample(example);
			}else if(annt!=null&&!annt.equals("")) {
				//根据经办人名称模糊查询
				example.createCriteria().andAnntLike("%"+annt+"%");
				list = tOutputMapper.selectByExample(example);	
			}else {
				//无条件默认查询全部
				list = tOutputMapper.selectByExample(example);
			}
		}else {
			//根据产品名模糊查询
			example.createCriteria().andNameLike("%"+name+"%");
			list = tOutputMapper.selectByExample(example);
		}
	
		if(list!=null&&list.size()>0) {
			for (TOutput tOutput : list) {
				totalCount += tOutput.getPcount();
				totalPrice += tOutput.getPrice();
			}
		}
		
		Map<String, Object> map = new HashMap<>();
		map.put("outputList", list);
		map.put("totalCount", totalCount);
		map.put("totalPrice", totalPrice);

		return map;
	}


}
