function Alternate(inner_string){
	if(document.getElementById("hider").innerHTML==inner_string)
	{
		document.getElementById("hider").innerHTML="Hide"
	}else
	{
		document.getElementById("hider").innerHTML=inner_string
	}
}

function Alt(id,strA,strB){
	if(document.getElementById(id).innerHTML==strA)
	{
		document.getElementById(id).innerHTML=strB
	}else
	{
		document.getElementById(id).innerHTML=strA
	}
}

function inbox()
{
	$('#Outbox').hide();
	$('#Inbox-btn').addClass("btn-primary");
	$('#Inbox').show();
	$('#Sent-btn').removeClass("btn-primary");
	document.getElementById("box").innerHTML = "Inbox";
}	

function outbox(){

	$('#Inbox').hide();
	$('#Sent-btn').addClass("btn-primary");
	$('#Outbox').show();
	$('#Inbox-btn').removeClass("btn-primary");
	document.getElementById("box").innerHTML = "Outbox";
}