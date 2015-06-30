package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ErrorController {
	
	@RequestMapping(value = "sorry.html")
	public ModelAndView error(){
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/error/sorry");
		return modelAndView;
	}
}
