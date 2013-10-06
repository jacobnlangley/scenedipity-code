package scenedipity.model;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import org.codehaus.jackson.annotate.*;
import org.ektorp.support.*;
import org.ektorp.docref.*;
import org.joda.time.*;
import org.springframework.util.*;


public class Restaurant extends CouchDbDocument{
	private Date date_created;
	private Date omf_updated_timestamp;
	private String omf_uuid;
	private String omf_accuracy;
	private String omf_version;
	private String privacy;
	private Company parent_company;
	private OperatingDays operating_days;
	private Parking parking;
	private List<LogoUrl> logo_urls;		
	private List<Contact> contacts;
	private List<AcceptedCurrency> accepted_currencies;
	@TypeDiscriminator
	private RestaurantInfo restaurant_info;
	private RestaurantEnvironment environment_info;
	private List<RestaurantCrosswalk> crosswalks;
	private List<RestaurantSeating> seating_locations;
	private List<RestaurantReservation> online_reservations;
	private List<RestaurantOrdering> online_ordering;
	private List<Menu> menus;

		@JsonCreator
		public Restaurant(
				@JsonProperty("id") String id,
				@JsonProperty("rev") String revision,
				@JsonProperty("date_created")Object date_created,
				@JsonProperty("omf_uuid")String omf_uuid, 
				@JsonProperty("omf_accuracy")String omf_accuracy, 
				@JsonProperty("omf_version")String omf_version,
				@JsonProperty("privacy")String privacy,
				@JsonProperty("omf_updated_timestamp")Object omf_updated_timestamp,
				@JsonProperty("restaurant_info")RestaurantInfo restaurant_info,
				@JsonProperty("environment_info")RestaurantEnvironment environment_info,
				@JsonProperty("parent_company")Company parent_company,
				@JsonProperty("operating_days")OperatingDays operating_days, 
				@JsonProperty("parking")Parking parking,
				@JsonProperty("crosswalks")Object crosswalks,
				@JsonProperty("seating_locations")Object seating_locations,
				@JsonProperty("logo_urls")Object logo_urls,
				@JsonProperty("contacts")Object contacts,
				@JsonProperty("accepted_currencies")Object accepted_currencies,
				@JsonProperty("online_reservations")Object online_reservations,
				@JsonProperty("online_ordering")Object online_ordering, 
				@JsonProperty("menus")Object menus) {
			super();
			SimpleDateFormat omf = new SimpleDateFormat("yyyyMMdd hh:mm:ss");
			try{
				this.date_created = omf.parse((String)date_created);
			this.omf_updated_timestamp =  omf.parse((String)omf_updated_timestamp);
			}catch(Exception e){}
			this.omf_uuid = omf_uuid;
			this.omf_accuracy = omf_accuracy;
			this.omf_version = omf_version;
			this.privacy = privacy;
			this.restaurant_info = restaurant_info;
			this.environment_info = environment_info;
			this.parent_company = parent_company;
			this.operating_days = (OperatingDays) operating_days;
			this.parking = parking;
			this.crosswalks = (List<RestaurantCrosswalk>) crosswalks;
			this.seating_locations = (List<RestaurantSeating>)seating_locations;
			this.logo_urls = (List<LogoUrl>)logo_urls;
			this.contacts =(List<Contact>) contacts;
			this.accepted_currencies = (List<AcceptedCurrency>)accepted_currencies;
			this.online_reservations = (List<RestaurantReservation>) online_reservations;
			this.online_ordering = (List<RestaurantOrdering>)online_ordering;
			this.menus = (List<Menu>) menus;
		}

		public Date getDate_created() {
			return date_created;
		}

		public void setDate_created(Date date_created) {
			this.date_created = date_created;
		}

		public Date getOmf_updated_timestamp() {
			return omf_updated_timestamp;
		}

		public void setOmf_updated_timestamp(Date omf_updated_timestamp) {
			this.omf_updated_timestamp = omf_updated_timestamp;
		}

		public String getOmf_uuid() {
			return omf_uuid;
		}

		public void setOmf_uuid(String omf_uuid) {
			this.omf_uuid = omf_uuid;
		}

		public String getOmf_accuracy() {
			return omf_accuracy;
		}

		public void setOmf_accuracy(String omf_accuracy) {
			this.omf_accuracy = omf_accuracy;
		}

		public String getOmf_version() {
			return omf_version;
		}

		public void setOmf_version(String omf_version) {
			this.omf_version = omf_version;
		}

		public String getPrivacy() {
			return privacy;
		}

		public void setPrivacy(String privacy) {
			this.privacy = privacy;
		}

		public RestaurantInfo getRestaurant_info() {
			return restaurant_info;
		}

		public void setRestaurant_info(RestaurantInfo restaurant_info) {
			this.restaurant_info = restaurant_info;
		}

		public RestaurantEnvironment getEnvironment_info() {
			return environment_info;
		}

		public void setEnvironment_info(RestaurantEnvironment environment_info) {
			this.environment_info = environment_info;
		}

		public Company getParent_company() {
			return parent_company;
		}

		public void setParent_company(Company parent_company) {
			this.parent_company = parent_company;
		}

		public OperatingDays getOperating_days() {
			return operating_days;
		}

		public void setOperating_days(OperatingDays operating_days) {
			this.operating_days = operating_days;
		}

		public Parking getParking() {
			return parking;
		}

		public void setParking(Parking parking) {
			this.parking = parking;
		}

		public List<RestaurantCrosswalk> getCrosswalks() {
			return crosswalks;
		}

		public void setCrosswalks(List<RestaurantCrosswalk> crosswalks) {
			this.crosswalks = crosswalks;
		}

		public List<RestaurantSeating> getSeating_locations() {
			return seating_locations;
		}

		public void setSeating_locations(List<RestaurantSeating> seating_locations) {
			this.seating_locations = seating_locations;
		}

		public List<LogoUrl> getLogo_urls() {
			return logo_urls;
		}

		public void setLogo_urls(List<LogoUrl> logo_urls) {
			this.logo_urls = logo_urls;
		}

		public List<Contact> getContacts() {
			return contacts;
		}

		public void setContacts(List<Contact> contacts) {
			this.contacts = contacts;
		}

		public List<AcceptedCurrency> getAccepted_currencies() {
			return accepted_currencies;
		}

		public void setAccepted_currencies(List<AcceptedCurrency> accepted_currencies) {
			this.accepted_currencies = accepted_currencies;
		}

		public List<RestaurantReservation> getOnline_reservations() {return online_reservations;}
		public void setOnline_reservations(List<RestaurantReservation> online_reservations) {this.online_reservations = online_reservations;}

		public List<RestaurantOrdering> getOnline_ordering() {return online_ordering;}
		public void setOnline_ordering(List<RestaurantOrdering> online_ordering) {this.online_ordering = online_ordering;}

		public List<Menu> getMenus() {return menus;}
		public void setMenus(List<Menu> menus) {this.menus = menus;}


}