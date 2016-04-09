package com.leo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.leo.bean.DataDeleteInfo;


public class DataDeleteDao {
	
	private static DataDeleteDao instance = null;
	public static DataDeleteDao getInstance()
	{
		if(instance==null)
		{
			instance = new DataDeleteDao();
		}
		return instance;
	}
	
	public boolean delete(DataDeleteInfo DDI)
	{
		Connection con=null;
        PreparedStatement psmt=null;  
        try {
            con= MySQLDBCon.getConn(); 
            String sql="delete from t_compounding where f_id='" + DDI.getId() + "'";
            psmt=con.prepareStatement(sql);
            psmt.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }finally
        {
            try 
            {
                if(psmt!=null)
                {
                    psmt.close();
                }
                if(con!=null)
                {
                    con.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return false;
    }
}
