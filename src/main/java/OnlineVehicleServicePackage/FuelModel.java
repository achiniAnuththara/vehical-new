package OnlineVehicleServicePackage;

import java.time.LocalDate;

public class FuelModel {
	private int fuel_id;
	private String fuel_type;
	private double quantity_liters;
	private double price_per_liter;
	private double total_price;
	private String supplier_name;
	private LocalDate added_date;

	public FuelModel(int fuel_id, String fuel_type, double quantity_liters, double price_per_liter,
			String supplier_name, LocalDate added_date) {
		super();
		this.fuel_id = fuel_id;
		this.fuel_type = fuel_type;
		this.quantity_liters = quantity_liters;
		this.price_per_liter = price_per_liter;
		this.supplier_name = supplier_name;
		this.added_date = added_date;
		this.total_price = this.quantity_liters * this.price_per_liter;
	}

	public int getFuel_id() {
		return fuel_id;
	}

	public void setFuel_id(int fuel_id) {
		this.fuel_id = fuel_id;
	}

	public String getFuel_type() {
		return fuel_type;
	}

	public void setFuel_type(String fuel_type) {
		this.fuel_type = fuel_type;
	}

	public double getQuantity_liters() {
		return quantity_liters;
	}

	public void setQuantity_liters(double quantity_liters) {
		this.quantity_liters = quantity_liters;
		this.total_price = this.quantity_liters * this.price_per_liter;
	}

	public double getPrice_per_liter() {
		return price_per_liter;
	}

	public void setPrice_per_liter(double price_per_liter) {
		this.price_per_liter = price_per_liter;
		this.total_price = this.quantity_liters * this.price_per_liter;
	}

	public double getTotal_price() {
		return total_price;
	}

	public void setTotal_price(double total_price) {
		this.total_price = total_price;
	}

	public String getSupplier_name() {
		return supplier_name;
	}

	public void setSupplier_name(String supplier_name) {
		this.supplier_name = supplier_name;
	}

	public LocalDate getAdded_date() {
		return added_date;
	}

	public void setAdded_date(LocalDate added_date) {
		this.added_date = added_date;
	}

}
