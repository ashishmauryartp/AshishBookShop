package com.abs.service;

import java.io.*;
import java.util.*;
import com.abs.bean.BookBean;
import com.abs.dao.CustomerViewBooksDAO;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;

@SuppressWarnings("serial")
@WebServlet("/addCart")
public class AddCartServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException {
        HttpSession hs = req.getSession(false);
        if (hs == null || hs.getAttribute("cbean") == null) {
            req.setAttribute("msg","Customer Session Expired...<br>");
            req.getRequestDispatcher("CustomerMsg.jsp").forward(req, res);
            return;
        }
        String bcode = req.getParameter("bcode");
        ArrayList<BookBean> cart =(ArrayList<BookBean>)hs.getAttribute("cart");
        if (cart == null) {
            cart = new ArrayList<BookBean>();
        }
        ArrayList<BookBean> books =new CustomerViewBooksDAO().retrieve();
        for (BookBean bb : books) {
            if (bcode.equals(bb.getCode())) {
                cart.add(bb);
                break;
            }
        }
        hs.setAttribute("cart", cart);
        res.sendRedirect("cart");
    }
}
