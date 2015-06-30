package logic;

import java.io.InputStream;
import java.util.List;

public interface ItemService {
	
	List<Item> getItemList();
	
	Item getItemByItemId(Integer itemId);
	
	void entryItem(Item item);
	
	void deleteItem(Integer itemId);
	
	void updateItem(Item item);
	
	List<Item> getItemByItemName(String itemName);
	
	InputStream getPicture(Integer itemId);
}
