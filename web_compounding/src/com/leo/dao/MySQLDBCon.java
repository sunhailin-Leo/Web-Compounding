package com.leo.dao;

import java.sql.Connection;
import java.sql.DriverManager;

public class MySQLDBCon 
{
	private static Connection conn =null;
	public static Connection getConn()
	{
	try {
		Class.forName("com.mysql.jdbc.Driver");
		String user = "root";
		String pwd = "379978424";
		String url = "jdbc:mysql://localhost:3306/db_compounding_calculator";
		conn = DriverManager.getConnection(url, user, pwd);
	} catch (Exception ex) {
		// TODO: handle exception
		ex.printStackTrace();
	}
	return conn;
	}
	
}
