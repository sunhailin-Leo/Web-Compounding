package com.leo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.leo.bean.DataDanliReturnInfo;


public class DataDanliReturn {
	Connection con=null;
    PreparedStatement psmt=null;
    ResultSet rs=null;
	public List<DataDanliReturnInfo> readDataDanli(){
        List<DataDanliReturnInfo> Danlilist =new ArrayList<DataDanliReturnInfo>();
        try {
            con = MySQLDBCon.getConn();
            String sql="select * from t_simple_interest";
            psmt=con.prepareStatement(sql);
            rs=psmt.executeQuery();
            while(rs.next())
            {
                int f_id = rs.getInt("f_id");
                float f_money = rs.getFloat("f_money"); 
                int f_year = rs.getInt("f_year");
                double f_rate = rs.getDouble("f_rate");
                float f_sum = rs.getFloat("f_sum");
                System.out.println(f_id+" "+f_money+" "+f_year+" "+f_rate+" "+f_sum);
                DataDanliReturnInfo DDR=new DataDanliReturnInfo(f_id,f_money,f_year,f_rate,f_sum);
                Danlilist.add(DDR);
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
        return Danlilist;
    }

}
