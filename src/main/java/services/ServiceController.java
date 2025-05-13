package services;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class ServiceController {
	
		public static boolean insertData(String service_type, String service_description, LocalDate service_date, double service_cost,String service_center) {
	    boolean isSuccess = false;

	    try {
	        Connection con = DBConnection.getConnection();
	        Statement stmt = con.createStatement();

	        String service_date_str = service_date.toString();

	        String sql = "INSERT INTO service (service_type, service_description, service_date, service_cost,service_center) "
	                   + "VALUES ('" + service_type + "', '" + service_description + "', '" + service_date_str + "', " + service_cost + ",'" + service_center + "')";

	        int rs = stmt.executeUpdate(sql);
	        if (rs > 0) {
	            isSuccess = true;
	        } else {
	            isSuccess = false;
	        }

	    } catch (Exception e) {
	        System.out.println("❌ Insert error:");
	        e.printStackTrace();
	    }

	    return isSuccess;
	}
		
		
		 //GetById
	    public static List<servicemodel> getById(String id){
	    	int convertID= Integer.parseInt(id);
	    	ArrayList<servicemodel>service= new ArrayList<>();
	    	Connection con = null;
	        Statement stmt = null;
	    	
	    	try {
	    		//DBConnection
	    		con = DBConnection.getConnection();
	            stmt = con.createStatement();
	            ResultSet rs=null;
	            
	            String sql = "SELECT * FROM service WHERE service_id = " + convertID;
	            rs = stmt.executeQuery(sql);
	            
	            while(rs.next()) {
	            	int	service_id=rs.getInt(1);
	            	String  service_type=rs.getString(2);
	            	String  service_description=rs.getString(3);
	            	LocalDate  service_date=rs.getDate(4).toLocalDate();
	            	double service_cost=rs.getDouble(5);
	            	String  service_center=rs.getString(6);
	            	
	            	servicemodel sl = new servicemodel(service_id, service_type, service_description, service_date, service_cost, service_center);
	            	service.add(sl);
	     
	            }
	            	
	    		
	    	}catch(Exception e) {
	    		e.printStackTrace();
	    	}
	    	return service;
	    }
	    
	    //get all data
	    public static List<servicemodel> getAllservice(){
	    	ArrayList<servicemodel>serviceAll= new ArrayList<>();
	    	 Connection con = null;
	         Statement stmt = null;
	         
	         
	    	try {
	    		//DBConnection
	    		con = DBConnection.getConnection();
	            stmt = con.createStatement();
	            ResultSet rs=null;
	            
	            String sql="select * from service";
	            rs = stmt.executeQuery(sql);
	            
	            while(rs.next()) {
	            	int	service_id=rs.getInt(1);
	            	String  service_type=rs.getString(2);
	            	String  service_description=rs.getString(3);
	            	LocalDate  service_date=rs.getDate(4).toLocalDate();
	            	double service_cost=rs.getDouble(5);
	            	String  service_center=rs.getString(6);
	            	
	            	servicemodel sl = new servicemodel(service_id, service_type, service_description, service_date, service_cost,service_center);
	            	serviceAll.add(sl);
	     
	            }
	     
	    	}catch(Exception e) {
	    		e.printStackTrace();
	    	}
	    	return serviceAll;
	    }
	    
	    //Update data
	    public static boolean updateService(int service_id, String service_type, String service_description, LocalDate service_date, double service_cost, String service_center) {
	        boolean isSuccess = false;

	        try {
	            Connection con = DBConnection.getConnection();
	            Statement stmt = con.createStatement();

	            String sql = "UPDATE service SET " +
	                         "service_type = '" + service_type + "', " +
	                         "service_description = '" + service_description + "', " +
	                         "service_date = '" + service_date.toString() + "', " +
	                         "service_cost = " + service_cost + ", " +
	                         "service_center = '" + service_center + "' " +
	                         "WHERE service_id = " + service_id;

	            System.out.println("SQL: " + sql);
	            int rs = stmt.executeUpdate(sql);

	            if (rs > 0) {
	                isSuccess = true;
	            }
	            else {
	            	isSuccess=false;
	            }

	        } catch (Exception e) {
	            System.out.println("Update error:");
	            e.printStackTrace();
	        }

	        return isSuccess;
	    }


	   //delete
	    public static boolean deletedata(String service_id) {
	        boolean isSuccess = false; // ✅ Declare the variable

	        try {
	            int convID = Integer.parseInt(service_id);
	            Connection con = DBConnection.getConnection();
	            Statement stmt = con.createStatement();

	            String sql = "DELETE FROM service WHERE service_id = " + convID;
	            int rs = stmt.executeUpdate(sql);

	            if (rs > 0) {
	                isSuccess = true;
	            }

	        } catch (Exception e) {
	            System.out.println("Delete error:");
	            e.printStackTrace();
	        }

	        return isSuccess;
	    }


}