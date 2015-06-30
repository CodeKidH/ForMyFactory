package controller;

import java.io.BufferedInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import logic.Item;
import logic.ItemService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class WebController {
	
	@Autowired
	private ItemService itemService;


	@RequestMapping
	public ModelAndView linux() {
			
		List<Item> itemList = this.itemService.getItemList();

		// 모델 생성
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("itemList", itemList);
		
		ModelAndView modelAndView = new ModelAndView("/web/linux");
		modelAndView.addAllObjects(model);
		
		return modelAndView;
	}
	
	@RequestMapping(value = "/spring")
	public ModelAndView spring(){
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/web/spring");
		return modelAndView;
	}
	
	
	@RequestMapping(value = "/search", method=RequestMethod.POST)
	public ModelAndView search(String itemName){
		if(itemName == null || itemName.equals("")){
			return this.linux();
		}
		
		List<Item> itemList = this.itemService.getItemByItemName(itemName);
		
		if(itemList == null || itemList.isEmpty()){
			return this.linux();
		}
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("itemList", itemList);
		modelAndView.setViewName("/web/linux");
		return modelAndView;
		
	}
	@RequestMapping(value = "/detail")
	public ModelAndView detail(Integer itemId){
		
		List<Item> itemList = this.itemService.getItemList();
		Item item = this.itemService.getItemByItemId(itemId);
		
		Map <String, Object> model = new HashMap<String, Object>();
		model.put("item", item);
		model.put("itemList", itemList);
		
		ModelAndView modelAndView = new ModelAndView("/web/detail");
		modelAndView.addAllObjects(model);
		return modelAndView;
	}
	
	@RequestMapping(value = "/create")
	public ModelAndView create(){
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/create/create");
		modelAndView.addObject(new Item());
		return modelAndView;
	}
	
	@RequestMapping(value = "/delete")
	public ModelAndView delete(Integer itemId){
		this.itemService.deleteItem(itemId);
		return this.linux();
		
	}
	
	@RequestMapping(method = RequestMethod.POST)
	public ModelAndView register(@Valid Item item, BindingResult bindingResult){
		if (bindingResult.hasErrors()) {
			ModelAndView modelAndView = new ModelAndView("/create/create");
			modelAndView.getModel().putAll(bindingResult.getModel());
			return modelAndView;
		}
		this.itemService.entryItem(item);
		return this.linux();
	}
	
	@RequestMapping(value = "/edit")
	public ModelAndView edit(Integer itemId){
		ModelAndView modelAndView = new ModelAndView("/update/update");
		Item item = this.itemService.getItemByItemId(itemId);
		modelAndView.addObject(item);
		return modelAndView;
	}
	
	@RequestMapping(value = "/update.html" ,method = RequestMethod.POST)
	public ModelAndView update(@Valid Item item, BindingResult bindingResult){
		if (bindingResult.hasErrors()) {
			ModelAndView modelAndView = new ModelAndView("/update/update");
			modelAndView.getModel().putAll(bindingResult.getModel());
			return modelAndView;
		}
		this.itemService.updateItem(item);
		return this.linux();
	}
	
	@RequestMapping("/image.html")
	public void image(Integer itemId, HttpServletResponse response) {
		response.setContentType("image/jpeg");
		InputStream picture = null;
		OutputStream os = null;
		BufferedInputStream bis = null;
		try {
			picture = this.itemService.getPicture(itemId);
			os = response.getOutputStream();
			bis = new BufferedInputStream(picture);
			int data;
			while ((data = bis.read()) != -1) {
				os.write(data);
			}
		} catch (IOException e) {
			throw new RuntimeException(e);
		} finally {
			try {
				if (picture != null) {
					picture.close();
					os.close();
					bis.close();
				}
			} catch (IOException e) {
				// close 안 되는 것뿐이므로 무시한다
			}

		}
	}
	
}
