package com.ssm.service;

import java.util.List;

import com.ssm.pojo.TBigtype;
import com.ssm.pojo.TSmalltype;

public interface SmallTypeService {
	/**
	 * 查询所有的小类数据
	 * @return
	 */
	List<TSmalltype> findAll();
	
	/**
	 * 根据对应的大类分类编号，查询对应的"启用"状态的小类数据
	 * @param bid
	 * @return
	 */
	List<TSmalltype> selByBid(int bid);
}
