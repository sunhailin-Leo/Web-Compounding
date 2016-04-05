function cls(){
    		document.getElementById("num1").value=""; 
    		document.getElementById("num2").value=""; 
    		document.getElementById("num3").value=""; 
    		document.getElementById("endMoney").value=""; 
    	}

function isnum(){
	if(isNaN(document.getElementById("num1").value)){
		document.getElementById("num1").style.color='#FF0000';
		document.getElementById("num1").focus();
	}
	else{
		document.getElementById("num1").style.color='#000000';
	}
	if(isNaN(document.getElementById("num2").value)){
		document.getElementById("num2").style.color='#FF0000';
		document.getElementById("num2").focus();
	}
	else{
		document.getElementById("num2").style.color='#000000';
	}
	if(isNaN(document.getElementById("num3").value)){
		document.getElementById("num3").style.color='#FF0000';
		document.getElementById("num3").focus();
	}
	else{
		document.getElementById("num3").style.color='#000000';
	}
	if(isNaN(document.getElementById("endMoney").value)){
		document.getElementById("endMoney").style.color='#FF0000';
		document.getElementById("endMoney").focus();
	}
	else{
		document.getElementById("endMoney").style.color='#000000';
	}	
	
}

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