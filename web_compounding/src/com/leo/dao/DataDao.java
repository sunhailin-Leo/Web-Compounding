package com.leo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.leo.bean.DataInfo;


public class DataDao {
	
	private static DataDao instance = null;
	public static DataDao getInstance()
	{
		if(instance==null)
		{
			instance = new DataDao();
		}
		return instance;
	}
	
	public boolean saveData(DataInfo data)
	{
		Connection conn = null;
		try {
			conn = MySQLDBCon.getConn();
			String sql = "insert into t_compounding(f_money,f_year,f_rate,f_sum) values (?,?,?,?)";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setFloat(1, data.getStartMoney());
			pstmt.setFloat(2, data.getYear());
			pstmt.setFloat(3, data.getRate());
			pstmt.setFloat(4, data.getSum());
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
