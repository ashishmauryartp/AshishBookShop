package com.abs.service;

import java.io.*;
import com.abs.bean.CustomerBean;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;

@SuppressWarnings("serial")
@WebServlet("/editCustomer")
public class EditCustomerServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException {
        HttpSession hs = req.getSession(false);
        if(hs == null || hs.getAttribute("cbean") == null) {
            req.setAttribute("msg","Session Expired...<br>");
            req.getRequestDispatcher("CustomerMsg.jsp").forward(req, res);
            return;
        }
        CustomerBean cb = (CustomerBean)hs.getAttribute("cbean");
        req.setAttribute("cbean", cb);
        req.getRequestDispatcher("EditCustomer.jsp").forward(req, res);
    }
}
