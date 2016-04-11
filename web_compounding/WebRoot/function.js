function cls()
		{
    		document.getElementById("num1").value=""; 
    		document.getElementById("num2").value=""; 
    		document.getElementById("num3").value=""; 
    		document.getElementById("endMoney").value=""; 
    		$("#btnSave").attr("disabled",false);
    		$("#num1").next().hide(200);
    		$("#num2").next().hide(200);
    		$("#num3").next().hide(200);
    		$("#endMoney").next().hide(200);
    	}
//初始化左侧选项卡
$(document).ready(function(e) {
	SidebarTabHandler.Init();
});
var SidebarTabHandler = {
	Init : function() {
		$(".tabItemContainer>li").click(
				function() {
					$(".tabItemContainer>li>a").removeClass(
							"tabItemCurrent");
					$(".tabBodyItem").removeClass("tabBodyCurrent");
					$(this).find("a").addClass("tabItemCurrent");
					$($(".tabBodyItem")[$(this).index()]).addClass(
							"tabBodyCurrent");
				});
	}
};
//初始化彩蛋
$(document).ready(function(){
	var machine1 = $("#machine1").slotMachine({
		active	: 0,
		delay	: 500
	});
	
	var machine2 = $("#machine2").slotMachine({
		active	: 1,
		delay	: 500
	});
	
	var machine3 = $("#machine3").slotMachine({
		active	: 2,
		delay	: 500
	});
	
	function onComplete($el, active){
		switch($el[0].id){
			case 'machine1':
				$("#machine1Result").text("Index: "+active.index);
				break;
			case 'machine2':
				$("#machine2Result").text("Index: "+active.index);
				break;
			case 'machine3':
				$("#machine3Result").text("Index: "+active.index);
				break;
		}
	}
	$("#slotMachineButton1").click(function(){
		
		machine1.shuffle(3, onComplete);
		
		setTimeout(function(){
			machine2.shuffle(3, onComplete);
		}, 500);
		
		setTimeout(function(){
			machine3.shuffle(3, onComplete);
		}, 1000);
		
	});
});
//彩蛋打开函数
function openlaohuji()
{
	$("#laohuji").show(200);
}
//彩蛋关闭函数
function closelaohuji()
{
	$("#laohuji").hide(200);
}
//第一个输入框判断合法性
function isnum1(){
	var num1=$("#num1").val();
	var str=/^\s*$/;
	if(str.test(num1)||isNaN(num1)||num1<0||num1>999999999){
		$("#num1").next().text("输入有误！");
		$("#num1").next().show(200);
	}else{
		$("#num1").next().hide(200);
	}
}
//第二个输入框判断合法性
function isnum2(){
	var num2=$("#num2").val();
	var str=/^\s*$/;
	if(str.test(num2)||isNaN(num2)||num2<0||num2>100){
		$("#num2").next().text("输入有误！");
		$("#num2").next().show(200);
	}else{
		$("#num2").next().hide(200);
	}
}
//第三个输入框判断合法性
function isnum3(){
	var num3=$("#num3").val();
	var str=/^\s*$/;
	if(str.test(num3)||isNaN(num3)||num3<0||num3>1){
		$("#num3").next().text("输入有误！");
		$("#num3").next().show(200);
	}else{
		$("#num3").next().hide(200);
	}
}
//第四个输入框判断合法性
function isnum4(){
	var endMoney=$("#endMoney").val();
	var str=/^\s*$/;
	if(str.test(endMoney)||isNaN(endMoney)||endMoney<0||endMoney>999999999){
		$("#endMoney").next().text("输入有误！");
		$("#endMoney").next().show(200);
	}else{
		$("#endMoney").next().hide(200);
	}
}
//创建xmlHttp
var xmlHttp;
function createXMLHttpRequest() {
	if (window.ActiveXObject) {
		xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
	} else if (window.XMLHttpRequest) {
		xmlHttp = new XMLHttpRequest();
	}
}
//防止过度提交
function preventMoreSubmit()
{	
	var a = document.getElementById("num1").value; 
	var b = document.getElementById("num2").value; 
	var c = document.getElementById("num3").value; 
	var d = document.getElementById("endMoney").value; 
	if(a==""&&b==""&&c==""&d=="")
	{
		alert("您输入的是空值，请重新输入");
		$("#btnSave").attr("disabled", false); 
	}
	else
	{
		$("#btnSave").attr("disabled", true); 
		doRequestUsingPost();
	}
} 
//返回状态码
function handleStateChange() {
	if (xmlHttp.readyState == 4) {
		if (xmlHttp.status == 200) {
			parseResults();
			//alert("提交成功");
		}
	}
}
//解析返回值
function parseResults() {
	var responseDiv = document.getElementById("serverResponse");
	if (responseDiv.hasChildNodes()) {
		responseDiv.removeChild(responseDiv.childNodes[0]);
	}
	var responseText = document.createTextNode(xmlHttp.responseText);
	//alert("后台返回的返回值： " + xmlHttp.responseText);
	responseDiv.appendChild(responseText);
}
