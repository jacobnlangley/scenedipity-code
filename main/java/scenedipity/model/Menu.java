package scenedipity.model;

import java.util.ArrayList;
import java.util.List;

import org.codehaus.jackson.annotate.JsonCreator;
import org.codehaus.jackson.annotate.JsonProperty;
import org.ektorp.support.CouchDbDocument;

public class Menu  extends CouchDbDocument{
	
	@JsonProperty("_id")				private String id;
	@JsonProperty("_rev")			private String rev;
	private boolean disabled;
	private String menu_uid;
	private String menu_name; 
	private String menu_description;
	private String menu_note;
	private String currency_symbol; 
	private String language;
	private String menu_duration_name;
	private String menu_duration_time_start;
	private String menu_duration_time_end;
	private List<MenuGroup> menu_groups;
	
	private boolean check(String s){
		return s.equalsIgnoreCase("1") || s.equalsIgnoreCase("true");
	}
	
	@JsonCreator
	public Menu(
			@JsonProperty("_id") String id, 
			@JsonProperty("_rev")	String rev, 
			@JsonProperty("disabled")String disabled, 
			@JsonProperty("menu_uid")String menu_uid,
			@JsonProperty("menu_name")String menu_name, 
			@JsonProperty("menu_description")String menu_description, 
			@JsonProperty("menu_note")String menu_note,
			@JsonProperty("currency_symbol")String currency_symbol, 
			@JsonProperty("language")String language, 
			@JsonProperty("menu_duration_name")String menu_duration_name,
			@JsonProperty("menu_duration_time_start")String menu_duration_time_start, 
			@JsonProperty("menu_duration_time_end")String menu_duration_time_end,
			@JsonProperty("menu_groups") Object  menu_groups) {
		super();
		this.id = id;
		this.rev = rev;
		this.disabled = check(disabled);
		this.menu_uid = menu_uid;
		this.menu_name = menu_name;
		this.menu_description = menu_description;
		this.menu_note = menu_note;
		this.currency_symbol = currency_symbol;
		this.language = language;
		this.menu_duration_name = menu_duration_name;
		this.menu_duration_time_start = menu_duration_time_start;
		this.menu_duration_time_end = menu_duration_time_end;
	
		try{
				this.menu_groups = (ArrayList<MenuGroup>) menu_groups;
		}catch(Exception e){}
	}

	public String getId() {
		return id;
	}

	public String getRev() {
		return rev;
	}

	public boolean isDisabled() {
		return disabled;
	}

	public String getMenu_uuid() {
		return menu_uid;
	}

	public String getMenu_name() {
		return menu_name;
	}

	public String getMenu_description() {
		return menu_description;
	}

	public String getMenu_note() {
		return menu_note;
	}

	public String getCurrency_symbol() {
		return currency_symbol;
	}

	public String getLanguage() {
		return language;
	}

	public String getMenu_duration_name() {
		return menu_duration_name;
	}

	public String getMenu_duration_time_start() {
		return menu_duration_time_start;
	}

	public String getMenu_duration_time_end() {
		return menu_duration_time_end;
	}
	
	public List<MenuGroup> getMenu_groups() {
		return menu_groups;
	}

	public void setId(String id) {
		this.id = id;
	}

	public void setRev(String rev) {
		this.rev = rev;
	}

	public void setDisabled(boolean disabled) {
		this.disabled = disabled;
	}

	public void setMenu_uuid(String menu_uuid) {
		this.menu_uid = menu_uuid;
	}

	public void setMenu_name(String menu_name) {
		this.menu_name = menu_name;
	}

	public void setMenu_description(String menu_description) {
		this.menu_description = menu_description;
	}

	public void setMenu_note(String menu_note) {
		this.menu_note = menu_note;
	}

	public void setCurrency_symbol(String currency_symbol) {
		this.currency_symbol = currency_symbol;
	}

	public void setLanguage(String language) {
		this.language = language;
	}

	public void setMenu_duration_name(String menu_duration_name) {
		this.menu_duration_name = menu_duration_name;
	}

	public void setMenu_duration_time_start(String menu_duration_time_start) {
		this.menu_duration_time_start = menu_duration_time_start;
	}

	public void setMenu_duration_time_end(String menu_duration_time_end) {
		this.menu_duration_time_end = menu_duration_time_end;
	}

	public void setMenu_groups(List<MenuGroup> menu_groups) {
		this.menu_groups = menu_groups;
	}
}
