//获取系统当前时间
function getDate(){
	date=new Date();
	year=date.getFullYear();
	month=checkDate(date.getMonth()+1);
	day=checkDate(date.getDate());
	hour=checkDate(date.getHours());
	minute=checkDate(date.getMinutes());
	second=checkDate(date.getSeconds());
	str=year+'-'+month+'-'+day+' '+hour+':'+minute+':'+second;
	return str;
}
//调整时间显示格式
function checkDate(date){
	if(date<10){
		date="0"+date;
	}
	return date;
}