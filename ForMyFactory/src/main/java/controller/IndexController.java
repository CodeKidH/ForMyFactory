package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class IndexController {
	
	@RequestMapping("/index.html")
	public ModelAndView index(){
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("index");
		return modelAndView;
	}
	
	@RequestMapping("signin.html")
	public ModelAndView signin(){
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/login/signin");
		return modelAndView;
	}
}
