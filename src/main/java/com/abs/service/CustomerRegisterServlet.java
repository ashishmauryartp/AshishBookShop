package com.abs.service;

import java.io.*;

import com.abs.bean.CustomerBean;
import com.abs.dao.CustomerRegisterDAO;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;

@SuppressWarnings("serial")
@WebServlet("/customerRegister")
public class CustomerRegisterServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException {
        CustomerBean cb = new CustomerBean();
        cb.setuName(req.getParameter("uname"));
        cb.setpWord(req.getParameter("pword"));
        cb.setfName(req.getParameter("fname"));
        cb.setlName(req.getParameter("lname"));
        cb.setAddr(req.getParameter("addr"));
        cb.setmId(req.getParameter("mid"));
        cb.setPhNo(Long.parseLong(req.getParameter("phno")));
        int k = new CustomerRegisterDAO().register(cb);
        if (k > 0) {
            req.setAttribute("msg","Customer Registered Successfully...<br>");
        } else {
            req.setAttribute("msg","Customer Registration Failed...<br>");
        }
        req.getRequestDispatcher("CustomerMsg.jsp").forward(req, res);
    }
}