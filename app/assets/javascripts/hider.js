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