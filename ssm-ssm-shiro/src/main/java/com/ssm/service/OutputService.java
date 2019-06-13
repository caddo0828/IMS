package com.ssm.service;

import java.util.Date;
import java.util.Map;

import com.ssm.common.Result;
import com.ssm.pojo.TOutput;
import com.ssm.utils.PageUtils;

public interface OutputService {
	/**
	 * 分页显示产品库存数据
	 * @param page
	 * @return
	 */
	PageUtils findOutputList(int page);
	
	/**
	 * 批量删除入库记录，提供事务回滚
	 * @param id
	 * @return
	 */
	Result delOutputs(String id)throws Exception;
	
	/**
	 * 新增出库产品，并同时修改产品数量
	 * @param output
	 * @param pid
	 * @return
	 * @throws Exception
	 */
	int insOutput(TOutput output,int pid)throws Exception;
	
	/**
	 * 根据产品名称，出库时间，经办人姓名查询对应的出库记录
	 * @param name
	 * @param outputtime
	 * @param annt
	 * @return
	 */
	Map<String, Object> search(String name,Date outputtime,String annt);
}
