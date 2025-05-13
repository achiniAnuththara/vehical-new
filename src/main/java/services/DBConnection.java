package services;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {
    private static final String url = "jdbc:mysql://localhost:3306/vehicleservice";
    private static final String user = "root";
    private static final String pass = "29014";

    public static Connection getConnection() {
        Connection con = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");  // Ensure the driver JAR is added
            con = DriverManager.getConnection(url, user, pass);
            System.out.println("✅ Database connected!");
        } catch (Exception e) {
            System.out.println("❌ Database connection failed!");
            e.printStackTrace();
        }
        return con;
    }
}
