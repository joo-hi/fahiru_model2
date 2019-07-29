package com.fas.fahiru.controller;

import javax.xml.ws.RequestWrapper;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.fas.fahiru.service.SpotsService;
import com.fas.fahiru.vo.Spot;

@Controller
public class SpotController {
	
	private SpotsService spotsService;
	
	public void setSpotsService(SpotsService spotsService) {
		this.spotsService = spotsService;
	}
	
	@RequestMapping(value="/spot/{no}", method=RequestMethod.GET)
	public String search(Model model,@PathVariable int no) {
		
		model.addAllAttributes(spotsService.getOne(no));
		
		return "spotDetailPage";
	}
	
	@RequestMapping(value="/spotCheck", method=RequestMethod.GET)
	public String check() {
		
		return "findMap";
	}
	
	@RequestMapping(value="/spotForm", method=RequestMethod.GET)
	public String register() {
		
		return "spotForm";
	}
	
	@RequestMapping(value="/spotForm", method=RequestMethod.POST)
	public String realRegister(Spot spot) {
		
		spotsService.register(spot);
		
		return "redirect:/spot";
	}
	
	@RequestMapping(value="/spot",method=RequestMethod.GET)
	public String CookDetail() {
		
		// Model model, @PathVariable int no, @PathVariable int page
		
		return "spotListPage";
	}

	
	

}
