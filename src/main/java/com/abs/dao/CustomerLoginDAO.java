package com.abs.dao;

import java.sql.*;
import com.abs.bean.CustomerBean;
import com.abs.database.DBConnection;

public class CustomerLoginDAO {
    public CustomerBean login(String uN, String pW) {
        CustomerBean cb = null;
        try {
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement("select * from Customer where uname=? and pword=?");
            ps.setString(1, uN);
            ps.setString(2, pW);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                cb = new CustomerBean();
                cb.setuName(rs.getString(1));
                cb.setpWord(rs.getString(2));
                cb.setfName(rs.getString(3));
                cb.setlName(rs.getString(4));
                cb.setAddr(rs.getString(5));
                cb.setmId(rs.getString(6));
                cb.setPhNo(rs.getLong(7));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return cb;
    }
}
