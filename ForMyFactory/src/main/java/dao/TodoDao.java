package dao;

import java.util.List;

import logic.Todo;

public interface TodoDao {
	
	List<Todo> findAll();
	
	void create(Todo todo);
}
