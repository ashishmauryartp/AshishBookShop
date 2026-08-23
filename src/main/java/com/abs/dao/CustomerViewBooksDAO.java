package com.abs.dao;

import java.sql.*;
import java.util.*;
import com.abs.bean.BookBean;
import com.abs.database.DBConnection;

public class CustomerViewBooksDAO {
	
    public ArrayList<BookBean> retrieve() {
        ArrayList<BookBean> al = new ArrayList<BookBean>();
        try {
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement("select * from Book1 where bqty > 0");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                BookBean bb = new BookBean();
                bb.setCode(rs.getString(1));
                bb.setName(rs.getString(2));
                bb.setAuthor(rs.getString(3));
                bb.setPrice(rs.getFloat(4));
                bb.setQty(rs.getInt(5));
                al.add(bb);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return al;
    }
}
