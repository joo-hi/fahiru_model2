package com.fas.fahiru.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.fas.fahiru.service.CookTipsService;
import com.fas.fahiru.service.CooksService;
import com.fas.fahiru.service.FahsService;
import com.fas.fahiru.service.IngredientsService;
import com.fas.fahiru.service.PostFahsService;
import com.fas.fahiru.service.SourcesService;
import com.fas.fahiru.service.StepsService;
import com.fas.fahiru.service.TfCooksService;
import com.fas.fahiru.service.UsersService;
import com.fas.fahiru.vo.Cook;
import com.fas.fahiru.vo.CookTip;
import com.fas.fahiru.vo.Ingredient;
import com.fas.fahiru.vo.PostFah;
import com.fas.fahiru.vo.Source;
import com.fas.fahiru.vo.Step;
import com.fas.fahiru.vo.TfCook;
import com.fas.fahiru.vo.User;

@Controller
public class CookController {
	
	private TfCooksService tfCooksService;
	private CooksService cooksService;
	private SourcesService sourcesService;
	private StepsService stepsService;
	private PostFahsService postFahsService;
	private IngredientsService ingredientsService;
	private UsersService usersService;
	// 07100710 주하
	private CookTipsService cookTipsService;
	
	public void setCookTipsService(CookTipsService cookTipsService) {
		this.cookTipsService = cookTipsService;
	}
	
	public void setUsersService(UsersService usersService) {
		this.usersService = usersService;
	}
	
	public void setIngredientsService(IngredientsService ingredientsService) {
		this.ingredientsService = ingredientsService;
	}
	
	public void setCooksService(CooksService cooksService) {
		this.cooksService = cooksService;
	}
	
	public void setPostFahsService(PostFahsService postFahsService) {
		this.postFahsService = postFahsService;
	}
	
	public void setSourcesService(SourcesService sourcesService) {
		this.sourcesService = sourcesService;
	}
	
	public void setStepsService(StepsService stepsService) {
		this.stepsService = stepsService;
	}
	
	public void setTfCooksService(TfCooksService tfCooksService) {
		this.tfCooksService = tfCooksService;
	}
	
	@RequestMapping(value="/cook", method=RequestMethod.GET)
	public String cookForm() {
		
		return "cookForm";
	}
	
	// 리다이렉트 수정 필요
	@RequestMapping(value="/cook", method=RequestMethod.POST)
	public String cook(TfCook tfCook, Cook cook, Step step, PostFah postFah, 
						String name, String openAccept, String tipAccept,
						Ingredient ingredient, String[] ingredientsName, 
						String[] ingredientsUnit, String[] inputFahNo, 
						Source source, String[] sourceName, String[] sourceAmmount, 
						String[] sourceUnit, String[] stepContents, String[] stepImg,
						String[] cookOrder, User user, HttpSession session) {

		//session.setAttribute("loginUser", usersService.doLogin(user));

		// VALUES(#{no}, #{userNo}, 3, 0.0, #{name}, #{img}, null)
		tfCooksService.insert(tfCook);
		
//		System.out.println(tfCook.getUserNo());
//		System.out.println(tfCook.getImg());
		
		// setting
		cook.setNo(tfCook.getNo());
		
		postFah.setPostNo(tfCook.getNo());
		// VALUES(POST_FAHS_SEQ.NEXTVAL, 3, #{fahNo}, #{postNo}, SYSTIMESTAMP)
		postFahsService.insert(postFah, inputFahNo);

		// VALUES(#{no}, #{cookTime}, #{cookAmount}, #{openAccept}, #{tipAccept}, SYSTIMESTAMP, 0.0, 0.0)
		cooksService.insert(cook, name, openAccept, tipAccept);
		
		source.setCookNo(tfCook.getNo());
		// VALUES(SOURCES_SEQ.NEXTVAL, #{cookNo}, #{name}, #{unit}, #{ammount})
		sourcesService.insert(source, sourceName, sourceAmmount, sourceUnit);
		
		ingredient.setCookNo(tfCook.getNo());
		// VALUES(INGREDIENTS_SEQ.NEXTVAL, #{cookNo}, #{name}, #{unit})
		ingredientsService.insert(ingredient, ingredientsName, ingredientsUnit);
		
		step.setCookNo(tfCook.getNo());
		// VALUES(STEPS_SEQ.NEXTVAL, #{cookNo}, #{cookStepImg}, #{cookStepTxt}, #{cookOrder})
		stepsService.insert(step, stepContents, stepImg, cookOrder);
		
		System.out.println("스텝 사진"+step.getCookStepImg());

		return "redirect:/cook/"+cook.getNo();
	}
	
	@RequestMapping(value="/cook/{no}",method=RequestMethod.GET)
	public String CookDetail(Model model, @PathVariable int no, HttpSession session) {
		// /cook/{no}/page/{page}
		// Model model, @PathVariable int no, @PathVariable int page
		
		CookTip cookTip = new CookTip();
		
		model.addAllAttributes(cooksService.getOneCooksDetail(no, session));
		
		return "cookDetailPage";
	}


	@RequestMapping(value="/cookTip/{no}",method=RequestMethod.DELETE)
	public String delete (@PathVariable int no,@RequestHeader String referer) {
		System.out.println("여긴 옴");
		System.out.println(no);
		cookTipsService.remove(no);
		
		return "redirect:"+referer;
	}
}
