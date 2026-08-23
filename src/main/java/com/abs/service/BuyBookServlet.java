package com.abs.service;

import java.io.*;
import java.util.*;
import com.abs.bean.BookBean;
import com.abs.dao.BuyBookDAO;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;

@SuppressWarnings("serial")
@WebServlet("/buyBook")
public class BuyBookServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        HttpSession hs = req.getSession(false);
        if(hs == null || hs.getAttribute("cbean") == null) {
            req.setAttribute("msg","Customer Session Expired...<br>");
            req.getRequestDispatcher("CustomerMsg.jsp").forward(req, res);
            return;
        }
        ArrayList<BookBean> cart = (ArrayList<BookBean>)hs.getAttribute("cart");
        if(cart == null || cart.size() == 0) {
            req.setAttribute("msg","Cart is Empty...<br>");
            req.getRequestDispatcher("CustomerMsg.jsp").forward(req, res);
            return;
        }
        boolean status = new BuyBookDAO().buyBooks(cart);
        if(status) {
            hs.removeAttribute("cart");
            req.setAttribute("msg","Books Purchased Successfully...<br>");
        } else {
            req.setAttribute("msg","Purchase Failed. Some Book is Out of Stock...<br>");
        }
        req.getRequestDispatcher("BuyBook.jsp").forward(req, res);
    }
}
