package com.abs.dao;

import java.sql.*;
import com.abs.bean.CustomerBean;
import com.abs.database.DBConnection;

public class UpdateCustomerDAO {

    public int update(CustomerBean cb) {
        int k = 0;
        try {
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement("update Customer set " + "pword=?, fname=?, lname=?, " +
            		"addr=?, mid=?, phno=? " +"where uname=?");
            ps.setString(1, cb.getpWord());
            ps.setString(2, cb.getfName());
            ps.setString(3, cb.getlName());
            ps.setString(4, cb.getAddr());
            ps.setString(5, cb.getmId());
            ps.setLong(6, cb.getPhNo());
            ps.setString(7, cb.getuName());
            k = ps.executeUpdate();
        } catch(Exception e) {
            e.printStackTrace();
        }
        return k;
    }
}
