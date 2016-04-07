package com.leo.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.leo.bean.DataDeleteInfo;
import com.leo.dao.DataDeleteDao;

public class DataDeleteServlet extends HttpServlet{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -4135788320842130442L;
	
	/**
	 * Constructor of the object.
	 */
	public DataDeleteServlet()
	{
		super();
	}
	
	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); 
	}
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException 
	{
		this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException 
	{
		request.setCharacterEncoding("UTF-8");
		int id = Integer.parseInt(request.getParameter("deleteresult"));
		System.out.println(id);
		DataDeleteInfo DDI = new DataDeleteInfo();
		DDI.setId(id);
		System.out.println(id);
		boolean result = DataDeleteDao.getInstance().delete(DDI);
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		if(result){
			out.println("<script>");
			out.print("alert('…æ≥˝≥…π¶!');");
			//out.println("response.sendRedirect('fuli.jsp');");
			out.print("window.location.href='list.jsp'");
			out.println("</script>");
		}else{	
	
			out.println("<script>");
			out.print("alert('¥Ê»Î ß∞‹!');");
			out.print("window.location.href='fuli.jsp'");
			//out.println("response.sendRedirect('list.jsp');");
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
