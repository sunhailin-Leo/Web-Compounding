/**
 * 

function httpXMLRequest(reqType,url,async,resFun,parameter)
{
	var request = null;
	if(window.XMLHttpRequest)
		{
			request = new XMLHttpRequest();
		}
	else if(window.ActiveXObject)
		{
			var arrSignatures =["Msxml2.XMLHTTP","Microsoft.XMLHTTP","Microsoft.XMLHTTP","MSXML2.XMLHTTP.5.0","MSXML2.XMLHTTP.4.0","MSXML2.XMLHTTP.3.0","MSXML2.XMLHTTP"];
			for ( var i = 0; i < arrSignatures.length; i++) 
			{
				request = new ActiveXObject(arrSignatures[i]);
				if(request||typeof(request)=="object")
					{
						break;
					}
			}
		}
	if(request||typeof(request)=="object")
		{
			if(reqType.toLowerCase()=="post")
				{
					request.open(reqType, url, true);
					//MIME类型
					request.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
					request.onreadystatechange = resFun;
					parameter = encodeURI(parameter);
					request.send(parameter);
				}
		}
	else
		{
			alert("该浏览器不支持Ajax");
		}
	return request;
}
 */


	var XMLHttpReq;
	//创建XMLHttpRequest对象       
	function createXMLHttpRequest() 
	{
		if (window.XMLHttpRequest) 
		{ //Mozilla 浏览器
			XMLHttpReq = new XMLHttpRequest();
		}
		else if (window.ActiveXObject) 
		{ // IE浏览器
			try 
			{
				XMLHttpReq = new ActiveXObject("Msxml2.XMLHTTP");
			} 
			catch (e) 
			{
				try 
				{
					XMLHttpReq = new ActiveXObject("Microsoft.XMLHTTP");
				} 
				catch (e) 
				{
				
				}
			}
		}
	}
	//发送请求函数
	function sendRequest(url) {
		createXMLHttpRequest();
		XMLHttpReq.open("POST", url, true);
		XMLHttpReq.onreadystatechange = processResponse;//指定响应函数
		XMLHttpReq.send(null); // 发送请求
	}
	// 处理返回信息函数
	function processResponse() {
		if (XMLHttpReq.readyState == 4) 
		{ // 判断对象状态
			if (XMLHttpReq.status == 200) 
			{ // 信息已经成功返回，开始处理信息
				var res = XMLHttpReq.responseXML.getElementsByTagName("res")[0].firstChild.data;
				//window.alert(res);
				window.alert("您所请求的页面成功。");
			} else 
			{ //页面不正常
				window.alert("您所请求的页面有异常。");
			}
		}
	}