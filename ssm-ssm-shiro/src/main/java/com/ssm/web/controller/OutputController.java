package com.ssm.web.controller;

import java.util.Date;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ssm.common.Result;
import com.ssm.pojo.TOutput;
import com.ssm.service.OutputService;
import com.ssm.utils.PageUtils;

@Controller
public class OutputController {
	@Resource
	private OutputService outputServiceImpl;
	
	@RequestMapping("/item/output_list")
	public String outputList(@RequestParam(value="page",defaultValue="1") int page,HttpServletRequest request) {
		PageUtils pageUtils = outputServiceImpl.findOutputList(page);
		request.setAttribute("data", pageUtils);
		return "output_list";
	}
	
	@RequestMapping("/rest/output/delete")
	@ResponseBody
	public Result delInputs(String id) {
		Result result = new Result();
		try {
			result =  outputServiceImpl.delOutputs(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	/**
	 * 产品出库
	 * @param output
	 * @param pid
	 * @param request
	 * @return
	 */
	@RequestMapping("/rest/output/add")
	public String addOutput(TOutput output,int pid,HttpServletRequest request) {
		int index = 0;
		try {
			index = outputServiceImpl.insOutput(output, pid);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if(index!=1) {
			request.setAttribute("msg", "产品出库失败，请联系相关负责人！");
		}
		return "forward:/item/output_list";		
	}
	
	@RequestMapping("/item/output/search")
	public String search(String name,@DateTimeFormat(pattern="yyyy-MM-dd hh:mm:ss")Date outputtime,String annt,HttpServletRequest request) {
		Map<String, Object> map = outputServiceImpl.search(name, outputtime, annt);
		request.setAttribute("data", map);
		return "output_search";
	}
}
