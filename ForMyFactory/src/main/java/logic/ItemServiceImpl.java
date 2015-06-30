package logic;

import java.io.InputStream;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import dao.ItemDao;

@Service
@Transactional
public class ItemServiceImpl implements ItemService{
	
	@Autowired
	private ItemDao itemDao;
	
	public List<Item> getItemList(){
		return this.itemDao.findAll();
	}
	
	public Item getItemByItemId(Integer itemId){
		return this.itemDao.findByPrimaryKey(itemId);
	}
	
	public void entryItem(Item item) {
		this.itemDao.create(item);
	}
	
	public void deleteItem(Integer itemId) {
		this.itemDao.delete(itemId);
	}
	
	public void updateItem(Item item) {
		this.itemDao.udpate(item);
	}
	
	public List<Item> getItemByItemName(String itemName) {
		return this.itemDao.findByItemName(itemName);
	}
	
	public InputStream getPicture(Integer itemId) {
		return this.itemDao.getPicture(itemId);
	}
}
