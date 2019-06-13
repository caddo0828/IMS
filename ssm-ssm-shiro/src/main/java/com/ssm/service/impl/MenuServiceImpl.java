package com.ssm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ssm.mapper.TMenuMapper;
import com.ssm.mapper.TMenuRoleMapper;
import com.ssm.pojo.TMenu;
import com.ssm.pojo.TMenuRoleExample;
import com.ssm.pojo.TMenuRoleKey;
import com.ssm.service.MenuService;

@Service
public class MenuServiceImpl implements MenuService{
	@Resource
	private TMenuRoleMapper tMenuRoleMapper;
	@Resource
	private TMenuMapper tMenuMapper;
	
	
	@Override
	public List<TMenuRoleKey> selByRid(int roleId) {
		TMenuRoleExample example = new TMenuRoleExample();
		example.createCriteria().andRoleIdEqualTo(roleId);
		return tMenuRoleMapper.selectByExample(example);
	}

	@Override
	public TMenu selByMId(int menuId) {
		return tMenuMapper.selectByPrimaryKey(menuId);
	}

}
