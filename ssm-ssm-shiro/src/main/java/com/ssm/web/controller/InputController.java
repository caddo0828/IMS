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
import com.ssm.pojo.TInput;
import com.ssm.service.InputService;

@Controller
public class InputController {
	@Resource
	private InputService inputServiceImpl;
	/**
	 * 分页显示入库记录
	 * @param page
	 * @param request
	 * @return
	 */
	@RequestMapping("/item/input_list")
	public String inputList(@RequestParam(value="page",defaultValue="1") int page,HttpServletRequest request) {
		Map<String, Object> map = inputServiceImpl.findInputList(page);
		request.setAttribute("data", map);
		return "input_list";
	}
	/**
	 * 批量删除入库记录
	 * @param id
	 * @return
	 */
	@RequestMapping("/rest/input/delete")
	@ResponseBody
	public Result delInputs(String id) {
		Result result = new Result();
		try {
			result =  inputServiceImpl.delInputs(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	/**
	 * 新增产品入库
	 * @param input
	 * @param pid
	 * @param request
	 * @return
	 */
	@RequestMapping("/rest/input/add")
	public String addInput(TInput input,int pid,HttpServletRequest request) {
		int index = 0;
		try {
			index = inputServiceImpl.insInput(input,pid);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if(index!=1) {
			request.setAttribute("msg", "产品入库失败，请联系相关负责人！");
		}
		return "forward:/item/input_list";
				
	}
	
	@RequestMapping("/item/input/search")
	public String search(String name,@DateTimeFormat(pattern="yyyy-MM-dd hh:mm:ss")  Date inputtime,String annt,String pname,HttpServletRequest request) {
		System.out.println("date="+inputtime);
		Map<String, Object> map = inputServiceImpl.search(name, inputtime, annt, pname);
		request.setAttribute("data", map);
		return "input_search";
	}
	
}
