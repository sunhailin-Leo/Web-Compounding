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


<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css"
	type="text/css"></link>
<script type="text/javascript" src="js/jquery-1.7.min.js"></script>
<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="prototype/css/common.css" type="text/css" />
<link rel="stylesheet" href="mycss.css" type="text/css" />

	<script>	
        function add(){
       		var i =	parseFloat(document.getElementById("num1").value);//初值
       		var j = parseFloat(document.getElementById("num2").value);//年数
       		var k = parseFloat(document.getElementById("num3").value);//利率
       		//money*(1+r)*(-1+Math.pow(1+r, years))/r; 按年定投
        	var sum=i*(1+k)*(-1+Math.pow(1+k, j))/k;
          	text=document.getElementById("endMoney");
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
						<a class="navbar-brand" href="#">投资计算器</a>
					</div>

					<!-- Collect the nav links, forms, and other content for toggling -->
					<div class="collapse navbar-collapse"
						id="bs-example-navbar-collapse-1">
						<ul class="nav navbar-nav">
							<li class=""><a href="#">商品查询 <span class="sr-only">(current)</span>
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
			<li><a href="lilv.jsp">求报酬率</a></li>
			<li><a href="dingtou.jsp" class="tabItemCurrent">定投计算</a></li>
			<li><a href="daikuan.jsp">贷款</a></li>
		</div>
		<div class="tabBodyContainer">
			<div class="tabBodyItem tabBodyCurrent">
				<p>欢迎使用投资计算器</p>
				
						<table class="table">
							<tr >
								<td width="100" class="labelTd">
									<span class="red">*</span>定投金额：
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
									<input class="form-control" name="years" onblur="isnum()" id="num2">
									<span class="errorMsg"></span>
								</td>
							</tr>	
							<tr>
								<td  class="labelTd">
									<span class="red">*</span>利率：
								</td>
								<td>
									<input class="form-control" placeholder="请输入您的利率   3%=0.03" name="r" onblur="isnum()" id="num3">
									<span class="errorMsg"></span>
								</td>
							</tr>	
							<tr>	
								<td  class="labelTd">
									<span class="red">*</span>终值：
								</td>
								<td>
									<input class="form-control" name="endMoney" id="endMoney" disabled="disabled">
									
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
			<p>©2004-2014 广州康大职业技术学院 版权所有</p>

			<p>地址：广州市萝岗区九龙镇华师康大教育园</p>

			<p>粤ICP备05065136号</p>

			<p>联系电话: 020-82872088 82872188</p>
		</div>
	</div>


</body>

<script type="text/javascript" src="prototype/js/jquery-1.7.min.js"></script>
<script type="text/javascript" src="function.js"></script>

</html>