package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class TodoController {
	
	@RequestMapping(value = "/todo.html")
	public ModelAndView todo(){
		ModelAndView modelAndView = new ModelAndView("/todo/todo");
		return modelAndView;
	}
}
