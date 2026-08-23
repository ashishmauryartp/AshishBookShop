package com.abs.service;

import java.io.*;
import com.abs.bean.CustomerBean;
import com.abs.dao.CustomerLoginDAO;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;

@SuppressWarnings("serial")
@WebServlet("/customerLogin")
public class CustomerLoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException {
        String uName = req.getParameter("uname");
        String pWord = req.getParameter("pword");

        CustomerBean cb = new CustomerLoginDAO().login(uName, pWord);
        if (cb == null) {
            req.setAttribute("msg","Invalid Customer Login...<br>");
            req.getRequestDispatcher("CustomerMsg.jsp").forward(req, res);
        } else {
            HttpSession hs = req.getSession();
            hs.setAttribute("cbean", cb);
            req.getRequestDispatcher("CustomerLogin.jsp").forward(req, res);
        }
    }
}