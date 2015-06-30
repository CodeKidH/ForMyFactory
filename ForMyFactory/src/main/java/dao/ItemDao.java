package dao;

import java.io.InputStream;
import java.util.List;

import logic.Item;

public interface ItemDao {
	
	List<Item> findAll();
	
	Item findByPrimaryKey(Integer itemId);
	
	void create(Item item);
	
	void delete(Integer itemId);
	
	void udpate(Item item);
	
	List<Item> findByItemName(String itemName);
	
	InputStream getPicture(Integer itemId);
}
