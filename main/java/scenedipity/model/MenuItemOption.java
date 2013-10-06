package scenedipity.model;

import java.util.List;

public class MenuItemOption{
	private String item_options_name;
	private String menu_item_option_information;
	private String menu_item_option_min_selected;
	private String menu_item_option_max_selected;
	private List<MenuItemOptionItem> option_items;
	
	public String getItem_options_name() {
		return item_options_name;
	}
	public void setItem_options_name(String item_options_name) {
		this.item_options_name = item_options_name;
	}
	public String getMenu_item_option_information() {
		return menu_item_option_information;
	}
	public void setMenu_item_option_information(String menu_item_option_information) {
		this.menu_item_option_information = menu_item_option_information;
	}
	public String getMenu_item_option_min_selected() {
		return menu_item_option_min_selected;
	}
	public void setMenu_item_option_min_selected(
			String menu_item_option_min_selected) {
		this.menu_item_option_min_selected = menu_item_option_min_selected;
	}
	public String getMenu_item_option_max_selected() {
		return menu_item_option_max_selected;
	}
	public void setMenu_item_option_max_selected(
			String menu_item_option_max_selected) {
		this.menu_item_option_max_selected = menu_item_option_max_selected;
	}
	public List<MenuItemOptionItem> getOption_items() {
		return option_items;
	}
	public void setOption_items(List<MenuItemOptionItem> option_items) {
		this.option_items = option_items;
	}
}