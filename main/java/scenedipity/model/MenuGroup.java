package scenedipity.model;

import java.util.ArrayList;
import java.util.List;

import org.codehaus.jackson.annotate.JsonCreator;
import org.codehaus.jackson.annotate.JsonIgnore;
import org.codehaus.jackson.annotate.JsonProperty;

public class MenuGroup {
	private String group_name;
	private String group_description;
	private String group_note;
	private String group_uid;
	private boolean disabled;
	private List<MenuGroupOption> menu_group_options;
	public static class MenuGroupOption{ //==============================
		private String group_options_name;
		private String menu_group_option_information;
		private String menu_group_option_min_selected;
		private String menu_group_option_max_selected;
		private ArrayList<GroupOptionItem> option_items;

		public static class GroupOptionItem{//------------------------------
			private String menu_group_option_name;
			private String menu_group_option_additional_cost;

			// --- Getters and Setters
			public String getMenu_group_option_name() {
				return menu_group_option_name;
			}
			public void setMenu_group_option_name(String name) {
				this.menu_group_option_name = name;
			}

			public String getMenu_group_option_additional_cost() {
				return menu_group_option_additional_cost;
			}
			public void setMenu_group_option_additional_cost(
					String cost) {
				this.menu_group_option_additional_cost = cost;
			}
			
		} // end GroupOptionItem------------------------------------------------

		public String getGroup_options_name() {
			return group_options_name;
		}

		public void setGroup_options_name(String group_options_name) {
			this.group_options_name = group_options_name;
		}

		public String getMenu_group_option_information() {
			return menu_group_option_information;
		}

		public void setMenu_group_option_information(
				String menu_group_option_information) {
			this.menu_group_option_information = menu_group_option_information;
		}

		public String getMenu_group_option_min_selected() {
			return menu_group_option_min_selected;
		}

		public void setMenu_group_option_min_selected(
				String menu_group_option_min_selected) {
			this.menu_group_option_min_selected = menu_group_option_min_selected;
		}

		public String getMenu_group_option_max_selected() {
			return menu_group_option_max_selected;
		}

		public void setMenu_group_option_max_selected(
				String menu_group_option_max_selected) {
			this.menu_group_option_max_selected = menu_group_option_max_selected;
		}

		public ArrayList<GroupOptionItem> getOption_items() {
			return option_items;
		}

		public void setOption_items(ArrayList<GroupOptionItem> option_items) {
			this.option_items = option_items;
		}

	}// end MenuGroupOption==========================================

	private List<MenuItem> menu_items;

	@JsonCreator
	public MenuGroup(
			@JsonProperty("group_uid")						String group_uid,
			@JsonProperty("disabled")						boolean disabled,
			@JsonProperty("group_name")					String group_name,
			@JsonProperty("group_description")		String group_description,
			@JsonProperty("group_note")					String group_note,
			@JsonProperty("menu_group_options")	Object options, 
			@JsonProperty("menu_items")					Object items
			){
		super();
		this.group_name = group_name;
		this.group_description = group_description;
		this.group_note = group_note;
		this.group_uid = group_uid;
		this.disabled = disabled;
		
		try{
			this.menu_group_options = (ArrayList<MenuGroupOption>)options;
		}catch(Exception e){}
		try{
			this.menu_items = (ArrayList<MenuItem>) items;
		}catch(Exception e){}
	}


	public String getGroup_name() {
		return group_name;
	}

	public void setGroup_name(String group_name) {
		this.group_name = group_name;
	}

	public String getGroup_description() {
		return group_description;
	}

	public void setGroup_description(String group_description) {
		this.group_description = group_description;
	}

	public String getGroup_note() {
		return group_note;
	}

	public void setGroup_note(String group_note) {
		this.group_note = group_note;
	}

	public String getGroup_uid() {
		return group_uid;
	}

	public void setGroup_uid(String group_uid) {
		this.group_uid = group_uid;
	}

	public boolean isDisabled() {
		return disabled;
	}

	public void setDisabled(boolean disabled) {
		this.disabled = disabled;
	}

	public List<MenuGroupOption> getMenu_group_options() {
		return menu_group_options;
	}

	public void setMenu_group_options(ArrayList<MenuGroupOption> menu_group_options) {
		this.menu_group_options = menu_group_options;
	}

	public List<MenuItem> getMenu_items() {
		return menu_items;
	}

	public void setMenu_items(List<MenuItem> menu_items) {
		this.menu_items = menu_items;
	}
}
