package com.ssm.filter;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.filter.authc.LogoutFilter;


public class AdminLogoutFilter extends LogoutFilter{
	/**
	 * 退出前，清理对应的认证缓存
	 */
	@Override
	protected boolean preHandle(ServletRequest request, ServletResponse response) throws Exception {
		//从退出请求中获取，获取主体信息
		//在这里执行退出系统前需要清空的数据
		Subject subject = getSubject(request, response);
		//从当前请求中获取要进行退出跳转的请求路径
		String redirectUrl = getRedirectUrl(request, response, subject);
		System.out.println("------清除缓存=----");
		System.out.println("redirectUrl="+redirectUrl);
		try {
			subject.logout();
			System.out.println("=======shiro实现用户退出，并且成功清理缓存数据=======");
		} catch (Exception e) {
			e.printStackTrace();
		}
		//真正执行退出跳转路径
		issueRedirect(request, response, redirectUrl);
		//返回false表示不执行后续的过滤器，直接返回跳转到登录页面
		return false;
	}
}
