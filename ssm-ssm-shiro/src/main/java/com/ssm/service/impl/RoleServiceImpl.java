package com.ssm.service.impl;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.ssm.mapper.TAdminRoleMapper;
import com.ssm.pojo.TAdminRoleExample;
import com.ssm.pojo.TAdminRoleKey;
import com.ssm.pojo.TRole;
import com.ssm.service.RoleService;

@Service
public class RoleServiceImpl implements RoleService{
	@Resource
	private TAdminRoleMapper tAdminRoleMapper;
	
	@Override
	public List<TAdminRoleKey> selByAid(int adminId) {
		TAdminRoleExample example = new TAdminRoleExample();
		example.createCriteria().andAdminIdEqualTo(adminId);
		return tAdminRoleMapper.selectByExample(example);
	}

}
