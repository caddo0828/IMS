package com.ssm.service;

import java.util.List;

import com.ssm.pojo.TAdminRoleKey;

public interface RoleService {
	/**
	 * 通过管理员id获取角色对象
	 * @param adminId
	 * @return
	 */
	List<TAdminRoleKey> selByAid(int adminId);
	
}
