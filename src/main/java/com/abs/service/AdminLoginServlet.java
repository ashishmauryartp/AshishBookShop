package com.abs.service;

import java.io.*;
import com.abs.bean.AdminBean;
import com.abs.dao.AdminLoginDAO;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@SuppressWarnings("serial")
@WebServlet("/admin")
public class AdminLoginServlet extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req,HttpServletResponse res)throws ServletException,IOException{
		AdminBean ab = new AdminLoginDAO().login(req.getParameter("uname"),req.getParameter("pword"));
		
		if(ab==null) {
			req.setAttribute("msg", "Invalid Login process...<br>");
			req.getRequestDispatcher("Msg.jsp").forward(req, res);
		}else {
			HttpSession hs = req.getSession();//Creating new Session Object
			hs.setAttribute("abean", ab);
			req.getRequestDispatcher("AdminLogin.jsp").forward(req, res);
		}
	}
}

