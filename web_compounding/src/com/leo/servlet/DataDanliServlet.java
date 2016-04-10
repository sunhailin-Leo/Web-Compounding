package com.leo.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.leo.bean.DataDanliInfo;
import com.leo.dao.DataDanliDao;


public class DataDanliServlet extends HttpServlet{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1946928224145169582L;

	/**
	 * Constructor of the object.
	 */
	public DataDanliServlet() {
		// TODO Auto-generated constructor stub
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
		String startMoney = request.getParameter("num1");
		float DataStartMoney = 0;
		if(startMoney!=null&&!startMoney.equals("")){
			DataStartMoney = Float.parseFloat(startMoney);
		}
		String year = request. getParameter("num2");
		float DataYear = 0;
		if(year!=null&&!year.equals(""))
		{
			DataYear = Float.parseFloat(year);
		}
		String rate = request.getParameter("num3");
		float DataRate = 0;
		if(rate!=null&&!rate.equals(""))
		{
			DataRate = Float.parseFloat(rate);
		}
		String sum = request.getParameter("sum");
		float DataSum = 0;
		if(sum!=null&&!sum.equals(""))
		{
			DataSum = Float.parseFloat(sum);
		}
		DataDanliInfo DDLI = new DataDanliInfo();
		DDLI.setStartMoney(DataStartMoney);
		DDLI.setYear(DataYear);
		DDLI.setRate(DataRate);
		DDLI.setSum(DataSum);
		boolean result = DataDanliDao.getInstance().saveData(DDLI);
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		if(result){
			out.println("<script>");
			out.print("alert('数据存入成功!');");
			out.println("</script>");
		}else{	
	
			out.println("<script>");
			out.print("alert('数据存入失败!请重新提交');");
			out.println("</script>");
		}
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
