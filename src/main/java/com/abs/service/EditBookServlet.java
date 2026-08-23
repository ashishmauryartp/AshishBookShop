package com.abs.service;

import java.io.*;
import java.util.*;
import com.abs.bean.BookBean;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@SuppressWarnings("serial")
@WebServlet("/edit")
public class EditBookServlet extends HttpServlet{

	@SuppressWarnings("unchecked")
	@Override
	protected void doGet(HttpServletRequest req,HttpServletResponse res)throws ServletException,IOException{
		HttpSession hs = req.getSession(false);
		if(hs==null) {
			req.setAttribute("msg","Session Expired..<br>");
			req.getRequestDispatcher("Msg.jsp").forward(req, res);
		}else {
			String bC = req.getParameter("bcode");
			ArrayList<BookBean> al = (ArrayList<BookBean>)hs.getAttribute("alist");
			Iterator<BookBean> it = al.iterator();
			while(it.hasNext()) {
				BookBean bb = (BookBean)it.next();
				if(bC.equals(bb.getCode())) {
					req.setAttribute("bbean", bb); 
					req.getRequestDispatcher("EditBook.jsp").forward(req, res);
					break;
				}
			}//end of loop
		}
	}
}
