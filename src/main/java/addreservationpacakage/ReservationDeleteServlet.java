package addreservationpacakage;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/ReservationDeleteServlet")
public class ReservationDeleteServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idParam = request.getParameter("id");

        // ✅ Null and empty check BEFORE parsing
        if (idParam == null || idParam.trim().isEmpty()) {
            request.setAttribute("message", "invalid-id");
            request.setAttribute("reservationsList", ReservationController.getAllReservations());
            request.getRequestDispatcher("displayReservations.jsp").forward(request, response);
            return;
        }

        try {System.out.println("Received ID: " + idParam);

            int reservationId = Integer.parseInt(idParam);
            boolean result = ReservationController.deleteReservation(reservationId);

            request.setAttribute("message", result ? "deleted" : "failed");
        } catch (NumberFormatException e) {
            e.printStackTrace();
            request.setAttribute("message", "invalid-id");
        }

        // Fetch updated list always
        request.setAttribute("reservationsList", ReservationController.getAllReservations());
        request.getRequestDispatcher("displayReservations.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
