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
import com.ssm.mapper.TProductsMapper;
import com.ssm.pojo.TBigtype;
import com.ssm.pojo.TProducts;
import com.ssm.pojo.TProductsExample;
import com.ssm.pojo.TProductsExample.Criteria;
import com.ssm.pojo.TSmalltype;
import com.ssm.service.BigTypeService;
import com.ssm.service.ProdService;
import com.ssm.service.SmallTypeService;
import com.ssm.utils.PageUtils;

@Service
public class ProdServiceImpl implements ProdService{
	@Resource
	private TProductsMapper tProductsMapper;
	@Resource
	private BigTypeService bigTypeServiceImpl;
	@Resource
	private SmallTypeService smallTypeServiceImpl;
	/**
	 * 分页查询出对应的产品数据。在查询对应的大分类，小分类数据
	 */
	@Override
	public Map<String, Object> findProList(int page) {
		PageUtils pageUtils = new PageUtils();
		//设置分页条件
		PageHelper.startPage(page, pageUtils.getPageSize());
		//按创建时间降序查询全部
		TProductsExample example = new TProductsExample();
		example.setOrderByClause("createtime desc");
		List<TProducts> list = tProductsMapper.selectByExample(example);
		//page插件中所使用的功能，对products进行分页
		PageInfo<TProducts> pageInfo = new PageInfo<>(list);
		
		//取出分页后的数据
		pageUtils.setPageNo(page); //第几页
		pageUtils.setTotalPage(pageInfo.getPages()); //总页数
		pageUtils.setTotalRecord(pageInfo.getTotal());  //总记录数
		pageUtils.setResults(pageInfo.getList());
		
		//查询对应所有的大分类
		List<TBigtype> tBigtypeList = bigTypeServiceImpl.findAll();
		//查询对应的所有小分类
		List<TSmalltype> tSmalltypeList = smallTypeServiceImpl.findAll();
		
		Map<String, Object> map = new HashMap<>();
		map.put("pageInfo", pageUtils);
		map.put("bigTypeList", tBigtypeList);
		map.put("smallTypeList", tSmalltypeList);
		
		return map;
	}

	@Override
	public Result delProds(String id) throws Exception {
		Result result = new Result();
		//前台传递的数据是以逗号进行分隔的数据
		String[] ids = id.split(",");
		int index = 0;
		for (String i : ids) {
			index += tProductsMapper.deleteByPrimaryKey(Integer.parseInt(i));
		}
		
		if(index==ids.length) {
			result.setStatus(200);
			return result;
		}else {
			throw new Exception("操作失败，数据回滚");
		}
	}

	@Override
	public Result selByName(String pname) {
		Result result = new Result();
		TProductsExample example = new TProductsExample();
		example.createCriteria().andNameEqualTo(pname);
		List<TProducts> list = tProductsMapper.selectByExample(example);
		if(list==null||list.size()==0) {
			//代表不存在对应产品名的产品
			result.setStatus(200);
		}
		return result;
	}

	@Override
	public int insProducts(TProducts products) throws Exception {
		//新增产品状态为1
		products.setState(1);
		products.setCreatetime(new Date());
		int index = tProductsMapper.insert(products);
		if(index > 0) {
			return 1;
		}else {
			throw new Exception("新增产品失败，数据回滚");
		}
	}

	@Override
	public TProducts selById(int id) {
		return tProductsMapper.selectByPrimaryKey(id);
	}

	@Override
	public Result selByCount(int id, int num) {
		Result result = new Result();
		TProducts tProducts = tProductsMapper.selectByPrimaryKey(id);
		if(tProducts!=null) {
			//获取对应的数量与入库数量进行比对
			if(tProducts.getCount()>=num) {
				//数量满足入库条件
				result.setStatus(200);
			}else {
				result.setMsg(tProducts.getCount());
			}
		}
		return result;
	}

	@Override
	public int updCount(int count,int id) throws Exception {
		TProducts products = tProductsMapper.selectByPrimaryKey(id);
		products.setCount(products.getCount()-count);
		int index = tProductsMapper.updateByPrimaryKeySelective(products);
		if(index>0) {
			return 1;
		}else {
			throw new Exception("产品数量修改失败，数据回滚");
		}
	}

	 /**
	  * 不管根据哪种查询都要查询出对应的大分类总数据，数据和小分类总数据
	  * 设置分页条件一定要在分页之前操作
	  根据分类查询，根据产品名称查询
	   先判断名称
	 * A：当名称为空：代表根据分类查询
	 * 	  分类查询时存在三种情况：
	 * 	   1、只根据大类查询, 此时小类id为空
	 * 	   2、只根据小类查询， 此时大类id为空
	 *     3、同时根据大类小类查询
	 * B：名称不为空：
	 * 	  代表根据产品名称模糊查询 
	 * C：没有查询条件，默认查询全部
	 * @param bid
	 * @param sid
	 * @param name
	 * @return
	 */
	@Override
	public Map<String, Object> search(int bid, int sid, String name,int page) {
		//自定义查询条件
		TProductsExample example = new TProductsExample();
		//分页数据封装
		PageUtils pageUtils = new PageUtils();
		//设置分页条件
		PageHelper.startPage(page, pageUtils.getPageSize());
		List<TProducts> productList = new ArrayList<>();
		if(name==null||name.equals("")) {
			//分类查询
			if(bid!=0&&sid==0) {
				//只根据大类查询
				example.createCriteria().andBidEqualTo(bid);
				productList = tProductsMapper.selectByExample(example);
			}else if(bid==0&&sid!=0) {
				//只根据小类查询
				example.createCriteria().andSidEqualTo(sid);
				productList = tProductsMapper.selectByExample(example);
			}else if(bid!=0&&sid!=0){
				//根据大类，小类同时查询
				example.createCriteria().andBidEqualTo(bid).andSidEqualTo(sid);
				productList = tProductsMapper.selectByExample(example);
			}else {
				//传入的数据都为空，即不按照分类查询，也不按照名称模糊查询，默认查询全部
				productList = tProductsMapper.selectByExample(example);
			}
		}else {
			//产品名称模糊查询
			example.createCriteria().andNameLike("%"+name+"%");
			productList = tProductsMapper.selectByExample(example);
		}
		
		//查询对应所有的大分类
		List<TBigtype> tBigtypeList = bigTypeServiceImpl.findAll();
		//查询对应的所有小分类
		List<TSmalltype> tSmalltypeList = smallTypeServiceImpl.findAll();
		
		
		PageInfo<TProducts> pageInfo = new PageInfo<>(productList);
		//取出分页后的数据
		pageUtils.setPageNo(page); //第几页
		pageUtils.setTotalPage(pageInfo.getPages()); //总页数
		pageUtils.setTotalRecord(pageInfo.getTotal());  //总记录数
		pageUtils.setResults(pageInfo.getList());
		
		Map<String, Object> map = new HashMap<>();
		map.put("pageInfo", pageUtils);
		map.put("bigTypeList", tBigtypeList);
		map.put("smallTypeList", tSmalltypeList);
		
		return map;
	}
	
	
	

}
