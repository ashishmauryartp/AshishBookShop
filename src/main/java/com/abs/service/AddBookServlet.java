package com.abs.service;

import java.io.*;
import com.abs.bean.BookBean;
import com.abs.dao.AddBookDAO;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;

@SuppressWarnings("serial")
@WebServlet("/add")
public class AddBookServlet extends HttpServlet{
	
	protected void doPost(HttpServletRequest req,HttpServletResponse res)throws ServletException,IOException{
		HttpSession hs = req.getSession(false);//Accessing existing Session
		
		if(hs==null) {
			req.setAttribute("msg", "Session Expired..<br>");
			req.getRequestDispatcher("Msg.jsp").forward(req, res);
		}else {
			BookBean bb = new BookBean();//Bean Object
			bb.setCode(req.getParameter("bcode"));
			bb.setName(req.getParameter("bname"));
			bb.setAuthor(req.getParameter("bauthor"));
			bb.setPrice(Float.parseFloat(req.getParameter("bprice")));
			bb.setQty(Integer.parseInt(req.getParameter("bqty")));
			
			int k = new AddBookDAO().insert(bb);
			if(k>0) {
				req.setAttribute("msg", "BookDetails Added Successfully...<br>");
				req.getRequestDispatcher("AddBook.jsp").forward(req, res);
			}
		}
	}
}

