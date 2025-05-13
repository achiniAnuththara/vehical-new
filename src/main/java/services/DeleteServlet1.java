package services;

import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/DeleteServlet1")
public class DeleteServlet1 extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String service_id = request.getParameter("service_id");

        boolean isTrue = ServiceController.deletedata(service_id);

        if (isTrue) {
            // Success
            response.getWriter().println("<script>alert('Data Delete Successful'); window.location.href='GetAllServlet1';</script>");
        } else {
            // Failure
            List<servicemodel> servicedetails = ServiceController.getById(service_id);
            request.setAttribute("servicedetails", servicedetails);
            RequestDispatcher dispatcher = request.getRequestDispatcher("wrong.jsp");
            dispatcher.forward(request, response);
        }
    }
}
