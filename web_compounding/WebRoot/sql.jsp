<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

String startMoney=request.getParameter("startMoney");
String years=request.getParameter("years");
String r=request.getParameter("r");
String endMoney=request.getParameter("endMoney");


	Class.forName("com.mysql.jdbc.Driver");
			//连接数据库
	Connection	 con = DriverManager.getConnection("jdbc:mysql://localhost:3306/compounding", "root", "abc97520");
			
	
		
	
	String sql="insert into view (本金,年数，利率，终值) values (? ,?,?,?)";
	PreparedStatement ps=con.prepareStatement(sql);
	//st.executeUpdate(sql);
	ps.setString(1, startMoney);
	ps.setString(2, years);
	ps.setString(3, r);
	ps.setString(4, endMoney);
	//ps.executeUpdate(sql);
	ps.executeUpdate();
	ps.close();
	//st.close();
	con.close();
		
%>


