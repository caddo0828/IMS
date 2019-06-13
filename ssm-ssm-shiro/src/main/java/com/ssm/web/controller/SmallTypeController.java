package com.ssm.web.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ssm.pojo.TSmalltype;
import com.ssm.service.SmallTypeService;

@Controller
public class SmallTypeController {
	@Resource
	private SmallTypeService smallTypeServiceImpl;
	
	@RequestMapping("/rest/smallType/search")
	@ResponseBody
	public List<TSmalltype> searchByBid(int bid) {
		return smallTypeServiceImpl.selByBid(bid);
	}
	
}
