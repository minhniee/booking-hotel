package Controller.Authentication;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.io.PrintWriter;
import Context.AccountDAO;
import model.Account;

@WebServlet(name = "login", value = "/login")
public class login extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet NewServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet NewServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        HttpSession ss= request.getSession();
        AccountDAO aDAO = new AccountDAO();
        Account account = aDAO.checkLogin(username, password);
        if (account == null) {
            String msg = "Login failed!";
            request.setAttribute("msg", msg);
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } else {
            ss.setAttribute("account", account);
            if (account.getRole().equals("admin")) {
//                response.sendRedirect("admin/page");
                request.getRequestDispatcher("admin/page").forward(request, response);

            } else {
//                response.sendRedirect("booking.jsp");
                request.getRequestDispatcher("booking.jsp").forward(request, response);

            }
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}