package com.abs.service;

import java.io.*;
import com.abs.dao.DeleteBookDAO;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;

@SuppressWarnings("serial")
@WebServlet("/delete")
public class DeleteBookServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException {
       
    	HttpSession hs = req.getSession(false);
        if (hs == null) {
            req.setAttribute("msg", "Session Expired...<br>");
            req.getRequestDispatcher("Msg.jsp").forward(req, res);
        } else {
            String bcode = req.getParameter("bcode");
            int k = new DeleteBookDAO().delete(bcode);
            if (k > 0) {
                req.setAttribute("msg","Book Deleted Successfully...<br>");
                req.getRequestDispatcher("DeleteBook.jsp").forward(req, res);

            } else {
                req.setAttribute("msg","Book Not Found...<br>");
                req.getRequestDispatcher("DeleteBook.jsp").forward(req, res);
            }
        }
    }
}
