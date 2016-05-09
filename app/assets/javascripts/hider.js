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

function seen_message(e){
	$(e).closest('#msg-stat').removeClass("unseen-message");
	$(e).closest('#msg-stat').addClass("seen-message");
	$(e).hide();
	var i = $(e).attr('data-id');
	$.ajax({
		type: 'POST',
		url: '/messages/update_seen',
		data: {msg_id: i}
	});
	document.getElementById("seen-notice").innerHTML = "<i>seen</i>";
}

function delete_message(e){
	$(e).closest('#msg').hide();
	var i = $(e).attr('data-id');
	$.ajax({
		type: 'POST',
		url: '/messages/delete',
		data: {msg_id: i}
	});
}

function add_wishlist(e){
	$(e).hide();
	document.getElementById("seen-notice").innerHTML = "<i>seen</i>";



}