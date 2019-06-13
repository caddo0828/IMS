package com.ssm.service;

import java.util.List;

import com.ssm.pojo.TBigtype;

public interface BigTypeService {
	/**
	 * 查询所有的大类数据
	 * @return
	 */
	List<TBigtype> findAll();
}
