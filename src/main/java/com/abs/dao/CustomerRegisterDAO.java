package com.abs.dao;

import java.sql.*;
import com.abs.bean.CustomerBean;
import com.abs.database.DBConnection;

public class CustomerRegisterDAO {
	
    public int register(CustomerBean cb) {
        int k = 0;
        try {
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement("insert into Customer values(?,?,?,?,?,?,?)");
            ps.setString(1, cb.getuName());
            ps.setString(2, cb.getpWord());
            ps.setString(3, cb.getfName());
            ps.setString(4, cb.getlName());
            ps.setString(5, cb.getAddr());
            ps.setString(6, cb.getmId());
            ps.setLong(7, cb.getPhNo());
            k = ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return k;
    }
}
