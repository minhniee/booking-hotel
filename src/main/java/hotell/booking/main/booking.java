package hotell.booking.main;

import java.io.*;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name = "bookingServlet", value = "/booking-servlet")
public class booking extends HttpServlet {
//    private String message;

//    public void init() {
//        message = "Hello World!";
//    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        response.setContentType("text/html");

        // Hello
        String checkInDate = request.getParameter("checkInDate");
        String checkOutDate = request.getParameter("checkOutDate");
        String adult = request.getParameter("adults");
        String child = request.getParameter("childs");


        int adults, childrent;
        String noti ;

        try {
            adults = Integer.parseInt(adult);
            childrent = Integer.parseInt(child);

            if (adults + childrent >= 4){
                request.setAttribute("noti","Maximum 2 persons per room");
            }

        }catch (Exception e){
            e.printStackTrace();
        }
        request.getRequestDispatcher("listRoom.jsp").forward(request, response);

    }

    public void destroy() {
    }
}