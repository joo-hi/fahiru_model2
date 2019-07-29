package com.fas.fahiru.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.fas.fahiru.service.TfCooksService;

@Controller
public class FormController {
	
	private TfCooksService tfCooksService;
	
	public void setTfCooksService(TfCooksService tfCooksService) {
		this.tfCooksService = tfCooksService;
	}

	
	@RequestMapping(value="/trendy/food", method=RequestMethod.POST)
	public String registerTFCook(int spotNo, int price, int userNo, String trendyFoodName, String uploadImage, int[] fahNo) {
		
		System.out.println(spotNo);
		System.out.println(price);
		System.out.println(userNo);
		System.out.println(trendyFoodName);
		System.out.println(uploadImage);
		
		for (int i : fahNo) {
			System.out.println("fahNo:"+i);
		}
		
		tfCooksService.registerTF(spotNo, price, userNo, trendyFoodName, uploadImage, fahNo);
		
		return "redirect:/index";
	}//registerTF() end
	
	
	//trendyFoodSearchForm 
	@RequestMapping(value="/trendy/food/check", method=RequestMethod.GET)
	public String tfSearchForm() {
		       
		return "trendyFoodSearchForm";
	}//tfSearchForm() end
	
	
	
	//trendyFood 등록 form
	@RequestMapping(value="/trendy/food", method=RequestMethod.GET)
	public String tfAdd() {
		
		return "trendyFoodForm";
	}//tfAdd() end
}
