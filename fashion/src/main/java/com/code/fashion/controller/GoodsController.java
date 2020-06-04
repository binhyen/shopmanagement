package com.code.fashion.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.code.fashion.dao.GoodsDAO;
import com.code.fashion.entity.GoodsEntity;




@Controller
public class GoodsController {
	@Autowired
	GoodsDAO goodsDao;
	@RequestMapping(value="/goods",method=RequestMethod.GET)
	public String getList(Model model){
		List<GoodsEntity> list = goodsDao.getList();
		
		model.addAttribute("listGoods",list);
		return "goods";
	}
	@RequestMapping(value="/search",method=RequestMethod.GET)
	public String getSearch(Model model,@RequestParam("searchString") String searchString){
		List<GoodsEntity> listSearch = goodsDao.getListSearch(searchString);
		
		model.addAttribute("listGoods",listSearch);
		return "goods";
	}
	

}
