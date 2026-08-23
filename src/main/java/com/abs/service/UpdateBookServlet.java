package com.abs.service;

import java.io.*;
import java.util.*;
import com.abs.bean.BookBean;
import com.abs.dao.UpdateBookDAO;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@SuppressWarnings("serial")
@WebServlet("/update")
public class UpdateBookServlet extends HttpServlet{

	@SuppressWarnings("unchecked")
	@Override
	protected void doPost(HttpServletRequest req,HttpServletResponse res)throws ServletException,IOException{
		HttpSession hs = req.getSession(false);
		if(hs==null) {
			req.setAttribute("msg", "Session Expired..<br>");
			req.getRequestDispatcher("Msg.jsp").forward(req, res);
		}else {
			String bC = req.getParameter("bcode");
			float bP = Float.parseFloat(req.getParameter("bprice"));
			int bQ = Integer.parseInt(req.getParameter("bqty"));
			ArrayList<BookBean> al = (ArrayList<BookBean>)hs.getAttribute("alist");
			Iterator<BookBean> it = al.iterator();
			while(it.hasNext()) {
				BookBean bb = (BookBean)it.next();
				if(bC.equals(bb.getCode())) {
					bb.setPrice(bP);
					bb.setQty(bQ);
					int k = new UpdateBookDAO().update(bb);
					if(k>0) {
						req.setAttribute("msg","Book Updated Successfully...<br>");
						req.getRequestDispatcher("UpdateBook.jsp").forward(req, res);
					}
					break;
				}
			}//end of loop
		}
	}
}
