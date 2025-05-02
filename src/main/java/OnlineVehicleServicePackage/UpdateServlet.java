package OnlineVehicleServicePackage;

import java.io.IOException;
import java.time.LocalDate;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/UpdateServlet")
public class UpdateServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // Get parameters
            int fuel_id = Integer.parseInt(request.getParameter("fuel_id")); // ✅ FIXED: Pass correct fuel_id
            String fuel_type = request.getParameter("fuel_type");
            double quantity_liters = Double.parseDouble(request.getParameter("quantity_liters"));
            double price_per_liter = Double.parseDouble(request.getParameter("price_per_liter"));
            String supplier_name = request.getParameter("supplier_name");
            String added_date_str = request.getParameter("added_date");
            LocalDate added_date = LocalDate.parse(added_date_str);

            // Call update method
            boolean isTrue = FuelController.updatedata(fuel_id, fuel_type, quantity_liters, price_per_liter, supplier_name, added_date);

            // Debug log
            System.out.println("Update result: " + isTrue);

            if (isTrue) {
                List<FuelModel> fueldetails = FuelController.getById(String.valueOf(fuel_id));
                request.setAttribute("fueldetails", fueldetails);
                response.getWriter().println("<script> alert('Data Update Successful'); window.location.href='GetAllServlet'; </script>");
            } else {
                System.out.println("Update failed. Forwarding to wrong.jsp");
                RequestDispatcher dis2 = request.getRequestDispatcher("wrong.jsp");
                dis2.forward(request, response);
            }

        } catch (Exception e) {
            System.out.println("Servlet error:");
            e.printStackTrace(); // Will show actual issue
            response.sendRedirect("wrong.jsp");
        }
    }
}
