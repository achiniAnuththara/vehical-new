package OnlineVehicleServicePackage;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {
	private static String url = "jdbc:mysql://localhost:3306/vehicleservice";
    private static String user = "root";
    private static String pass = "29014";
    private static Connection con;

    public static Connection getConnection() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver"); // Updated driver class
            con = DriverManager.getConnection(url, user, pass);
        } catch (Exception e) {
            System.out.println("Database not connected!");
            e.printStackTrace(); // Print actual error
        }
        return con;
    }
}