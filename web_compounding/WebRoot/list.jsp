<%@page import="com.leo.bean.DataReturnInfo"%>
<%@page import="com.leo.dao.DataReturn"%>
<%@ page language="java" import="java.util.*,java.io.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>list</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css"type="text/css"></link>
<link rel="stylesheet" href="prototype/css/common.css" type="text/css" />
<link rel="stylesheet" href="mycss.css" type="text/css" />
<link rel="stylesheet" href="prototype/css/pagination.css" type="text/css"></link>

<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="prototype/js/jquery-1.7.min.js"></script>
<script type="text/javascript" src="prototype/js/jquery.pagination.js"></script>
<script type="text/javascript" src="funciton.js"></script>



<script type="text/javascript">

function modify()
{
	alert("Coming Soon!");
}



function datadelete(i)
{	
	var result;
	for ( var s = 0; s < arguments.length; s++) 
	{
		result = arguments[s];
	}
	document.getElementById("deleteresult").value = result;
	//alert("已提交");
}

</script>

  <script language="JavaScript">   
    //鼠标点击选择行时候变色
	function change(change) 
	{
		var oObj = window.event.srcElement;
		//alert(change.tagName.toLowerCase());
		if(oObj.tagName.toLowerCase() == "td"){   
			var oTr = oObj.parentNode;   
			for(var i=1; i<document.all.table1.rows.length; i++)   
			{   
				document.all.table1.rows[i].style.backgroundColor = "";   
				document.all.table1.rows[i].tag = false;   
			}
			oTr.style.backgroundColor = "#CCCCFF";   
			oTr.tag = true;   
		}
	}
    //鼠标点击另外一行时关闭已选行变色
	function out() 
	{
		var oObj = event.srcElement;
		if(oObj.tagName.toLowerCase() == "td"){
			var oTr = oObj.parentNode;
			if(!oTr.tag) oTr.style.backgroundColor = "";
		}
	}
	//鼠标移动到选择行上时的行变色
	function over()
	{   
		var oObj = event.srcElement;
		if(oObj.tagName.toLowerCase() == "td"){   
		var oTr = oObj.parentNode;
		if(!oTr.tag) oTr.style.backgroundColor = "#E1E9FD";
		}
	}
 </script>




</head>  
  <body>
    <div class="navigation">
		<nav class="navbar navbar-default navbar-fixed-top">
			<div class="container-fluid">
				<!-- Brand and toggle get grouped for better mobile display -->
				<div class="container">
					<div class="navbar-header">
						<button type="button" class="navbar-toggle collapsed"
							data-toggle="collapse"
							data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
							<span class="sr-only">Toggle navigation</span> <span
								class="icon-bar"></span> <span class="icon-bar"></span> <span
								class="icon-bar"></span>
						</button>
						<a class="navbar-brand" href="fuli.jsp"><strong>投资计算器</strong></a>
					</div>

					<!-- Collect the nav links, forms, and other content for toggling -->
					<div class="collapse navbar-collapse"
						id="bs-example-navbar-collapse-1">
						<ul class="nav navbar-nav">
							<li class=""><a href="#">Funciton Comming Soon<span class="sr-only">(current)</span>
							</a>
							</li>

						</ul>
					</div>
					<!-- /.navbar-collapse -->
				</div>
				<!-- /.container-fluid -->
			</div>
		</nav>
	</div>


<div id="TabMain">
		<div class="tabItemContainer">
			<li><a href="fuli.jsp">复利计算</a></li>
			<li><a href="danli.jsp">单利计算</a></li>
			<li><a href="benjin.jsp">求初值</a></li>
			<li><a href="gupiao.jsp">股票收益</a></li>
			<li><a href="lilv.jsp">求报酬率</a></li>
			<li><a href="dingtou.jsp">定投计算</a></li>
			<li><a href="daikuan.jsp">贷款</a></li>
			<li><a href="list.jsp" class="tabItemCurrent">投资报表</a></li>
		</div>
		<div class="tabBodyContainer" style ="height: 520px;">
			<div class="tabBodyItem tabBodyCurrent">
				<div   class="pagination "  style = "margin-top: 0px;padding-left: 0px;margin-bottom: -1px;"> 
					<li class="active"><a href='list.jsp' style="height: 64px;width: 116px;padding-left: 37px; padding-top: 15px;font-size: 20px">复利</a></li>
					<li><a href='listDanli.jsp' style="height: 64px;width: 116px;padding-left: 37px; padding-top: 15px;font-size: 20px">单利</a></li>
				</div>
				<form  id = "form2" action="DataDeleteServlet"  method = "post"> 
					<table class="table table-hover" border="1" align="center"
						style="border-top-width: 2px; margin-right: 1px;border-left-width: 1px;border-right-width: 1px;border-bottom-width: 2px;margin-top: 1px; margin-bottom 1px;">
						<tr>
							<td><strong>投资目录</strong></td>
							<td><strong>金额</strong>
							</td>
							<td><strong>年份</strong>
							</td>
							<td><strong>利率</strong>
							</td>
							<td><strong>终值</strong>
							</td>
							<td><strong>修改/删除</strong></td>
						</tr>
							<%
							int p;
							String page1=request.getParameter("page");//获得按下的按钮值
							if(page1==null){
								p=1;
							}
							else{
								p=Integer.parseInt(page1);
							}
							//System.out.println("p="+p);
							DataReturn DR = new DataReturn();
							List<DataReturnInfo> list = DR.readFirstTitle();
							int rowcount=list.size();
							int i = 0;
							int count=0;
							p=p*5-5;
							//System.out.println("p="+p);
								while(p<list.size()&&count<5) {
								int j = list.get(i).getId();
							%>
						<tr>
							<td
								style="padding-bottom: -5 ;padding-top: 4px;padding-bottom: 0px;"><%=p+1 %></td>
							<td
								style="padding-bottom: -5;padding-top: 4px;padding-bottom: 0px;"><%=list.get(p).getStartMoney()%></td>
							<td
								style="padding-bottom: -5;padding-top: 4px;padding-bottom: 0px;"><%=list.get(p).getYear()%></td>
							<td
								style="padding-bottom: -5;padding-top: 4px;padding-bottom: 0px;"><%=list.get(p).getRate()%></td>
							<td
								style="padding-bottom: -5;padding-top: 4px;padding-bottom: 0px;"><%=list.get(p).getSum()%></td>
							<td
								style="padding-bottom: -5;padding-top: 4px;padding-bottom: 0px;">
								<ul>
									<li><button id="modify" name = "submit" type="submit" class="btn btn-info" onclick="modify()" >修改</button></li>
									<li><button id="delete" name = "delete" type="submit" class="btn btn-danger" onclick="datadelete('<%=j %>');" >删除</button></li>
								</ul>
								<input type="hidden" id = "deleteresult" name="deleteresult" value="">
							</td>
						</tr>
						
						<%
							count++;
							p++;
							i++;	
						}
						%>
					</table>
				</form>
				
			</div>
			<div class="tabBodyItem">
				<p></p>
			</div>
			<div class="tabBodyItem">
				<p></p>
			</div>
			<div class="tabBodyItem">
				<p></p>
			</div>
			<div class="tabBodyItem">
				<p></p>
			</div>
			<div class="tabBodyItem">
				<p></p>
			</div>
			<div class="tabBodyItem">
				<p></p>
			</div>
			<div class="tabBodyItem">
				<p></p>
			</div>
		</div>
	</div>
	<hr />
	
	<div align="center" id="Pagination" class="pagination"  style = "margin-top: 0px;padding-left: 880px;"> 
						
					<% 
						int page_num;
						if(rowcount<=5)
							page_num=1;
						else
							page_num=(rowcount%5==0)?rowcount/5:rowcount/5+1;	
					%>
						<li><a href='list.jsp?page=1'>首页</a></li>
					<%
						for(int page_index=0;page_index<page_num ;page_index++)
						{
						
					%>
							<li ><a href='list.jsp?page=<%=page_index+1 %>'><%=page_index+1 %></a></li>
					<%
						}
					%>
						<li><a href='list.jsp?page=<%=page_num %>'>尾页</a></li>
				</div>


	<div class="footer" style="border-top-width: 0px;">
		<div class="footer_media_test">
			<p>©2016-2016 孙海林 江志彬 版权所有</p>

			<p>信息：广州商学院 商软2班 223/225</p>

			<p>The First Version</p>

			<p>联系方式: 你猜猜</p>
		</div>
	</div>
</body>

</html>
