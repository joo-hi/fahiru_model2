package com.fas.fahiru.controller;

import java.net.URLEncoder;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.fas.fahiru.service.FahsService;
import com.fas.fahiru.service.TfCooksService;

@Controller
public class IndexController {
	
	private FahsService fahsService;
	private TfCooksService tfCooksService;
	
	public void setFahsService(FahsService fahsService) {
		this.fahsService = fahsService;
	}
	
	public void setTfCooksService(TfCooksService tfCooksService) {
		this.tfCooksService = tfCooksService;
	}
	
	@RequestMapping(value= {"/", "/index"}, method=RequestMethod.GET)
	public String index(Model model) {
		
		model.addAllAttributes(fahsService.getMainList());
		
		return "main";
	}
	
	@RequestMapping(value="/search", method=RequestMethod.GET)
	public String search(Model model) {
		
		model.addAllAttributes(fahsService.getSearchPageList());
		
		return "search";
	}
	
	@RequestMapping(value="/search", method=RequestMethod.POST)
	public String doSearch(@RequestParam("word") String word) throws Exception {
		word= URLEncoder.encode(word, "UTF-8");
		return "redirect:/search/"+word;
	}
	
	
	@RequestMapping(value="/search/{word}", method=RequestMethod.GET)
	public String searchResult(@PathVariable String word, Model model) {
		model.addAttribute("word",word);		
		return "searchResult";
	}

}
