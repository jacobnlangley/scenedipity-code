package scenedipity.model;

public class  Parking{
	private String street_free;
	private String street_metered;
	private String private_lot;
	private String garage;
	private String valet;
	public String getStreet_free() {
		return street_free;
	}
	public void setStreet_free(String street_free) {
		this.street_free = street_free;
	}
	public String getStreet_metered() {
		return street_metered;
	}
	public void setStreet_metered(String street_metered) {
		this.street_metered = street_metered;
	}
	public String getPrivate_lot() {
		return private_lot;
	}
	public void setPrivate_lot(String private_lot) {
		this.private_lot = private_lot;
	}
	public String getGarage() {
		return garage;
	}
	public void setGarage(String garage) {
		this.garage = garage;
	}
	public String getValet() {
		return valet;
	}
	public void setValet(String valet) {
		this.valet = valet;
	}
}