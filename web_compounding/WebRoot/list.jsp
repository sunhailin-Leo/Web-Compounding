<%@page import="com.leo.bean.DataReturnInfo"%>
<%@page import="com.leo.dao.DataReturn"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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

<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css"
	type="text/css"></link>
<link rel="stylesheet" href="prototype/css/common.css" type="text/css" />
<link rel="stylesheet" href="mycss.css" type="text/css" />
<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="prototype/js/jquery-1.7.min.js"></script>
<script type="text/javascript" src="function.js"></script>
<script type="text/javascript" src="request.js"></script>



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
	alert("已提交");
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
		<div class="tabBodyContainer" style ="height: 702px;">
			<div class="tabBodyItem tabBodyCurrent">
				<p>欢迎使用投资计算器</p>
				<form  id = "form2" action="DataDeleteServlet"  method = "post"> 
					<table class="table table-hover" border="1" align="center"
						style="border-top-width: 2px; margin-right: 1px;border-left-width: 1px;border-right-width: 1px;border-bottom-width: 2px;margin-top: 1px;">
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
							DataReturn DR = new DataReturn();
							List<DataReturnInfo> list = DR.readFirstTitle();
							int i = 0;
							for (DataReturnInfo tl : list) {
								int j = list.get(i).getId();
						%>
						<tr>
							<td
								style="padding-bottom: -5;padding-top: 4px;padding-bottom: 0px;"><%=tl.getId()%></td>
							<td
								style="padding-bottom: -5;padding-top: 4px;padding-bottom: 0px;"><%=tl.getStartMoney()%></td>
							<td
								style="padding-bottom: -5;padding-top: 4px;padding-bottom: 0px;"><%=tl.getYear()%></td>
							<td
								style="padding-bottom: -5;padding-top: 4px;padding-bottom: 0px;"><%=tl.getRate()%></td>
							<td
								style="padding-bottom: -5;padding-top: 4px;padding-bottom: 0px;"><%=tl.getSum()%></td>
							<td
								style="padding-bottom: -5;padding-top: 4px;padding-bottom: 0px;">
								<ul>
									<li><button id="modify" name = "submit" type="submit" class="btn btn-info" onclick="modify()" >修改</button></li>
									<li><button id="delete" name = "delete" type="submit" class="btn btn-danger" onclick="datadelete('<%=j%>');" >删除</button></li>
								</ul>
								<input type="hidden" id = "deleteresult" name="deleteresult" value="">
							</td>
						</tr>
						<%
							i++;
						}
						%>
					</table>
				</form>
				<div align="center" style = "margin-top: 161px;">
					<ul class="pagination">
						<li><a href='#'>&laquo;</a></li>
						<li><a href='#'>1 </a></li>
						<li><a href='#'>2</a></li>
						<li><a href='#'>3</a></li>
						<li><a href='#'>&raquo;</a></li>
					</ul>
				</div>
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



	<div class="footer" style="border-top-width: 100px;margin-top: 200px;">
		<div class="footer_media_test">
			<p>©2016-2016 孙海林 江志彬 版权所有</p>

			<p>信息：广州商学院 商软2班 223/225</p>

			<p>The First Version</p>

			<p>联系方式: 你猜猜</p>
		</div>
	</div>
</body>
</html>
