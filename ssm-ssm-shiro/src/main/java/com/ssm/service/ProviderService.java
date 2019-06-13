package com.ssm.service;

import java.util.List;

import com.ssm.common.Result;
import com.ssm.pojo.TProvider;

public interface ProviderService {
	/**
	 * 通过姓名查找是否存在对应的供应商
	 * @param pname
	 * @return
	 */
	Result selByName(String pname);
	
	/**
	 * 新增供应商
	 * @param provider
	 * @return
	 */
	int insProvider(TProvider provider)throws Exception;
	
	/**
	 * 查询所有供应商
	 * @return
	 */
	List<TProvider> findAll();
}
