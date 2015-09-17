package controller;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.validation.Valid;

import logic.Todo;
import logic.TodoService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class TodoController {
	
	@Autowired
	private TodoService todoService;
			
	
	@RequestMapping(value = "/todo.html")
	public ModelAndView todo(){
		
		List<Todo> todoList = this.todoService.getTodoList();
		
		Map<String, Object>model = new HashMap<String,Object>();
		model.put("todoList", todoList);
		model.put("todoListSize",todoList.size());
		
		ModelAndView modelAndView = new ModelAndView("/todo/todo");
		modelAndView.addObject(new Todo());
		modelAndView.addAllObjects(model);
		return modelAndView;
	}
	
	
	@RequestMapping(value="/registerToDo", method=RequestMethod.POST)
	public ModelAndView registerToDo(@Valid Todo todo,BindingResult bindingResult) throws SQLException{
		
		if (bindingResult.hasErrors()) {
			ModelAndView modelAndView = new ModelAndView("/todo/todo");
			modelAndView.getModel().putAll(bindingResult.getModel());
			return modelAndView;
		}
		
		this.todoService.entryTodo(todo);
		return this.todo();
	}
	
	@RequestMapping(value="/deleteTodo",method=RequestMethod.POST)
	public ModelAndView deleteTodo( @RequestParam(value="paramMap")String paramMap){
		
	/*	if (bindingResult.hasErrors()) {
			ModelAndView modelAndView = new ModelAndView("/todo/todo");
			modelAndView.getModel().putAll(bindingResult.getModel());
			return modelAndView;
		}*/
		//String aa="1-2-3";
		String[] param = paramMap.split("-");
		
		for(int i = 0; i< param.length; i++){
			
			int a = Integer.parseInt(param[i]);
			this.todoService.deleteTodo(a);
		}
		return this.todo();
	}
	
	@RequestMapping(value="/rateTodo",method=RequestMethod.GET)
	public ModelAndView updateRate(
			@RequestParam(value="todoArray")String todoArray
			,@RequestParam(value="rate")int rate){
			
		/*if (bindingResult.hasErrors()) {
			ModelAndView modelAndView = new ModelAndView("/todo/todo");
			modelAndView.getModel().putAll(bindingResult.getModel());
			return modelAndView;
		}*/
		
		
		String[] param = todoArray.split("-");
		
		for(int i = 0; i< param.length; i++){
			
			int a = Integer.parseInt(param[i]);
			this.todoService.rateTodo(a, rate);
		}
		
		//this.todoService.rateTodo(param, rate);
		
		return this.todo();
		
		
	}
	
	
}
