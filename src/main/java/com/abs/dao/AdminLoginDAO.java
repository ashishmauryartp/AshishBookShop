package com.abs.dao;

import java.sql.*;
import com.abs.bean.AdminBean;
import com.abs.database.DBConnection;

public class AdminLoginDAO {
   
	public AdminBean ab = null;
   
    public AdminBean login(String uN,String pW) {
	   try {
		   Connection con = DBConnection.getConnection();
		   PreparedStatement ps = con.prepareStatement("select * from Admin where uname=? and pword=?");
		   ps.setString(1, uN);
		   ps.setString(2, pW);
		   ResultSet rs = ps.executeQuery();
		   
		   if(rs.next()) {
			   ab = new AdminBean();//Bean Object
			   ab.setuName(rs.getString(1));
			   ab.setpWord(rs.getString(2));
			   ab.setfName(rs.getString(3));
			   ab.setlName(rs.getString(4));
			   ab.setAddr(rs.getString(5));
			   ab.setmId(rs.getString(6));
			   ab.setPhNo(rs.getLong(7));
		   }
	   }
	   catch(Exception e) {
		   e.printStackTrace();
	   }
	   return ab;
   }
}

