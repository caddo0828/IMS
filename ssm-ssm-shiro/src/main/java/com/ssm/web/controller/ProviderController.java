package com.ssm.web.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ssm.common.Result;
import com.ssm.pojo.TProvider;
import com.ssm.service.ProviderService;

@Controller
public class ProviderController {
	@Resource
	private ProviderService providerServiceImpl;
	
	/**
	 * 用于判断新增供应商时，是否存在同名供应商
	 * @param pname
	 * @return
	 */
	@RequestMapping("/rest/providers/query/name")
	@ResponseBody
	public Result queryName(String pname) {
		return  providerServiceImpl.selByName(pname);
	}
	
	@RequestMapping("/rest/provider/add")
	public String addProvider(TProvider provider,HttpServletRequest request) {
		int index = 0;
		try {
			index = providerServiceImpl.insProvider(provider);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if(index==1) {
			request.setAttribute("msg","新增供应商成功");
			return "provider_add";
		}
		request.setAttribute("msg","新增供应商失败，请重新操作！");
		return "provider_add";
	}
	
	
}
