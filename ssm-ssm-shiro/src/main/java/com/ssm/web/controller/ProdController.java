package com.ssm.web.controller;

import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.SecurityUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mysql.jdbc.Security;
import com.ssm.common.Result;
import com.ssm.pojo.TAdmin;
import com.ssm.pojo.TProducts;
import com.ssm.pojo.TProvider;
import com.ssm.service.BigTypeService;
import com.ssm.service.ProdService;
import com.ssm.service.ProviderService;

@Controller
public class ProdController {
	@Resource
	private ProdService prodServiceImpl;
	@Resource
	private BigTypeService bigTypeServiceImpl;
	@Resource
	private ProviderService providerServiceImpl;
	
	/**
	 * 分页显示产品库存数据
	 * @param page
	 * @param request
	 * @return
	 */
	@RequestMapping("/item/kucun_list")
	public String prodList(@RequestParam(value="page",defaultValue="1") int page,HttpServletRequest request) {
		Map<String, Object> map = prodServiceImpl.findProList(page);
		request.setAttribute("data", map);
		return "kucun_list";
	}
	
	/**
	 * 批量删除库存产品
	 * @param id
	 * @return
	 */
	@RequestMapping("/rest/products/delete")
	@ResponseBody
	public Result delPords(String id) {
		Result result = new Result();
		try {
			result =  prodServiceImpl.delProds(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	/**
	 * 跳转到新增产品界面，同时加载大类分类数据
	 * @param request
	 * @return
	 */
	@RequestMapping("/item/show/products_add")
	public String showAddPage(HttpServletRequest request) {
		request.setAttribute("bigTypeList", bigTypeServiceImpl.findAll());
		return "products_add";
	}
	
	/**
	 * 根据产品名查询是否存在对应产品（产品新增时，判断产品是否唯一）
	 * @param pname
	 * @return
	 */
	@RequestMapping("/rest/products/query/name")
	@ResponseBody
	public Result selByName(String pname) {
		return prodServiceImpl.selByName(pname);
	}
	
	/**
	 * 新增产品
	 * @param products
	 * @param request
	 * @return
	 */
	@RequestMapping("/rest/products/add")
	public String insProds(TProducts products,HttpServletRequest request) {
		int index = 0;
		try {
			index = prodServiceImpl.insProducts(products);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		if(index==1) {
			return "forward:/item/kucun_list";
		}
		request.setAttribute("msg", "新增失败，请重新操作");
		return "products_add";
	}
	
	/**
	 * 查询具体的产品信息，并且跳转到详细界面
	 * @param id
	 * @param request
	 * @return
	 */
	@RequestMapping("/input/toview/{id}")
	public String prodToView(@PathVariable("id") int id,HttpServletRequest request) {
		TProducts products = prodServiceImpl.selById(id);
		List<TProvider> list = providerServiceImpl.findAll();
		request.setAttribute("product", products);
		request.setAttribute("providerList",list);
		return "input";
	}
	
	/**
	 * 根据产品id以及输入数量，判断是否满足入库数量要求
	 * @param id
	 * @param num
	 * @return
	 */
	@RequestMapping("/rest/products/query/num")
	@ResponseBody
	public Result queryNum(int id,int num) {
		return prodServiceImpl.selByCount(id, num);
	}
	
	/**
	 * 产品出库时，显示商品详情，跳转出库界面
	 * @param id
	 * @param request
	 * @return
	 */
	@RequestMapping("/output/toview/{id}")
	public String proOutView(@PathVariable("id") int id,HttpServletRequest request) {
		TProducts products = prodServiceImpl.selById(id);
		request.setAttribute("product", products);
		return "output";
	}
	
	/**
	 * 根据输入的分类，或者产品进行查询，并且分页显示查询后的数据
	 * @param bid
	 * @param sid
	 * @param name
	 * @param page
	 * @param request
	 * @return
	 */
	@RequestMapping("/item/kucun/search")
	public String searcch(@RequestParam(value="bid",defaultValue="0") int bid,@RequestParam(value="sid",defaultValue="0") int sid,String name,@RequestParam(value="page",defaultValue="1") int page,HttpServletRequest request) {
		request.setAttribute("data", prodServiceImpl.search(bid, sid, name, page));
		return "kucun_search";
	}
	
	
}
