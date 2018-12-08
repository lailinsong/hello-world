function subStr(obj,len){
	if($("#"+obj).text().length>len){
		var str = $("#"+obj).text().substring(0,len)+"...";
		$("#"+obj).text(str);
	}
}