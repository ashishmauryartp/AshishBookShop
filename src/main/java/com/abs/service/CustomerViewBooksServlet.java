package com.abs.service;

import java.io.*;
import java.util.*;
import com.abs.bean.BookBean;
import com.abs.dao.CustomerViewBooksDAO;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;

@SuppressWarnings("serial")
@WebServlet("/customerView")
public class CustomerViewBooksServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException {
        HttpSession hs = req.getSession(false);
        
        if (hs == null || hs.getAttribute("cbean") == null) {
            req.setAttribute("msg","Customer Session Expired...<br>");
            req.getRequestDispatcher("CustomerMsg.jsp").forward(req, res);
        } else {
            ArrayList<BookBean> al = new CustomerViewBooksDAO().retrieve();
            req.setAttribute("bookList", al);
            req.getRequestDispatcher("CustomerBooks.jsp").forward(req, res);
        }
    }
}
