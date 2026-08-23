package com.abs.dao;

import java.sql.*;
import com.abs.bean.BookBean;
import com.abs.database.DBConnection;

public class AddBookDAO {
   
	public int k=0;
	public int insert(BookBean bb) {
		try {
			Connection con = DBConnection.getConnection();
			PreparedStatement ps = con.prepareStatement("insert into Book1 values(?,?,?,?,?)");
			ps.setString(1, bb.getCode());
			ps.setString(2, bb.getName());
			ps.setString(3, bb.getAuthor());
			ps.setFloat(4, bb.getPrice());
			ps.setInt(5, bb.getQty());
			
			k = ps.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return k;   
	}
}