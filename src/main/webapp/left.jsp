<%@ page language="java" import="java.sql.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="login.jsp"%>
<%@ include file="functions.jsp"%>
<%
 if (con==null)
		{
			response.sendRedirect("Index.jsp");
		}
%>
<%		
    String server=Host;
    
	PreparedStatement pstm = con.prepareStatement("SHOW DATABASES");
    ResultSet rst = pstm.executeQuery();	        
    int num_dbs=0;
    String[] dblist = new String[mysql_num_rows(rst)];
    while (rst.next()) {
             dblist[num_dbs]=rst.getString(1);
             num_dbs++;
    }
    rst.close();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Main</title>
<link href="./default.css" rel="stylesheet" type="text/css"/>
</head>
<body bgcolor="#d0dce0">
<img class="icon" src="./images/logosml.png" alt="-">
		<br>
		<br>
        &nbsp;<a href="welcome.jsp" target="jspmain">Home</a><br>
        &nbsp;<a href="Introduction.pdf">Documentation</a>
        <br>
        
        
        <ul> 
<% 
for(int i=0; i<num_dbs; i++) { 
       String localdb = dblist[i]; 
%> 
 
        <li> 
        <a href="right.jsp?server=<%=server%>&amp;db=<%=localdb%>" target="jspmain"><%=localdb%></a> 
        </li> 
        <% 
       } 
        %> 
        </ul> 
     
        Please  select a Database
</body>
</html>
