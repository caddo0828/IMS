package com.ssm.service.impl;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ssm.common.Result;
import com.ssm.mapper.TAdminMapper;
import com.ssm.pojo.TAdmin;
import com.ssm.pojo.TAdminExample;
import com.ssm.service.AdminService;
import com.ssm.utils.PageUtils;

@Service
public class AdminServiceImpl implements AdminService{
	@Resource
	private TAdminMapper tAdminMapper;
	
	
	@Override
	public PageUtils findAll(String username,int page) {
		PageUtils pageUtils = new PageUtils();
		PageHelper.startPage(page, pageUtils.getPageSize());
		List<TAdmin> list = tAdminMapper.selectByExample(new TAdminExample());
		PageInfo<TAdmin> pageInfo = new PageInfo<>(list);
		
		//取出分页后的数据
		List<TAdmin> adminList = pageInfo.getList();
		TAdmin admin = new TAdmin();
		if(adminList!=null&&adminList.size()>0) {
			for (TAdmin tAdmin : adminList) {
				if(tAdmin.getUsername().equals(username)) {
					admin = tAdmin;
				}
			}
		}
		//移除当前登录的超级管理员自己
		adminList.remove(admin);
		
		//封装数据
		pageUtils.setPageNo(page); //第几页
		pageUtils.setTotalPage(pageInfo.getPages()); //总页数
		pageUtils.setTotalRecord(pageInfo.getTotal());  //总记录数
		pageUtils.setResults(adminList);
		
		return pageUtils;
	}


	@Override
	public TAdmin selByName(String userName) {
		TAdminExample example = new TAdminExample();
		example.createCriteria().andUsernameEqualTo(userName);
		List<TAdmin> list = tAdminMapper.selectByExample(example);
		if(list!=null&&list.size()>0) {
			return list.get(0);
		}
		return null;
	}


	@Override
	public int insAdmin(TAdmin admin) throws Exception {
		int index = tAdminMapper.insertSelective(admin);
		if(index>0) {
			return 1;
		}else {
			throw new Exception("新增管理员失败，数据回滚");
		}
	}


	@Override
	public TAdmin selById(int id) {
		return tAdminMapper.selectByPrimaryKey(id);
	}


	@Override
	public int updAdmin(TAdmin admin) throws Exception {
		//根据对应的id查询对应的管理员
		TAdmin tAdmin = tAdminMapper.selectByPrimaryKey(admin.getId());
		int index = 0;
		if(tAdmin!=null) {
			tAdmin.setPassword(admin.getPassword());
			tAdmin.setState(admin.getState());
			index = tAdminMapper.updateByPrimaryKeySelective(tAdmin);
		}

		if(index>0) {
			return 1;
		}else {
			throw new Exception("修改管理员信息失败");
		}
	}


	@Override
	public Result delAdmins(String id) throws Exception {
		String[] ids = id.split(",");
		int index = 0;
		for (String i : ids) {
			//通过id，获取对象，修改状态为0，物理删除
			TAdmin tAdmin = tAdminMapper.selectByPrimaryKey(Integer.parseInt(i));
			tAdmin.setState(0);
			index += tAdminMapper.updateByPrimaryKeySelective(tAdmin);
		}
		Result result = new Result();
		if(index==ids.length) {
			//数据全部操作成功
			result.setStatus(200);
			return result;
		}else {
			throw new Exception("管理员删除失败，操作有误");
		}
	}

}
