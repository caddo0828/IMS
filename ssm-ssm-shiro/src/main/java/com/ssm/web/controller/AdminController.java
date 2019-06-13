package com.ssm.web.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ssm.common.Result;
import com.ssm.pojo.TAdmin;
import com.ssm.realm.UserRealm;
import com.ssm.service.AdminService;
import com.ssm.utils.PageUtils;

@Controller
public class AdminController {
	@Resource
	private AdminService adminServiceImpl;
	
	/**
	 * 用户没有授权时，跳转到登录界面
	 * @return
	 */
	@RequestMapping("/toLogin")
	public String toLogin() {
		System.out.println("======跳转登录界面=====");
		return "login";
	}
	
	/**
	 * 用户登录失败时验证失败原因，返回错误信息
	 * @param request
	 * @return
	 */
	@RequestMapping("/user/login")
	public String login(HttpServletRequest  request) {
		System.out.println("=====用户登录失败出错=========");
		//当用户认证失败时，shiro封装了当前的错误类型
		String errorName = (String)request.getAttribute("shiroLoginFailure");
		if(IncorrectCredentialsException.class.getName().equals(errorName)) {
			System.out.println("密码错误");
		}else if(UnknownAccountException.class.getName().equals(errorName)) {
			System.out.println("账号不存在");
		}
		request.setAttribute("error", "用户名或密码错误");
		return "login";
	}
	
	/**
	 * 分页显示管理员信息
	 * @param request
	 * @return
	 */
	@RequestMapping("/item/admin_list")
	@RequiresPermissions("admin:all")
	public String adminList(@RequestParam(value="page",defaultValue="1")int page,HttpServletRequest request) {
		TAdmin admin = (TAdmin) SecurityUtils.getSubject().getSession().getAttribute("loginAdmin");
		PageUtils pageUtils = adminServiceImpl.findAll(admin.getUsername(), page);
		request.setAttribute("data",pageUtils);
		return "admin_list";
	}
	
	/**
	 * 查询新增时，是否已经存在同名的管理员
	 * @return
	 */
	@RequestMapping("/rest/admin/query/name")
	@RequiresPermissions("admin:all")
	@ResponseBody
	public Result query(String userName) {
		Result result = new Result();
		TAdmin tAdmin = adminServiceImpl.selByName(userName);
		if(tAdmin==null) {
			//代表不存在同名的管理员信息
			result.setStatus(200);
		}
		
		return result;
	}
	
	/**
	 * 管理员新增
	 * @param admin
	 * @param request
	 * @return
	 */
	@RequestMapping("/rest/admin/add")
	@RequiresPermissions("admin:all")
	public String add(TAdmin admin,HttpServletRequest request) {
		int index = 0;
		try {
			index = adminServiceImpl.insAdmin(admin);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		if(index==1) {
			return "forward:/item/admin_list";
		}
		request.setAttribute("msg", "新增管理员失败，请检查操作！");
		return  "admin_add";
	}
	
	/**
	 * 跳转管理员修改界面
	 * @param id
	 * @return
	 */
	@RequestMapping("/admin/toview/{id}")
	@RequiresPermissions("admin:all")
	public String toView(@PathVariable("id") int id,HttpServletRequest request) {
		TAdmin admin = adminServiceImpl.selById(id);
		request.setAttribute("admin", admin);
		return "admin_update";
	}
	
	/**
	 * 修改管理员信息
	 * @param admin
	 * @param request
	 * @return
	 */
	@RequestMapping("/rest/admin/update")
	@RequiresPermissions("admin:all")
	public String update(TAdmin admin,HttpServletRequest request) {
		int index =0;
		try {
			index = adminServiceImpl.updAdmin(admin);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if(index!=1) {
			request.setAttribute("msg", "修改管理员信息失败，请检查操作");
		}
		return "forward:/item/admin_list";
	}
	
	/**
	 * 批量删除管理员信息（物理删除，只修改状态）
	 * @param id
	 * @return
	 */
	@RequestMapping("/rest/admin/delete")
	@RequiresPermissions("admin:all")
	@ResponseBody
	public Result deletes(String id) {
		Result result = new Result();
		try {
			result = adminServiceImpl.delAdmins(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	/**
	 * 用户退出
	 * @return
	 */
	@RequestMapping("/rest/admin/logout")
	public String logout(HttpServletRequest request) {
		return "login";
	}
}
