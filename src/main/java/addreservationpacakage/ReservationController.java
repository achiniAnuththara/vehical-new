package addreservationpacakage;

import java.sql.Connection;

import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.sql.ResultSet;

public class ReservationController {

    private static Connection con = null;
    private static Statement stmt = null;
    private static ResultSet rs = null;

   
    public static boolean insertData(String customerName, String vehicleNumber, String serviceType, String date, String time) {
        boolean isSuccess = false;

        try {
            con = DBConnection.getConnection();
            stmt = con.createStatement();

            
            String sql = "INSERT INTO reservation (customerName, vehicleNumber, serviceType, date, time) " +
                         "VALUES ('" + customerName + "', '" + vehicleNumber + "', '" + serviceType + "', '" + date + "', '" + time + "')";

            int rs = stmt.executeUpdate(sql);

            if (rs > 0) {
                isSuccess = true;
            } else {
                isSuccess = false;
            }

        } catch (Exception e) {
            System.out.println("Insert Error:");
            e.printStackTrace();
        }

        return isSuccess;
    }
    public static ReservationModel getReservationById(int reservation_id) {
        ReservationModel reservation = null;

        try {
            con = DBConnection.getConnection();
            stmt = con.createStatement();
            String sql = "SELECT * FROM reservation WHERE reservation_id = " + reservation_id;
            rs = stmt.executeQuery(sql);

            if (rs.next()) {
                reservation = new ReservationModel();
                reservation.setReservationId(rs.getInt("reservation_id")); // Match DB column name
                reservation.setCustomerName(rs.getString("customerName"));
                reservation.setVehicleNumber(rs.getString("vehicleNumber"));
                reservation.setServiceType(rs.getString("serviceType"));
                reservation.setDate(rs.getString("date"));
                reservation.setTime(rs.getString("time"));
            }

        } catch (Exception e) {
            System.out.println("Get by ID error:");
            e.printStackTrace();
        }

        return reservation;
    }

    public static List<ReservationModel> getAllReservations() {
        List<ReservationModel> reservations = new ArrayList<>();

        try {
            con = DBConnection.getConnection();
            stmt = con.createStatement();
            String sql = "SELECT * FROM reservation";
            rs = stmt.executeQuery(sql);

            while (rs.next()) {
                int id = rs.getInt("reservation_id"); 
                String name = rs.getString("customerName");
                String vehicle = rs.getString("vehicleNumber");
                String service = rs.getString("serviceType");
                String date = rs.getString("date");
                String time = rs.getString("time");

                ReservationModel res = new ReservationModel(id, name, vehicle, service, date, time);
                reservations.add(res);
            }

            System.out.println("Total reservations fetched: " + reservations.size());

        } catch (Exception e) {
            System.out.println("Error in getAllReservations:");
            e.printStackTrace();
        }

        return reservations;
    }
    public static boolean updateReservation(int reservationId, String customerName, String vehicleNumber, String serviceType, String date, String time) {
        boolean isSuccess = false;

        try {
            con = DBConnection.getConnection();
            stmt = con.createStatement();

            String sql = "UPDATE reservation SET " +
                         "customerName = '" + customerName + "', " +
                         "vehicleNumber = '" + vehicleNumber + "', " +
                         "serviceType = '" + serviceType + "', " +
                         "date = '" + date + "', " +
                         "time = '" + time + "' " +
                         "WHERE reservation_id = " + reservationId;

            int rs = stmt.executeUpdate(sql);

            if (rs > 0) {
                isSuccess = true;
            } else {
                isSuccess = false;
            }

        } catch (Exception e) {
            System.out.println("Update Error:");
            e.printStackTrace();
        }

        return isSuccess;
    }

    public static boolean deleteReservation(int reservationId) {
        boolean isSuccess = false;

        try {
            con = DBConnection.getConnection();
            stmt = con.createStatement();

            String sql = "DELETE FROM reservation WHERE reservation_id = " + reservationId;

            int rs = stmt.executeUpdate(sql);

            if (rs > 0) {
                isSuccess = true;
            } else {
                isSuccess = false;
            }

        } catch (Exception e) {
            System.out.println("Delete Error:");
            e.printStackTrace();
        }

        return isSuccess;
    }



    
}


