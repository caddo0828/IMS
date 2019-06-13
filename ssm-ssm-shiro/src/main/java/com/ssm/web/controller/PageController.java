package com.ssm.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PageController {
	@RequestMapping("/")
	public String welcome() {
		return "login";
	}
	
	@RequestMapping("{page}")
	public String showPage(@PathVariable String page) {
		return page;
	}
	
	@RequestMapping("/page/top")
	public String top() {
		return "top";
	}
	
	@RequestMapping("/page/left")
	public String left() {
		return "left";
	}
	
	@RequestMapping("/page/index")
	public String right() {
		return "index";
	}
	
}
