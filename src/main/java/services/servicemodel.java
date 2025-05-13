package services;

import java.time.LocalDate;

public class servicemodel {
    private int service_id;
    private String service_type;
    private String service_description;
    private LocalDate service_date;
    private double service_cost;
    private String service_center;

    public servicemodel(int service_id, String service_type, String service_description, LocalDate service_date, double service_cost,String service_center) {
        super();
    	this.service_id = service_id;
        this.service_type = service_type;
        this.service_description = service_description;
        this.service_date = service_date;
        this.service_cost = service_cost;
        this.service_center=service_center;
    }

	public int getService_id() {
		return service_id;
	}

	public String getService_center() {
		return service_center;
	}

	public void setService_center(String service_center) {
		this.service_center = service_center;
	}

	public void setService_id(int service_id) {
		this.service_id = service_id;
	}

	public String getService_type() {
		return service_type;
	}

	public void setService_type(String service_type) {
		this.service_type = service_type;
	}

	public String getService_description() {
		return service_description;
	}

	public void setService_description(String service_description) {
		this.service_description = service_description;
	}

	public LocalDate getService_date() {
		return service_date;
	}

	public void setService_date(LocalDate service_date) {
		this.service_date = service_date;
	}

	public double getService_cost() {
		return service_cost;
	}

	public void setService_cost(double service_cost) {
		this.service_cost = service_cost;
	}
    	
}