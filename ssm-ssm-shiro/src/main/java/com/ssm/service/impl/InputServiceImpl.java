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
import com.ssm.mapper.TInputMapper;
import com.ssm.pojo.TInput;
import com.ssm.pojo.TInputExample;
import com.ssm.pojo.TInputExample.Criteria;
import com.ssm.pojo.TProvider;
import com.ssm.service.InputService;
import com.ssm.service.ProdService;
import com.ssm.service.ProviderService;
import com.ssm.utils.PageUtils;

@Service
public class InputServiceImpl implements InputService{
	@Resource
	private TInputMapper tInputMapper;
	@Resource
	private ProviderService providerServiceImpl;
	@Resource
	private ProdService prodServiceImpl;
	
	/**
	 * 分页显示入库信息
	 */
	@Override
	public Map<String, Object> findInputList(int page) {
		PageUtils pageUtils = new PageUtils();
		//设置分页条件
		PageHelper.startPage(page, pageUtils.getPageSize());
		//按入库时间降序排序
		TInputExample example = new TInputExample();
		example.setOrderByClause("inputtime desc");
		List<TInput> list = tInputMapper.selectByExample(example );
		PageInfo<TInput> info = new PageInfo<>(list);
		
		//取出分页后的数据
		pageUtils.setPageNo(page); //第几页
		pageUtils.setTotalPage(info.getPages()); //总页数
		pageUtils.setTotalRecord(info.getTotal());  //总记录数
		pageUtils.setResults(info.getList());   //当前页的总数据
		
		//查询出所有的供应商
		List<TProvider> providerList = providerServiceImpl.findAll();
		
		Map<String, Object> map = new HashMap<>();
		map.put("pageInfo", pageUtils);
		map.put("providerList", providerList);
		return map;
	}

	/**
	 * 批量删除，提供事务回滚
	 */
	@Override
	public Result delInputs(String id) throws Exception {
		Result result = new Result();
		String[] ids = id.split(",");
		int index = 0;
		for (String i : ids) {
			index += tInputMapper.deleteByPrimaryKey(Integer.parseInt(i));
		}
		if(index==ids.length) {
			result.setStatus(200);
			return result;
		}else {
			throw new Exception("操作失败，数据回滚");
		}
		
	}

	@Override
	public int insInput(TInput input,int pid) throws Exception {
		input.setInputtime(new Date());
		int index = 0;
		try {
			//新增入库产品
			index += tInputMapper.insertSelective(input);
			//修改产品数量
			index += prodServiceImpl.updCount(input.getPcount(), pid);
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
	 * 可以根据产品名称检索 （模糊查询 ）产品的入库记录 
	       根据时间 经办人 供应商 来检索
	 */
	@Override
	public Map<String, Object> search(String name, Date inputtime, String annt, String pname) {
		TInputExample example = new TInputExample();
		//默认按照入库时间降序排序
		example.setOrderByClause("inputtime desc");
		List<TInput> list = new ArrayList<>();
		int totalCount = 0; //总数量
		double totalPrice = 0; //总价		
		
		/*Date time = null;
		System.out.println("inputtim="+inputtime);
		if(inputtime!=""&&inputtime!=null) {
			time = new DateUtils().getTime(inputtime);
			System.out.println("time==="+time);
		}*/
		
		if(name==null||name.equals("")) {
			if(inputtime!=null){
				//根据入库时间查询
				example.createCriteria().andInputtimeEqualTo(inputtime);
				list = tInputMapper.selectByExample(example);	
			}else if(annt!=""&&annt!=null) {
				//根据经办人模糊查询
				example.createCriteria().andAnntLike("%"+annt+"%");
				list = tInputMapper.selectByExample(example);
			}else if(pname!=null&&pname!="") {
				example.createCriteria().andPnameEqualTo(pname);
				list = tInputMapper.selectByExample(example);
			}else {
				//无条件默认查询全部
				list = tInputMapper.selectByExample(example);
			}
		}else {
			//根据产品名模糊查询
			example.createCriteria().andNameLike("%"+name+"%");
			list = tInputMapper.selectByExample(example);
		}
	
		if(list!=null&&list.size()>0) {
			for (TInput tInput : list) {
				totalCount += tInput.getPcount();
				totalPrice += tInput.getPrice();
			}
		}
		
		Map<String, Object> map = new HashMap<>();
		map.put("inputList", list);
		map.put("totalCount", totalCount);
		map.put("totalPrice", totalPrice);
		
		return map;
	}

}
