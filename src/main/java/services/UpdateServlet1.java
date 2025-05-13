package services;

import java.io.IOException;
import java.time.LocalDate;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/UpdateServlet1")
public class UpdateServlet1 extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int service_id = Integer.parseInt(request.getParameter("service_id"));
            String service_type = request.getParameter("service_type");
            String service_description = request.getParameter("service_description");
            LocalDate service_date = LocalDate.parse(request.getParameter("service_date"));
            double service_cost = Double.parseDouble(request.getParameter("service_cost"));
            String service_center = request.getParameter("service_center");

            boolean isTrue = ServiceController.updateService(service_id, service_type, service_description, service_date, service_cost, service_center);

            if (isTrue) {
                response.getWriter().println("<script>alert('Service Updated Successfully'); window.location.href='GetAllServlet1';</script>");
            } else {
                RequestDispatcher dis2 = request.getRequestDispatcher("wrong.jsp");
                dis2.forward(request, response);
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("wrong.jsp");
        }
    }
}
