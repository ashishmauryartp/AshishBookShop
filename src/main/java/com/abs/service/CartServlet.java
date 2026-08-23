package com.abs.service;

import java.io.*;
import java.util.*;
import com.abs.bean.BookBean;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;

@SuppressWarnings("serial")
@WebServlet("/cart")
public class CartServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException {
        HttpSession hs = req.getSession(false);
        if (hs == null || hs.getAttribute("cbean") == null) {
            req.setAttribute("msg","Customer Session Expired...<br>");
            req.getRequestDispatcher("CustomerMsg.jsp").forward(req, res);
        } else {
            ArrayList<BookBean> cart = (ArrayList<BookBean>) hs.getAttribute("cart");
            req.setAttribute("cart", cart);
            req.getRequestDispatcher("Cart.jsp").forward(req, res);
        }
    }
}
