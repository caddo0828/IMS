package com.ssm.service;

import java.util.Date;
import java.util.Map;
import com.ssm.common.Result;
import com.ssm.pojo.TInput;

public interface InputService {
	/**
	 * 分页显示产品库存数据
	 * @param page
	 * @return
	 */
	Map<String, Object> findInputList(int page);
	
	/**
	 * 批量删除入库记录，提供事务回滚
	 * @param id
	 * @return
	 */
	Result delInputs(String id)throws Exception;
	
	/**
	 * 新增入库产品，并同时修改产品数量
	 * @param input
	 * @param pid
	 * @return
	 * @throws Exception
	 */
	int insInput(TInput input,int pid)throws Exception;
	
	/**
	 * 可以根据产品名称检索 （模糊查询 ）产品的入库记录 
	       根据时间 经办人 供应商 来检索
	 * @param name
	 * @param inputtime
	 * @param annt
	 * @param pname
	 * @return
	 */
	Map<String, Object> search(String name,Date inputtime,String annt,String pname);
	
	
}
