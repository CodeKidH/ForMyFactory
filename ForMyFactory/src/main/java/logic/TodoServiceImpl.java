package logic;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import dao.TodoDao;

@Service
@Transactional
public class TodoServiceImpl implements TodoService{
	
	@Autowired
	private TodoDao tododao;
	
	public List<Todo> getTodoList(){
		return this.tododao.findAll();
	}
	
	public void entryTodo(Todo todo){
		this.tododao.create(todo);
	}
	
	public void deleteTodo(int list){
		this.tododao.delete(list);
	}
	
	public void rateTodo(int list,int rate){
		this.tododao.rateUpdate(list,rate);
	}
	
}
