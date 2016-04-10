package com.leo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.leo.bean.DataDanliInfo;

public class DataDanliDao {
	private static DataDanliDao instance = null;
	public static DataDanliDao getInstance()
	{
		if(instance==null)
		{
			instance = new DataDanliDao();
		}
		return instance;
	}
	
	public boolean saveData(DataDanliInfo DDLI)
	{
		Connection conn = null;
		try {
			conn = MySQLDBCon.getConn();
			String sql = "insert into t_simple_interest(f_money,f_year,f_rate,f_sum) values (?,?,?,?)";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setFloat(1, DDLI.getStartMoney());
			pstmt.setFloat(2, DDLI.getYear());
			pstmt.setDouble(3, DDLI.getRate());
			pstmt.setFloat(4, DDLI.getSum());
			pstmt.executeUpdate();
			return true;
		} catch (Exception ex) {
			// TODO: handle exception
			ex.printStackTrace();
		}finally
		{
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}
		return false;
	}

}
