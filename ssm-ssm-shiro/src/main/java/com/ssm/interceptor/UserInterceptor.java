package com.ssm.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.shiro.SecurityUtils;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import com.ssm.pojo.TAdmin;

public class UserInterceptor implements HandlerInterceptor{

	//在执行对应的控制器之前进行执行，返回false代表失败，阻止进行控制器
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		//从当前执行的环境中获取存储到Shior中的session中的数据信息，判断用户是否已经登录
		//获取当前请求路径
		String buffer = request.getRequestURL().toString();
		System.out.println("buffer="+buffer);
		
		TAdmin admin = (TAdmin) SecurityUtils.getSubject().getSession().getAttribute("loginAdmin");
		if(admin!=null) {
			System.out.println("====用户已登录");
			//用于已经登录成功
			return true;
		}
		System.out.println("=====用户未登录======");
		//用户暂未登录，或者登录失败
		response.sendRedirect("http://47.102.207.63:8080/login");
		return false;
	}

	//在控制执行完成后，执行jsp界面之前执行，经常用于清理敏感词汇
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		
	}

	//成功执行jsp之后执行该方法，不管之前的操作中是否存在异常，该方法都会被执行，可以用来保存异常信息到日志文件中
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		
	}

}
