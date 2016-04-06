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
					//MIME����
					request.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
					request.onreadystatechange = resFun;
					parameter = encodeURI(parameter);
					request.send(parameter);
				}
		}
	else
		{
			alert("���������֧��Ajax");
		}
	return request;
}
 */


	var XMLHttpReq;
	//����XMLHttpRequest����       
	function createXMLHttpRequest() 
	{
		if (window.XMLHttpRequest) 
		{ //Mozilla �����
			XMLHttpReq = new XMLHttpRequest();
		}
		else if (window.ActiveXObject) 
		{ // IE�����
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
	//����������
	function sendRequest(url) {
		createXMLHttpRequest();
		XMLHttpReq.open("POST", url, true);
		XMLHttpReq.onreadystatechange = processResponse;//ָ����Ӧ����
		XMLHttpReq.send(null); // ��������
	}
	// ��������Ϣ����
	function processResponse() {
		if (XMLHttpReq.readyState == 4) 
		{ // �ж϶���״̬
			if (XMLHttpReq.status == 200) 
			{ // ��Ϣ�Ѿ��ɹ����أ���ʼ������Ϣ
				var res = XMLHttpReq.responseXML.getElementsByTagName("res")[0].firstChild.data;
				//window.alert(res);
				window.alert("���������ҳ��ɹ���");
			} else 
			{ //ҳ�治����
				window.alert("���������ҳ�����쳣��");
			}
		}
	}