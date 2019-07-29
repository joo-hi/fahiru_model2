package com.fas.fahiru.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.fas.fahiru.service.FahsService;
import com.fas.fahiru.service.TfCooksService;
import com.fas.fahiru.vo.Fah;

@Controller
public class FahController {
	//의존성
	private FahsService fahsService;
	private TfCooksService tfCooksService;
	
	public void setFahsService(FahsService fahsService) {
		this.fahsService = fahsService;
	}
	
	public void setTfCooksService(TfCooksService tfCooksService) {
		this.tfCooksService = tfCooksService;
	}
	
	/////////////////
	@RequestMapping(value="/fah",method=RequestMethod.GET)
	public String fahList() {
	
		return "fahListPage";
	}
	
	
	
	//근경
	@RequestMapping(value="/fah/{no}",method=RequestMethod.GET)
	public String fahDetail(@PathVariable int no, Model model) {
		
		Fah fah = fahsService.getOne(no);
		model.addAttribute("fahDetail",fah);
		model.addAttribute("fahList", tfCooksService.getFahList(no));
		
		return "fahDetailPage";
	}
	
	
	
}
