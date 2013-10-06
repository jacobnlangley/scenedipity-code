package scenedipity.model;

import java.util.List;

import org.codehaus.jackson.annotate.JsonCreator;
import org.codehaus.jackson.annotate.JsonProperty;

public class MenuItem {

	private String item_uid;
	private boolean disabled;
	private boolean halal;
	private boolean kosher;
	private boolean gluten_free;
	private boolean vegan;
	private boolean vegetarian;
	private String menu_item_name;
	private String menu_item_description;
	private String menu_item_price;
	private int menu_item_calories;
	private String menu_item_allergy_information;
	private String menu_item_allergy_information_allergens;
	private String menu_item_heat_index;
	private String special;

	private List<MenuItemOption> menu_item_options;

	private List<MenuItemSize> menu_item_sizes;
	public static class MenuItemSize{
		private String menu_item_size_name;
		private String menu_item_size_description;
		private String menu_item_size_price;
		private String menu_item_size_calories;

	}

	private List<MenuItemTag> menu_item_tags;
	public static class MenuItemTag{
		private String menu_item_tage;
	}

	private List<MenuItemImage> menu_item_images;
	public static class MenuItemImage{
		public String image_url;
		public int width;
		public int height;
		public String image_type_id;
		public String image_type;
		public String image_media_id;
		public String image_media;
	}

	private boolean check(String s){
		return s.equalsIgnoreCase("1") || s.equalsIgnoreCase("true");
	}
	
	@JsonCreator
	public MenuItem(
			@JsonProperty("item_uid") String _item_uid,
			@JsonProperty("disabled") String _disabled,
			@JsonProperty("halal") String _halal,
			@JsonProperty("kosher") String _kosher,
			@JsonProperty("vegan") String _vegan,
			@JsonProperty("vegetarian") String _vegetarian,
			@JsonProperty("gluten_free") String _gluten_free,
			@JsonProperty("menu_item_allergy_information") String _menu_item_allergy_information,
			@JsonProperty("menu_item_allergy_information_allergens") String _menu_item_allergy_information_allergens,
			@JsonProperty("menu_item_calories") int _menu_item_calories,
			@JsonProperty("menu_item_description") String _menu_item_description,
			@JsonProperty("menu_item_heat_index") String _menu_item_heat_index,
			@JsonProperty("menu_item_name") String _menu_item_name,
			@JsonProperty("menu_item_price") String _menu_item_price,
			@JsonProperty("menu_item_options") Object _menu_item_options,
			@JsonProperty("menu_item_sizes") Object _menu_item_sizes,
			@JsonProperty("menu_item_tags")Object _menu_item_tags,
			@JsonProperty("special") String _special
	){
		item_uid=_item_uid;
		disabled= check(_disabled);
		halal= check(_halal);
		kosher= check(_kosher);
		vegan= check(_vegan);
		vegetarian=check(_vegetarian);
		gluten_free=check(_gluten_free);
		menu_item_allergy_information=_menu_item_allergy_information;
		menu_item_allergy_information_allergens=_menu_item_allergy_information_allergens;
		menu_item_calories=_menu_item_calories;
		menu_item_description=_menu_item_description;
		menu_item_heat_index=_menu_item_heat_index;
		menu_item_name=_menu_item_name;
		menu_item_price=_menu_item_price;
		menu_item_options= (List<MenuItemOption>)_menu_item_options;
		menu_item_sizes=(List<MenuItemSize>)_menu_item_sizes;
		menu_item_tags= ( List<MenuItemTag> )_menu_item_tags;
		special=_special;
	}

	public String getItem_uid() {
		return item_uid;
	}
	public void setItem_uid(String item_uid) {
		this.item_uid = item_uid;
	}

	public boolean getDisabled() {
		return disabled;
	}
	public void setDisabled(boolean disabled) {
		this.disabled = disabled;
	}

	public boolean getHalal() {
		return halal;
	}
	public void setHalal(boolean halal) {
		this.halal = halal;
	}

	public boolean getKosher() {
		return kosher;
	}
	public void setKosher(boolean kosher) {
		this.kosher = kosher;
	}

	public String getMenu_item_allergy_information() {
		return menu_item_allergy_information;
	}
	public void setMenu_item_allergy_information(
			String menu_item_allergy_information) {
		this.menu_item_allergy_information = menu_item_allergy_information;
	}

	public String getMenu_item_allergy_information_allergens() {
		return menu_item_allergy_information_allergens;
	}
	public void setMenu_item_allergy_information_allergens(
			String menu_item_allergy_information_allergens) {
		this.menu_item_allergy_information_allergens = menu_item_allergy_information_allergens;
	}

	public int getMenu_item_calories() {
		return menu_item_calories;
	}
	public void setMenu_item_calories(int menu_item_calories) {
		this.menu_item_calories = menu_item_calories;
	}

	public String getMenu_item_description() {
		return menu_item_description;
	}
	public void setMenu_item_description(String menu_item_description) {
		this.menu_item_description = menu_item_description;
	}

	public String getMenu_item_heat_index() {
		return menu_item_heat_index;
	}
	public void setMenu_item_heat_index(String menu_item_heat_index) {
		this.menu_item_heat_index = menu_item_heat_index;
	}

	public String getMenu_item_name() {
		return menu_item_name;
	}
	public void setMenu_item_name(String menu_item_name) {
		this.menu_item_name = menu_item_name;
	}

	public List<MenuItemOption> getMenu_item_options() {
		return menu_item_options;
	}
	public void setMenu_item_options(List<MenuItemOption> menu_item_options) {
		this.menu_item_options = menu_item_options;
	}

	public String getMenu_item_price() {
		return menu_item_price;
	}
	public void setMenu_item_price(String menu_item_price) {
		this.menu_item_price = menu_item_price;
	}

	public List<MenuItemSize> getMenu_item_sizes() {
		return menu_item_sizes;
	}
	public void setMenu_item_sizes(List<MenuItemSize> menu_item_sizes) {
		this.menu_item_sizes = menu_item_sizes;
	}
	public List<MenuItemTag> getMenu_item_tags() {
		return menu_item_tags;
	}
	public void setMenu_item_tags(List<MenuItemTag> menu_item_tags) {
		this.menu_item_tags = menu_item_tags;
	}

	public String getSpecial() {
		return special;
	}
	public void setSpecial(String special) {
		this.special = special;
	}

	public boolean getVegan() {
		return vegan;
	}
	public void setVegan(boolean vegan) {
		this.vegan = vegan;
	}

	public boolean getVegetarian() {
		return vegetarian;
	}
	public void setVegetarian(boolean vegetarian) {
		this.vegetarian = vegetarian;
	}
	
	public boolean getGluten_free() {
		return gluten_free;
	}
	public void setGluten_free(boolean gf) {
		this.gluten_free = gf;
	}
}
