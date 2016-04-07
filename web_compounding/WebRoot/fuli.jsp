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


<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css" type="text/css"></link>
<link rel="stylesheet" href="prototype/css/common.css" type="text/css" />
<link rel="stylesheet" href="mycss.css" type="text/css" />
<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="prototype/js/jquery-1.7.min.js"></script>
<script type="text/javascript" src="function.js"></script>


<script type="text/javascript">
var xmlHttp;
	//创建xmlHttp
	function createXMLHttpRequest()
	{
	 if(window.ActiveXObject)
	 {
	  xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
	 }
	 else if(window.XMLHttpRequest)
	 {
	  xmlHttp=new XMLHttpRequest();
	 }
	}
	
	//拼出要发送的姓名数据
	function createQueryString()
	{
	 var i = parseFloat(document.getElementById("num1").value);
	 var j = parseFloat(document.getElementById("num2").value);
	 var k = parseFloat(document.getElementById("num3").value);
	 var sum = i * Math.pow(1 + k, j);
	 if(isNaN(sum))
	 {
		alert("FUCK");
		sum = "";
	 }
	 text = document.getElementById("endMoney");
	 text.value = sum;
	 var queryString = "num1=" + i + "&num2=" + j + "&num3=" + k + "&sum=" + sum; 
	 //alert(queryString);
	 return queryString;
	}
	/*
	//使用get方式发送
	function doRequestUsingGET()
	{
	 createXMLHttpRequest();
	 var queryString="./GetAndPostExample?";
	 queryString=queryString+createQueryString() + "&timeStamp=" + new Date().getTime();
	 xmlHttp.onreadystatechange=handleStateChange;
	 xmlHttp.open("GET",queryString,true);
	 xmlHttp.send(null);
	}
	*/
	//使用post方式发送
	function doRequestUsingPost()
	{
	 createXMLHttpRequest();
	 //var url="./GetAndPostExample?timeStamp=" + new Date().getTime();
	 var url ="./DataServlet?";
	 var queryString=createQueryString();
	 xmlHttp.open("POST",url,true);
	 xmlHttp.onreadystatechange=handleStateChange;
	 xmlHttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
	 xmlHttp.send(queryString);
	}
	
	
	function handleStateChange()
	{
	 if(xmlHttp.readyState==4)
	 {
	  if(xmlHttp.status==200)
	  {
	   //parseResults();
	   //alert("数据提交成功");
	  }
	 }
	}
	//解析返回值
	function parseResults()
	{
	 var responseDiv=document.getElementById("serverResponse");
	 if(responseDiv.hasChildNodes())
	 {
	  responseDiv.removeChild(responseDiv.childNodes[0]);
	 }
	 var responseText=document.createTextNode(xmlHttp.responseText);
	  alert("后台返回的返回值： "+xmlHttp.responseText);
	 responseDiv.appendChild(responseText);
	}
</script>

<script>
		function win(){
			window.onload=document.getElementById("num1").focus();
		}
</script>
	

</head>
	
<body onload="win()">
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
			<li><a href="fuli.jsp" class="tabItemCurrent">复利计算</a></li>
			<li><a href="danli.jsp">单利计算</a></li>
			<li><a href="benjin.jsp">求初值</a></li>
			<li><a href="gupiao.jsp">股票收益</a></li>
			<li><a href="lilv.jsp">求报酬率</a></li>
			<li><a href="dingtou.jsp">定投计算</a></li>
			<li><a href="daikuan.jsp">贷款</a></li>
			<li><a href="list.jsp">投资报表</a></li>
		</div>
		<div class="tabBodyContainer">
			<div class="tabBodyItem tabBodyCurrent">
				<p>欢迎使用投资计算器</p>
				<form id = "form1" action="#" method = "post" >
						<table class="table"> 	
							<tr >
								<td width="100" class="labelTd">
									<span class="red">*</span>本金：
								</td>
								<td>
									<input class="form-control" name="startMoney" onblur="isnum()"  id="num1" value ="">
									<span class="errorMsg"></span>
								</td>
							</tr>
					
							<tr >
								<td  class="labelTd">
									<span class="red">*</span>存的年数：
								</td>
								<td>
									<input class="form-control" name="years" onblur="isnum()" id="num2" value = "">
									<span class="errorMsg"></span>
								</td>
							</tr>	
							<tr>
								<td  class="labelTd">
									<span class="red">*</span>利率：
								</td>
								<td>
									<input  class="form-control " placeholder="请输入您的利率  3%=0.03" name="r" onblur="isnum()" id="num3" value = "">
									<span class="errorMsg"></span>
								</td>
							</tr>	
							<tr>	
								<td  class="labelTd">
									<span class="red">*</span>终值：
								</td>
								<td>
									<input  class="form-control" name="endMoney" id="endMoney"  onblur = "" readonly="readonly" value = "">
									
									<span class="errorMsg"></span>
								</td>
							</tr>
							
							<tr>
								<td class="labelTd">
									<input class="btn btn-success" type="reset" value="重置" onclick="cls()">
								</td>
								<td>
									<input class="form-control btn btn-success" type="button" value="计算" onclick="doRequestUsingPost()" >
								</td>
							</tr>
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
	<div id="serverResponse"></div>
	<div class="footer">
		<div class="footer_media_test">
			<p>©2016-2016 孙海林 江志彬 版权所有</p>

			<p>信息：广州商学院 商软2班  223/225</p>

			<p>The First Version</p>

			<p>联系方式: 你猜猜</p>
		</div>
	</div>

</body>


</html>
