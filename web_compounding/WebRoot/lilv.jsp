<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<title>index.html</title>

<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="this is my page">
<meta http-equiv="content-type" content="text/html; charset=UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1.0">  
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css"
	type="text/css"></link>
<script type="text/javascript" src="js/jquery-1.7.min.js"></script>
<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="prototype/css/common.css" type="text/css" />
<link rel="stylesheet" href="mycss.css" type="text/css" />

	<script>	
        function add(){
       		var i =	parseFloat(document.getElementById("num1").value);//初值
       		var j = parseFloat(document.getElementById("endMoney").value);//终值
       		var k = parseFloat(document.getElementById("num2").value);//年数
       		//r=Math.pow((endmoney/startmoney), 1/years)-1
        	var sum=Math.pow((j/i), 1/k)-1;
          	text=document.getElementById("num3");
          	text.value=sum;
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
			<li><a href="fuli.jsp" >复利计算</a></li>
			<li><a href="danli.jsp">单利计算</a></li>
			<li><a href="benjin.jsp">求初值</a></li>
			<li><a href="gupiao.jsp">股票收益</a></li>
			<li><a href="lilv.jsp" class="tabItemCurrent">求报酬率</a></li>
			<li><a href="dingtou.jsp">定投计算</a></li>
			<li><a href="daikuan.jsp">贷款</a></li>
			<li><a href="list.jsp">投资报表</a></li>
		</div>
		<div class="tabBodyContainer">
			<div class="tabBodyItem tabBodyCurrent">
				<p>欢迎使用投资计算器</p>
				
						<table class="table">
							<tr >
								<td class="labelTd" style=" width: 235px; " >
									<span class="red">*</span>本金：
								</td>
								<td>
									<input class="form-control" name="startMoney" onblur="isnum()" id="num1">
									<span class="errorMsg"></span>
								</td>
							</tr>
					
							<tr >
								<td  class="labelTd">
									<span class="red">*</span>存的年数：
								</td>
								<td>
									<input class="form-control" name="years" onblur="isnum()" id="num2" >
									<span class="errorMsg"></span>
								</td>
							</tr>	
							<tr>
								<td  class="labelTd">
									<span class="red">*</span>利率：
								</td>
								<td>
									<input class="form-control" name="r" id="num3" disabled="disabled">
									<span class="errorMsg"></span>
								</td>
							</tr>	
							<tr>	
								<td  class="labelTd">
									<span class="red">*</span>终值：
								</td>
								<td>
									<input class="form-control" name="endMoney" onblur="isnum()" id="endMoney">
									
									<span class="errorMsg"></span>
								</td>
							</tr>
							
							<tr>
								<td class="labelTd">
									<input class="btn btn-success" type="submit" value="重置" onclick="cls()">
								</td>   
								<td>
									<input class="form-control btn btn-success" type="submit" value="计算" onclick="add()">
								</td>
							</tr>
						</table>


					
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

			<p>0.0.4 lastest</p>

			<p>联系方式: 你猜猜</p>
		</div>
	</div>


</body>

<script type="text/javascript" src="prototype/js/jquery-1.7.min.js"></script>
<script type="text/javascript" src="function.js"></script>

</html>
