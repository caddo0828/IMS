package com.ssm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ssm.mapper.TSmalltypeMapper;
import com.ssm.pojo.TSmalltype;
import com.ssm.pojo.TSmalltypeExample;
import com.ssm.service.SmallTypeService;

@Service
public class SmallTypeServiceImpl implements SmallTypeService{
	@Resource
	private TSmalltypeMapper tSmalltypeMapper;
	
	@Override
	public List<TSmalltype> findAll() {
		TSmalltypeExample example = new TSmalltypeExample();
		//查询当前可用的小类分类
		example.createCriteria().andStateEqualTo(1);
		return tSmalltypeMapper.selectByExample(example );
	}

	@Override
	public List<TSmalltype> selByBid(int bid) {
		TSmalltypeExample example = new TSmalltypeExample();
		//查询对应的大类分下的状态为1的子分类
		example.createCriteria().andBidEqualTo(bid).andStateEqualTo(1);
		return tSmalltypeMapper.selectByExample(example);
	}
	
}
