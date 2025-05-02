package OnlineVehicleServicePackage;

import java.io.IOException;
import java.time.LocalDate;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/InsertFuelServlet")
public class InsertFuelServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // Get form data
            String fuel_type = request.getParameter("fuel_type");
            double quantity_liters = Double.parseDouble(request.getParameter("quantity_liters"));
            double price_per_liter = Double.parseDouble(request.getParameter("price_per_liter"));
            String supplier_name = request.getParameter("supplier_name");
            String added_date_str = request.getParameter("added_date");
            LocalDate added_date = LocalDate.parse(added_date_str);

            // Call controller
            boolean isTrue = FuelController.insertData(fuel_type, quantity_liters, price_per_liter, supplier_name, added_date);

            if (isTrue) {
                String alterMessage = "Data Insert Successful";
                response.getWriter().println("<script> alert('" + alterMessage + "'); window.location.href='GetAllServlet'; </script>");
            } else {
                System.out.println("Insertion failed. Forwarding to wrong.jsp");
                RequestDispatcher dis2 = request.getRequestDispatcher("wrong.jsp");
                dis2.forward(request, response);
            }

        } catch (Exception e) {
            System.out.println("Servlet Error: " + e.getMessage());
            e.printStackTrace();
            response.getWriter().println("<h3>Servlet Error occurred. Check console for details.</h3>");
        }
    }
}
