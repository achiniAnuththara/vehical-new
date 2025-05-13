package addreservationpacakage;

public class ReservationModel {
    private int reservationId;
    private String customerName;
    private String vehicleNumber;
    private String serviceType;
    private String date;
    private String time;

    
    public ReservationModel() {
    }

   
    public ReservationModel(int reservation_Id, String customerName, String vehicleNumber, String serviceType, String date, String time) {
        this.reservationId = reservation_Id;
        this.customerName = customerName;
        this.vehicleNumber = vehicleNumber;
        this.serviceType = serviceType;
        this.date = date;
        this.time = time;
    }

    
    public int getReservationId() {
        return reservationId;
    }

    public void setReservationId(int reservation_Id) {
        this.reservationId = reservation_Id;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public String getVehicleNumber() {
        return vehicleNumber;
    }

    public void setVehicleNumber(String vehicleNumber) {
        this.vehicleNumber = vehicleNumber;
    }

    public String getServiceType() {
        return serviceType;
    }

    public void setServiceType(String serviceType) {
        this.serviceType = serviceType;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }
}


