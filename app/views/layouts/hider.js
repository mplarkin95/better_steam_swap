function Alternate(inner_string){
	if(document.getElementById("hider").innerHTML==inner_string)
	{
		document.getElementById("hider").innerHTML="Hide"
	}else
	{
		document.getElementById("hider").innerHTML=inner_string
	}
}

function Alt(strI, strO){
	if(document.getElementById("hider").innerHTML==strI)
	{
		document.getElementById("hider").innerHTML=strO
	}else
	{
		document.getElementById("hider").innerHTML=strI
	}
}