package com.fas.fahiru.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.fas.fahiru.service.TrendyFoodsService;

@Controller
public class TfController {
	
	private TrendyFoodsService trendyFoodsService;
	
	public void setTrendyFoodsService(TrendyFoodsService trendyFoodsService) {
		this.trendyFoodsService = trendyFoodsService;
	}
	
	@RequestMapping(value="/tf/{no}", method=RequestMethod.GET)
	public String tfDetail(@PathVariable int no,Model model, HttpSession session) {
		
		model.addAllAttributes(trendyFoodsService.getOneDetail(no, session));
		
		return "trendyFoodDetailPage";
	}
	

}
