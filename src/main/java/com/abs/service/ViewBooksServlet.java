package com.abs.service;

import java.io.*;
import java.util.*;
import com.abs.bean.BookBean;
import com.abs.dao.ViewBooksDAO;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@SuppressWarnings("serial")
@WebServlet("/view")
public class ViewBooksServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req,HttpServletResponse res)throws ServletException,IOException{
		HttpSession hs = req.getSession(false);
		if(hs==null) {
			req.setAttribute("msg","Session Expired...<br>");
			req.getRequestDispatcher("Msg.jsp").forward(req, res);
		}else {
			ArrayList<BookBean> al = new ViewBooksDAO().retrieve();
			hs.setAttribute("alist", al);
			req.getRequestDispatcher("ViewBooks.jsp").forward(req, res);
		}
	}
}
