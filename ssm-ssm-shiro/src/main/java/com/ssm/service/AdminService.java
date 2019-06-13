package com.ssm.service;

import com.ssm.common.Result;
import com.ssm.pojo.TAdmin;
import com.ssm.utils.PageUtils;

public interface AdminService {
	/**Lparam page
	 * @return
	 */
	PageUtils findAll(String username,int page);
	
	/**
	 * 根据姓名查询是否已经存在对应的管理员
	 * @param userName
	 * @return
	 */
	TAdmin selByName(String userName);
	
	/**
	 * 新增管理员
	 * @param admin
	 * @return
	 */
	int insAdmin(TAdmin admin)throws Exception;
	
	/**
	 * 通过id查询对应的管理员具体信息
	 * @param id
	 * @return
	 */
	TAdmin selById(int id);
	
	/**
	 * 更新管理员信息
	 * @param admin
	 * @return
	 */
	int updAdmin(TAdmin admin)throws Exception;
	
	/**
	 * 根据管理员id,删除管理员（物理删除）只能修改管理员状态
	 * @param id
	 * @return
	 */
	Result delAdmins(String id)throws Exception;
	
	
	
	
}
