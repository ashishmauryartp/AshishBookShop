package com.abs.dao;

import java.sql.*;
import java.util.*;
import com.abs.bean.BookBean;
import com.abs.database.DBConnection;

public class BuyBookDAO {

    public boolean buyBooks(ArrayList<BookBean> cart) {
        boolean status = false;
        try {
            Connection con = DBConnection.getConnection();
            con.setAutoCommit(false);
            PreparedStatement ps = con.prepareStatement("update Book1 " + "set bqty=bqty-1 " + "where bcode=? and bqty>0");
            for(BookBean bb : cart) {
                ps.setString(1, bb.getCode());
                int k = ps.executeUpdate();
                if(k == 0) {
                    con.rollback();
                    return false;
                }
            }
            con.commit();
            status = true;
        } catch(Exception e) {
            e.printStackTrace();
        }
        return status;
    }
}
