package com.abs.database;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {
	
	private static Connection con=null;

	private DBConnection() {
	}
	static {
		try {
			Class.forName(DBInfo.driver);
			con=DriverManager.getConnection(DBInfo.dbUrl,DBInfo.uName,DBInfo.pWord);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public static Connection getConnection() {
		return con;
	}
}
