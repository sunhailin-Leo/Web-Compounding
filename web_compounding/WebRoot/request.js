/**
 * 
 */
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