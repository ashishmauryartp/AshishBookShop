package com.abs.service;

import java.io.*;
import com.abs.bean.CustomerBean;
import com.abs.dao.UpdateCustomerDAO;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;

@SuppressWarnings("serial")
@WebServlet("/updateCustomer")
public class UpdateCustomerServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException {
        HttpSession hs = req.getSession(false);
        if(hs == null || hs.getAttribute("cbean") == null) {
            req.setAttribute("msg","Session Expired...<br>");
            req.getRequestDispatcher("CustomerMsg.jsp").forward(req, res);
            return;
        }
        CustomerBean cb = (CustomerBean)hs.getAttribute("cbean");
        cb.setpWord(req.getParameter("pword"));
        cb.setfName(req.getParameter("fname"));
        cb.setlName(req.getParameter("lname"));
        cb.setAddr(req.getParameter("addr"));
        cb.setmId(req.getParameter("mid"));
        cb.setPhNo(Long.parseLong(req.getParameter("phno")));
        int k = new UpdateCustomerDAO().update(cb);
        if(k > 0) {
            hs.setAttribute("cbean", cb);
            req.setAttribute("msg","Customer Profile Updated Successfully...<br>");
        } else {
            req.setAttribute("msg","Profile Update Failed...<br>");
        }
        req.getRequestDispatcher("UpdateCustomer.jsp").forward(req, res);
    }
}