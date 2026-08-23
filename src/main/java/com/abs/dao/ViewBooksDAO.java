package com.abs.dao;

import java.util.*;
import com.abs.bean.BookBean;
import com.abs.database.DBConnection;
import java.sql.*;

public class ViewBooksDAO {

	public ArrayList<BookBean> al = new ArrayList<BookBean>();
   
	public ArrayList<BookBean> retrieve(){
		try {
			Connection con = DBConnection.getConnection();
			PreparedStatement ps = con.prepareStatement("select * from Book1");
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				BookBean bb = new BookBean();
				bb.setCode(rs.getString(1));
				bb.setName(rs.getString(2));
				bb.setAuthor(rs.getString(3));
				bb.setPrice(rs.getFloat(4));
				bb.setQty(rs.getInt(5));
				al.add(bb);//Adding Bean to ArrayList object
			}//end of loop
		}catch(Exception e) {
			e.printStackTrace();
		}
		return al;
	}
}