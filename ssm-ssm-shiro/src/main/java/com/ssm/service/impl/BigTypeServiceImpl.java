package com.ssm.service.impl;

import java.util.List;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.ssm.mapper.TBigtypeMapper;
import com.ssm.pojo.TBigtype;
import com.ssm.pojo.TBigtypeExample;
import com.ssm.service.BigTypeService;

@Service
public class BigTypeServiceImpl implements BigTypeService{
	@Resource
	private TBigtypeMapper tBigtypeMapper;
	
	@Override
	public List<TBigtype> findAll() {
		TBigtypeExample example = new TBigtypeExample();
		//只查询对应的启用的分类数据
		example.createCriteria().andStateEqualTo(1);
		return  tBigtypeMapper.selectByExample(example );
	}

}
