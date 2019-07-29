package com.fas.fahiru.controller;

import java.sql.Date; 

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.fas.fahiru.service.UsersService;
import com.fas.fahiru.vo.User;

@Controller
public class UserController {
	
	private UsersService usersService;
	
	public void setUsersService(UsersService usersService) {
		this.usersService = usersService;
	}
	
	@RequestMapping(value="/session", method=RequestMethod.GET)
	public String login() {
		
		return "login";
	}
	
	@RequestMapping(value="/session", method=RequestMethod.POST)
	public String loginDo(User user, HttpSession session) {
		
		if(usersService.doLogin(user)==null) {
			return "login";
		}else {
			session.setAttribute("loginUser", usersService.doLogin(user));
		}
		
		return "redirect:/";
	}
	
	@RequestMapping(value="/session", method=RequestMethod.DELETE)
	public String logout(HttpSession session) {
		
		session.removeAttribute("loginUser");
		
		return "redirect:/";
	}
	//	0708 서승현
	@RequestMapping(value = "/user/{no}", method = RequestMethod.GET)
	public String getUser(Model model, @PathVariable int no) {
		model.addAttribute("user",usersService.getUser(no));
		return "myPage";
	}
	@RequestMapping(value = "/information/{no}",method =RequestMethod.GET)
	public String informationModifyForm(Model model,@PathVariable int no ) {
		model.addAttribute("user",usersService.getUser(no));
		return "infomationUpdate";
	}
	
	@RequestMapping(value = "/information/{no}",method =RequestMethod.PUT)
	public String informationModify(User user,@PathVariable int no,String year,String month,String date) {
		Date birthDate = Date.valueOf(year+"-"+month+"-"+date);
		user.setBirthDate(birthDate);
		usersService.informationModify(user);
		return "redirect:/user/"+no;
	}
	//	0708 서승현end
	
	//---------------->0709 자현
		@RequestMapping(value="/join", method=RequestMethod.GET)
		public String signForm() {
			
			return "sign";
		}//signForm() end
		
		
		@RequestMapping(value="/join", method=RequestMethod.POST)
		public String sign(User user, @RequestHeader String referer, int year, int month, int date) {
			
			String birth = year+"-"+month+"-"+date;
			
			Date birthDate = Date.valueOf(birth);
			
			user.setBirthDate(birthDate);
			
			usersService.sign(user);
			
			return "redirect:/index";
		}//sign() end
		//<--------------------0709 자현
	

}
