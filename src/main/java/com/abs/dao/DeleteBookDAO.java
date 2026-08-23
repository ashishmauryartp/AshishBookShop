package com.abs.dao;

import java.sql.*;

import com.abs.database.DBConnection;

public class DeleteBookDAO {

    public int delete(String bcode) {
        int k = 0;
        try {
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement("delete from Book1 where bcode=?");
            ps.setString(1, bcode);
            k = ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return k;
    }
}
