package com.abs.dao;

import java.sql.*;
import com.abs.bean.BookBean;
import com.abs.database.DBConnection;

public class UpdateBookDAO {
	public int k=0;
	
	public int update(BookBean bb) {
		try {
			Connection con = DBConnection.getConnection();
			PreparedStatement ps = con.prepareStatement("update Book1 set bprice=?,bqty=? where bcode=?");
			ps.setFloat(1,bb.getPrice());
			ps.setInt(2, bb.getQty());
			ps.setString(3, bb.getCode());
			k = ps.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return k;
	}
}