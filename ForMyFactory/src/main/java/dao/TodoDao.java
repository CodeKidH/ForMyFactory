package dao;

import java.util.List;
import java.util.Map;

import logic.Todo;

public interface TodoDao {
	
	List<Todo> findAll();
	
	void create(Todo todo);
	
	void delete(int list);
	
	void rateUpdate(int list, int rate);
}
