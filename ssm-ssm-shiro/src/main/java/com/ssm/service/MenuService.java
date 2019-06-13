package com.ssm.service;

import java.util.List;

import com.ssm.pojo.TMenu;
import com.ssm.pojo.TMenuRoleKey;

public interface MenuService {
	/**
	 * 根据角色id上中间表中获取菜单id的集合对象
	 * @param roleId
	 * @return
	 */
	List<TMenuRoleKey> selByRid(int roleId);
	
	/**
	 * 根据菜单id,获取菜单对象
	 * @param menuId
	 * @return
	 */
	TMenu selByMId(int menuId);
	
}
