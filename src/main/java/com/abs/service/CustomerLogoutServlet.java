package com.abs.service;

import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;

@SuppressWarnings("serial")
@WebServlet("/customerLogout")
public class CustomerLogoutServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException {
        HttpSession hs = req.getSession(false);
        if(hs != null) {
            hs.removeAttribute("cbean");
            hs.removeAttribute("cart");
            hs.invalidate();
        }
        req.setAttribute("msg","Customer Logged Out Successfully...<br>");
        req.getRequestDispatcher("CustomerMsg.jsp").forward(req, res);
    }
}
