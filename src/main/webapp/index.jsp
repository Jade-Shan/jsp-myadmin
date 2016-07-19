<%@ page language="java" pageEncoding="UTF-8" errorPage="error.jsp" contentType="text/html"%>
<%@page import="java.util.*"%>
<%
//
String t=new GregorianCalendar().getTime().toString();
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>JSPMyAdmin 1.1</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link href="./default.css" rel="stylesheet" type="text/css"/>
	<!-- load db Connection config -->
	<script src="db-conn.js"></script>
  </head>
	<body bgcolor="#d0dce0">
		<table>
			<tr>
				<td style="background-color: White; width:1700px"> <img class="icon" src="./images/logo.png" alt="-"> </td>
			</tr>
			</table>
			<center style="text-align: center;"><%=t%></center>
			<form action="Main.jsp" method="post" name="login" onSubmit="return validate(this)" target="_top"> 
			<table align=center bgcolor="#f5f5f5" style="width: 316px; height: 100px">
			<tr>
				<td style="width: 184px;">Database</td>
				<td style="width: 5px"><select id="dbConnections" name="dbConnections" style="width:380px" onChange="changeDbConnection(this.value);"></select></td>
			</tr>
			<tr>
				<td style="width: 184px; height: 3px;"></td>
				<td style="width: 5px; height: 3px">&nbsp;<input type="submit" value="Login" name="login" style="width: 86px"></td>
			</tr>
		</table>
		<input type="hidden" id="user" name="user">
		<input type="hidden" id="pass" name="pass">
		<input type="hidden" id="host" name="host">
		<input type="hidden" id="port" name="port">
		</form>
	</body>
<script language="javascript">
function changeDbConnection(name) {
	for(var i=0; i < dbConnections.length; i++) {
		var itm = dbConnections[i];
		if(name == itm.name) {
			console.log(itm);
			document.getElementById("host").value = itm.host;
			document.getElementById("port").value = itm.port;
			document.getElementById("user").value = itm.username;
			document.getElementById("pass").value = itm.password;
		}
	}
};

function validate(objForm) {
	if(objForm.user.value.length==0){
	alert("Please enter username!");
		objForm.user.focus();
		return false;
	}
	if(objForm.pass.value.length==0){
		alert("Please enter password!");
		objForm.pass.focus();
		return false;
	}
	if(objForm.host.value.length==0){
		alert("Please enter Host Name!");
		objForm.host.focus();
		return false;
	}
	if(objForm.port.value.length==0){
		alert("Please enter port name!");
		objForm.port.focus();
		return false;
	}
	return true;
};

var lst = document.getElementById("dbConnections");
var lstItemHtml = '<option value="">======= Select Database Connection =======</option>';
for(var i=0; i < dbConnections.length; i++) {
	var itm = dbConnections[i];
	lstItemHtml = lstItemHtml + '<option value="' + itm.name + '">' + itm.name + '</option>';
}
lst.innerHTML = lstItemHtml;
</script>
</html>
