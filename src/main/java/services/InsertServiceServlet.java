package services;

import java.io.IOException;
import java.time.LocalDate;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/InsertServiceServlet")
public class InsertServiceServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String service_type = request.getParameter("service_type");
            String service_description = request.getParameter("service_description");
            String service_date_str = request.getParameter("service_date");
            String service_cost_str = request.getParameter("service_cost");
            String service_center = request.getParameter("service_center");

            LocalDate service_date = LocalDate.parse(service_date_str);
            double service_cost = Double.parseDouble(service_cost_str);

            boolean isInserted = ServiceController.insertData(service_type, service_description, service_date, service_cost,service_center);

            if (isInserted) {
                response.getWriter().println("<script>alert('Insert successful'); window.location='GetAllServlet1';</script>");
            } else {
                response.getWriter().println("<script>alert('Insert failed'); window.location='Insertservice.jsp';</script>");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("<h3>Error: " + e.getMessage() + "</h3>");
        }
    }
}
