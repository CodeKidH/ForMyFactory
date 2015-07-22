package logic;

import java.util.List;

public interface TodoService{
	
	List<Todo> getTodoList();
	
	void entryTodo(Todo todo);
}
