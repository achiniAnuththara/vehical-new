package OnlineVehicleServicePackage;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class FuelController {
	private static boolean isSuccess;
	private static Connection con = null;
	private static Statement stmt = null;
	private static ResultSet rs = null;

	// insertData function
	public static boolean insertData(String fuel_type, double quantity_liters, double price_per_liter,
			String supplier_name, LocalDate added_date) {
		boolean isSuccess = false;

		try {
			con = DBConnection.getConnection();
			stmt = con.createStatement();

			String added_date_str = added_date.toString();
			String sql = "INSERT INTO fuel (fuel_type, quantity_liters, price_per_liter, supplier_name, added_date) "
					+ "VALUES ('" + fuel_type + "', " + quantity_liters + ", " + price_per_liter + ", '" + supplier_name
					+ "', '" + added_date_str + "')";

			int rs = stmt.executeUpdate(sql);
			if (rs > 0) {
				isSuccess = true;
			} else {
				isSuccess = false;
			}

		} catch (Exception e) {
			System.out.println("Insert error: ");
			e.printStackTrace(); // This will show the actual error
		}
		return isSuccess;
	}

	// GetById
	public static List<FuelModel> getById(String id) {
		int convertID = Integer.parseInt(id);
		ArrayList<FuelModel> fuel = new ArrayList<>();
		Connection con = null;
		Statement stmt = null;

		try {
			// DBConnection
			con = DBConnection.getConnection();
			stmt = con.createStatement();
			ResultSet rs = null;

			String sql = "SELECT * FROM fuel WHERE fuel_id = " + convertID;
			rs = stmt.executeQuery(sql);

			while (rs.next()) {
				int fuel_id = rs.getInt(1);
				String fuel_type = rs.getString(2);
				double quantity_liters = rs.getDouble(3);
				double price_per_liter = rs.getDouble(4);
				double total_price = rs.getDouble(5);
				String supplier_name = rs.getString(6);
				LocalDate added_date = rs.getDate(7).toLocalDate();

				FuelModel fl = new FuelModel(fuel_id, fuel_type, quantity_liters, price_per_liter, supplier_name,
						added_date);
				fuel.add(fl);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return fuel;
	}

	// get all data
	public static List<FuelModel> getAllFuel() {
		ArrayList<FuelModel> fuelAll = new ArrayList<>();

		try {
			// DBConnection
			con = DBConnection.getConnection();
			stmt = con.createStatement();
			ResultSet rs = null;

			String sql = "select * from fuel";
			rs = stmt.executeQuery(sql);

			while (rs.next()) {
				int fuel_id = rs.getInt(1);
				String fuel_type = rs.getString(2);
				double quantity_liters = rs.getDouble(3);
				double price_per_liter = rs.getDouble(4);
				double total_price = rs.getDouble(5);
				String supplier_name = rs.getString(6);
				LocalDate added_date = rs.getDate(7).toLocalDate();

				FuelModel fl = new FuelModel(fuel_id, fuel_type, quantity_liters, price_per_liter, supplier_name,
						added_date);
				fuelAll.add(fl);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return fuelAll;
	}

	// Update data
	public static boolean updatedata(int fuel_id, String fuel_type, double quantity_liters, double price_per_liter,
			String supplier_name, LocalDate added_date) {
		boolean isSuccess = false;

		try {
			con = DBConnection.getConnection();
			stmt = con.createStatement();
			String added_date_str = added_date.toString();

			String sql = "UPDATE fuel SET fuel_type = '" + fuel_type + "', quantity_liters = " + quantity_liters
					+ ", price_per_liter = " + price_per_liter + ", supplier_name = '" + supplier_name
					+ "', added_date = '" + added_date_str + "' WHERE fuel_id = " + fuel_id;

			System.out.println("SQL Update: " + sql); // Debug print
			int rs = stmt.executeUpdate(sql);

			if (rs > 0) {
				isSuccess = true;
			} else {
				isSuccess = false;
			}

		} catch (Exception e) {
			System.out.println("Update error:");
			e.printStackTrace(); // VERY IMPORTANT — this shows the real error
		}

		return isSuccess;
	}

	//delete data
	public static boolean deletedata(String id) {
		if (id == null || id.isEmpty()) {
			System.out.println("Error: ID is null or empty.");
			return false; // Or handle it as needed
		}

		int convID;
		try {
			convID = Integer.parseInt(id);
		} catch (NumberFormatException e) {
			System.out.println("Error: Invalid ID format.");
			return false;
		}

		boolean isSuccess = false;
		try {
			// DBConnection
			con = DBConnection.getConnection();
			stmt = con.createStatement();
			String sql = "DELETE FROM fuel WHERE fuel_id = " + convID;

			int rs = stmt.executeUpdate(sql);
			if (rs > 0) {
				isSuccess = true;
			} else {
				isSuccess = false;
			}
		} catch (Exception e) {
			System.out.println("Delete error:");
			e.printStackTrace();
		}
		return isSuccess;
	}

}
