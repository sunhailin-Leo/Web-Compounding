<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
%>
<html>
<head>
<title>金融计算器</title>
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="this is my page">
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">  
<meta http-equiv="pragma" content="no-cache">   
<meta http-equiv="Cache-Control" content="no-cache, must-revalidate"> 
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css" type="text/css"></link>
<link rel="stylesheet" href="prototype/css/common.css" type="text/css" />
<link rel="stylesheet" href="mycss.css" type="text/css" />
<link rel="stylesheet" href="css/reset.css" type="text/css"></link>
<link rel="stylesheet" href="css/style.css" type="text/css"></link>
<script type="text/javascript" src="js/jquery-2.1.1.min.js"></script>
<script type="text/javascript" src="js/jquery.slotmachine.js"></script>
<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="function.js"></script>
<script type="text/javascript">	
		//使用post方式发送
		function doRequestUsingPost() 
		{
			createXMLHttpRequest();
			var url = "./DataDanliServlet?";
			var queryString = createQueryString();
			xmlHttp.open("POST", url, true);
			xmlHttp.onreadystatechange = handleStateChange;
			xmlHttp.setRequestHeader("Content-Type",
					"application/x-www-form-urlencoded");
			xmlHttp.send(queryString);
		}
        function createQueryString() {
		var i = parseFloat(document.getElementById("num1").value);
		var j = parseFloat(document.getElementById("num2").value);
		var k = parseFloat(document.getElementById("num3").value);
		var sum=i*k*j;
		if (isNaN(sum)) {
			sum = "";
		}
		text = document.getElementById("endMoney");
		text.value = sum + i;
		var queryString = "num1=" + i + "&num2=" + j + "&num3=" + k + "&sum="
				+ sum;
		return queryString;
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
			<li><a href="fuli.jsp" >复利计算</a></li>
			<li><a href="danli.jsp" class="tabItemCurrent">单利计算</a></li>
			<li><a href="benjin.jsp">求初值</a></li>
			<li><a href="gupiao.jsp">股票收益</a></li>
			<li><a href="lilv.jsp">求报酬率</a></li>
			<li><a href="dingtou.jsp">定投计算</a></li>
			<li><a href="daikuan.jsp">贷款</a></li>
			<li><a href="list.jsp">投资报表</a></li>
		</div>
		<div class="tabBodyContainer">
			<div class="tabBodyItem tabBodyCurrent" style="height: 350px">
				<p>欢迎使用投资计算器</p>
					<form >
						<table class="table">
							<tr >
								<td  class="labelTd">
									<span class="red">*</span>本金：
								</td>
								<td>
									<input class="form-control" name="startMoney" onblur="isnum1()" id="num1">
									<span class="errorMsg"></span>
								</td>
							</tr>				
							<tr >
								<td  class="labelTd">
									<span class="red">*</span>存的年数：
								</td>
								<td>
									<input class="form-control" name="years" onblur="isnum2()" id="num2">
									<span class="errorMsg"></span>
								</td>
							</tr>	
							<tr>
								<td  class="labelTd">
									<span class="red">*</span>利率：
								</td>
								<td>
									<input class="form-control" placeholder="请输入您的利率   3%=0.03" name="r" onblur="isnum3()" id="num3">
									<span class="errorMsg"></span>
								</td>
							</tr>	
							<tr>	
								<td  class="labelTd">
									<span class="red">*</span>终值：
								</td>
								<td>
									<input class="form-control" name="endMoney" id="endMoney" readonly="readonly">
									
									<span class="errorMsg"></span>
								</td>
							</tr>						
							<tr>
								<td class="labelTd">
									<input class="btn btn-success" type="submit" value="重置" onclick="cls()">
								</td>
								<td>
									<input class="form-control btn btn-success" type="button" value="计算" onclick="preventMoreSubmit()">
								</td>
							</tr>
						</table>
						<div align="center"><font style="font-size: 12px">温馨提示：计算完后请按重置键，防止恶意提交</font></div>
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
		</div>
	</div>
	<hr />
	<div class="footer">
		<div class="footer_media_test">
			<p>©2016-2016 孙海林 江志彬 版权所有</p>
			<p>信息：广州商学院 商软2班  223/225</p>
			<p>1.0.0 lastest</p>
			<p>联系方式: 你猜猜</p>
		</div>
	</div>
</body>
<script type="text/javascript" src="prototype/js/jquery-1.7.min.js"></script>
<script type="text/javascript" src="function.js"></script>
</html>