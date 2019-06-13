package com.ssm.service;

import java.util.Map;

import com.ssm.common.Result;
import com.ssm.pojo.TProducts;

public interface ProdService {
	/**
	 * 分页显示产品库存数据
	 * @param page
	 * @return
	 */
	Map<String, Object> findProList(int page);
	
	/**
	 * 删除对应的产品
	 * @param ids
	 * @return
	 */
	Result delProds(String id)throws Exception;
	
	/**
	 * 通过产品名称查询是否存在对应产品数据(新增产品时，产品名称唯一)
	 * @param pname
	 * @return
	 */
	Result selByName(String pname);
	
	/**
	 * 新增产品
	 * @param products
	 * @return
	 */
	int insProducts(TProducts products)throws Exception;
	
	/**
	 * 根据产品id,查询产品具体信息
	 * @param id
	 * @return
	 */
	TProducts selById(int id);
	
	/**
	 * 根据对应的id，以及数量，查询数量是否可取
	 * @param id
	 * @param num
	 * @return
	 */
	Result selByCount(int id ,int num);
	
	/**
	 * 根据产品id,修改产品数量
	 * @param count
	 * @return
	 */
	int updCount(int count,int id)throws Exception;
	
	/**
	 * 根据大类，小类，产品名称进行模糊查询对应商品
	 * @param bid
	 * @param sid
	 * @param name
	 * @return
	 */
	Map<String, Object> search(int bid,int sid,String name,int page);
	
}
