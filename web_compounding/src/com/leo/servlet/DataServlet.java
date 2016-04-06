package com.leo.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.leo.bean.DataInfo;
import com.leo.dao.DataDao;

public class DataServlet extends HttpServlet{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 2403425106966950172L;

	/**
	 * Constructor of the object.
	 */
	public DataServlet()
	{
		super();
	}
	
	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); 
	}
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException 
	{
		request.setCharacterEncoding("UTF-8");
		String startMoney = request.getParameter("startMoney");
		float DataStartMoney = 0;
		if(startMoney!=null&&!startMoney.equals("")){
			DataStartMoney = Float.parseFloat(startMoney);
		}
		String year = request. getParameter("years");
		float DataYear = 0;
		if(year!=null&&!year.equals(""))
		{
			DataYear = Float.parseFloat(year);
		}
		String rate = request.getParameter("r");
		float DataRate = 0;
		if(rate!=null&&!rate.equals(""))
		{
			DataRate = Float.parseFloat(rate);
		}
		String sum = request.getParameter("endMoney");
		float DataSum = 0;
		if(sum!=null&&!sum.equals(""))
		{
			DataSum = Float.parseFloat(sum);
		}
		DataInfo data = new DataInfo();
		data.setStartMoney(DataStartMoney);
		data.setYear(DataYear);
		data.setRate(DataRate);
		data.setSum(DataSum);
		
		boolean result = DataDao.getInstance().saveData(data);
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		//out.println("<%@ page language='java' import='java.util.*' pageEncoding='UTF-8'%>");
		//out.println("<script>");
		//out.println("response.sendRedirect('fuli.jsp');");
		//out.println("</script>");
		//out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
		//out.println("<HTML>");
		//out.println("  <HEAD><TITLE>数据存入数据库</TITLE></HEAD>");
		//out.println("  <BODY>");
		if(result){
			out.println("<script>");
			out.print("alert('存入成功!');");
			//out.println("response.sendRedirect('fuli.jsp');");
			//out.print("window.location.href='fuli.jsp'");
			out.println("</script>");
		}else{	
	
			out.println("<script>");
			out.print("alert('存入失败!');");
			//out.print("window.location.href='fuli.jsp'");
			//out.println("response.sendRedirect('fuli.jsp');");
			out.println("</script>");
		}
		//out.println("  </BODY>");
		out.println("</HTML>");
		out.flush();
		out.close();
		
	}
	
	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}
}
