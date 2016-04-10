package com.leo.dao;


import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import com.leo.bean.DataReturnInfo;

public class DataReturn {

	Connection con=null;
    PreparedStatement psmt=null;
    ResultSet rs=null;
	public List<DataReturnInfo> readFirstTitle()
	{
		         List<DataReturnInfo> list =new ArrayList<DataReturnInfo>();
		         try {
		             con = MySQLDBCon.getConn();
		             String sql="select * from t_compounding";
		             psmt=con.prepareStatement(sql);
		             rs=psmt.executeQuery();
		             while(rs.next())
		             {
		                 int f_id = rs.getInt("f_id");
		                 float f_money = rs.getFloat("f_money"); 
		                 int f_year = rs.getInt("f_year");
		                 double f_rate = rs.getDouble("f_rate");
		                 float f_sum = rs.getFloat("f_sum");
		                 DataReturnInfo tl=new DataReturnInfo(f_id,f_money,f_year,f_rate,f_sum);
		                 list.add(tl);
		             }
		             
		         } catch (SQLException e) {
		             e.printStackTrace();
		         }finally
		         {
		             try {
		                 if(rs!=null)
		                 {
		                     rs.close();
		                 }
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
		         return list;
		     }
	
}
