package logic;

import java.util.List;
import java.util.Map;

public interface TodoService{
	
	List<Todo> getTodoList();
	
	void entryTodo(Todo todo);
	
	void deleteTodo(int deleteTodoArr);
	
	void rateTodo(int deleteTodoArr,int rate);
}
