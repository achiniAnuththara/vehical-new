package addreservationpacakage;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalTime;

@WebServlet("/UpdateReservationServlet")
public class UpdateReservationServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String idStr = request.getParameter("id");

        if (idStr != null) {
            try {
                int id = Integer.parseInt(idStr);
                ReservationModel reservation = ReservationController.getReservationById(id);
                if (reservation != null) {
                    request.setAttribute("reservation", reservation);
                    request.getRequestDispatcher("reservatonUpdate.jsp").forward(request, response);
                } else {
                    request.setAttribute("alertMessage", "Reservation not found");
                    request.getRequestDispatcher("reservationError.jsp").forward(request, response);
                }
            } catch (NumberFormatException e) {
                request.setAttribute("alertMessage", "Invalid reservation ID");
                request.getRequestDispatcher("reservationError.jsp").forward(request, response);
            }
        } else {
            response.sendRedirect("GetAllReservationsServlet");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String idStr = request.getParameter("reservation_id");
        String customerName = request.getParameter("customerName");
        String vehicleNumber = request.getParameter("vehicleNumber");
        String serviceType = request.getParameter("serviceType");
        String date = request.getParameter("date");
        String time = request.getParameter("time");

        try {
            int id = Integer.parseInt(idStr);

            // Validations
            if (!customerName.matches("^[A-Za-z ]+$")) {
                forwardWithError("Customer name must contain only letters and spaces.", request, response, id);
                return;
            }

            if (!vehicleNumber.matches("^[A-Z0-9]+$")) {
                forwardWithError("Vehicle number must use capital letters and numbers only.", request, response, id);
                return;
            }

            LocalDate selectedDate = LocalDate.parse(date);
            if (selectedDate.isBefore(LocalDate.now())) {
                forwardWithError("Date cannot be in the past.", request, response, id);
                return;
            }

            LocalTime selectedTime = LocalTime.parse(time);
            if (selectedTime.isBefore(LocalTime.of(9, 0)) || selectedTime.isAfter(LocalTime.of(21, 0))) {
                forwardWithError("Time must be between 09:00 and 21:00.", request, response, id);
                return;
            }

            boolean updated = ReservationController.updateReservation(id, customerName, vehicleNumber, serviceType, date, time);

            if (updated) {
                response.sendRedirect("GetAllReservationsServlet?status=success");
            } else {
                response.sendRedirect("GetAllReservationsServlet?status=failed");
            }

        } catch (NumberFormatException e) {
            request.setAttribute("alertMessage", "Invalid reservation ID format");
            request.getRequestDispatcher("reservationError.jsp").forward(request, response);
        }
    }

    private void forwardWithError(String msg, HttpServletRequest request, HttpServletResponse response, int id)
            throws ServletException, IOException {
        request.setAttribute("errorMsg", msg);
        request.setAttribute("reservation", ReservationController.getReservationById(id));
        request.getRequestDispatcher("reservatonUpdate.jsp").forward(request, response);
    }
}