package addreservationpacakage;

import java.io.IOException;
import java.util.List;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/GetAllReservationsServlet")
public class ReservationGetAllservlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        fetchReservations(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        fetchReservations(request, response);
    }

    private void fetchReservations(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        
        HttpSession session = request.getSession();
        String message = (String) session.getAttribute("message");

        if (message != null) {
            request.setAttribute("message", message);
            session.removeAttribute("message");
        }

        
        List<ReservationModel> reservations = ReservationController.getAllReservations();
        request.setAttribute("reservationsList", reservations);

        
        RequestDispatcher dispatcher = request.getRequestDispatcher("displayReservations.jsp");
        dispatcher.forward(request, response);
    }
}
