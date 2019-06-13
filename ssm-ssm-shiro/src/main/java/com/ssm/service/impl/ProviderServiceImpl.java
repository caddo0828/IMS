package com.ssm.service.impl;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.ssm.common.Result;
import com.ssm.mapper.TProviderMapper;
import com.ssm.pojo.TProvider;
import com.ssm.pojo.TProviderExample;
import com.ssm.service.ProviderService;

@Service
public class ProviderServiceImpl implements ProviderService{
	@Resource
	private TProviderMapper tProviderMapper;
	
	/**
	 * 通过姓名去查询对应的供应商
	 */
	@Override
	public Result selByName(String pname) {
		Result result = new Result();
		TProviderExample example = new TProviderExample();
		example.createCriteria().andPnameEqualTo(pname);
		List<TProvider> list = tProviderMapper.selectByExample(example);
		if(list==null||list.size()==0) {
			//代表不存在同名的供应商
			result.setStatus(200);
		}
		return result;
	}

	/**
	 * 新增供应商，提供事务回滚机制
	 */
	@Override
	public int insProvider(TProvider provider) throws Exception {
		int index = tProviderMapper.insert(provider);
		if(index>0) {
			//代表新增成功
			return 1;
		}else {
			throw new Exception();
		}
	}

	@Override
	public List<TProvider> findAll() {
		//查询出所有的供应商		
		return tProviderMapper.selectByExample(new TProviderExample());
	}

}
