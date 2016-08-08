<%@ page language="java" import="java.sql.*" pageEncoding="UTF-8"%>
<%@ include file="login.jsp"%>
<%
String optType = request.getParameter("optType");
String db = request.getParameter("db");  
String table = request.getParameter("table");
String query = request.getParameter("textarea");
String newtblname = request.getParameter("table");
String newtblfields = request.getParameter("newtblfields");
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

ResultSetMetaData rsmd;

int num_rows=0;

PreparedStatement pstm = con.prepareStatement("USE " + db);
ResultSet rst = pstm.executeQuery();
%>
<%@ include file="header.jsp"%>
<% 
if (request.getParameter("row1col1") != null) {
	for(int i=1; i<=Integer.parseInt(newtblfields); i++) {
		if (request.getParameter("row" + i + "col1") != "") {
			if (query=="") {
				query = request.getParameter("row" + i + "col1") + " " + request.getParameter("row" + i + "col2") + "(" + request.getParameter("row" + i + "col3") + ") " + request.getParameter("row" + i + "col4");
			} else {
				query = query+ ","+ request.getParameter("row" + i + "col1") + " " + request.getParameter("row" + i + "col2") + "(" + request.getParameter("row" + i + "col3") + ") " + request.getParameter("row" + i + "col4");
			}
		} else { break; }
	}
	query="(" + query + ")";
	
	pstm = con.prepareStatement("CREATE TABLE " + newtblname + query);
	pstm.execute();

	out.println("Table : " + newtblname +" created successfully!");
}
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<script language="javascript" src="confirm.js" type="text/javascript"></script>
		<base href="<%=basePath%>">
		<title>Table Data</title>
		<style type="text/css">
table.table-data tr.head td {font-family: Calibri;font-weight: bold; text-align: center; background-color: #d0dce0}
table.table-data tr.row0 {width: 300px; text-align: left; background-color:#f5f5f5 }
table.table-data tr.row1 {width: 300px; text-align: left; background-color:#d0dce0 }
table.table-data tr.row td  {width: 300px; text-align: left;}
		</style>
	</head>
	<body bgcolor="#f5f5f5">
<%
if (optType != null && optType.equals("update")) { // logic for delete or update
	if (query == null || query.equals("")) {
		// do nothing
	} else {
		pstm = con.prepareStatement(query);
		pstm.execute();
	}
	query = "SELECT * FROM "+ table;
} else {                                        // logic for query
	if (query == null || query.equals("")) {
		query = "SELECT * FROM "+ table;
	} 
}

// make sure result is not much than 500 rows
if (query.contains(" limit ")) {
	// do nothing
} else {
	query = query + " limit 500 ";
}
pstm = con.prepareStatement(query);
rst = pstm.executeQuery();
rst = pstm.getResultSet();
rsmd = rst.getMetaData();
%>
		<table class="table-data">
			<tr class="head">
				<td rowspan="2">Action</td>
<% for(int i=1;i<=rsmd.getColumnCount(); i++) { %>
				<td><%=rsmd.getColumnName(i).toString() %></td>
<% } %>
			</tr>
			<tr class="head">
<% for(int i=1;i<=rsmd.getColumnCount(); i++) { %>
				<td><%=rsmd.getColumnTypeName(i) + "(" + rsmd.getColumnDisplaySize(i) + ")" %></td>
<% } %>
			</tr>
<% while(rst.next()) { %>
			<tr class="row row<%=num_rows % 2 %>" >
				<td><a href="javascript:dRecord('deletedata.jsp?db=<%=db%>&table=<%=table%>&field=<%=rsmd.getColumnName(1) %>&val=<%=rst.getString(1) %>')"><img class="icon" src="./images/Delete.gif" alt="Delete Record"/></a></td>
<% for(int i=1; i<=rsmd.getColumnCount(); i++) { %>
				<td><%=rst.getString(i) %></td>
<% } %>
			</tr>
<%
	num_rows++;
}
%>
			<tr>
				<td><input type="submit" value="Delete" name="delete"></td>
				<td style="width: 300px;font-family: Calibri;font-weight: bold; text-align: center; background-color: #d0dce0"><%=num_rows %>Row(s)</td>
<% for(int i=1; i<rsmd.getColumnCount(); i++) { %>
				<td style="width: 300px;font-family: Calibri;font-weight: bold; text-align: center; background-color: #d0dce0"></td>
<% } %>
			</tr>
		</table>
		&nbsp; &nbsp; &nbsp; &nbsp;<br>
		<form method=post action="insertdata.jsp?newtblfields=<%=rsmd.getColumnCount()%>&db=<%=db %>&table=<%=table %>">
			<br>
			&nbsp; &nbsp;Insert New Row<br>
			&nbsp; &nbsp; &nbsp;
			<table style="width: 1000px">
				<tr>
					<td style="width: 100px;font-family: Calibri;font-weight: bold; text-align: center; background-color: #d0dce0">Action</td>
<% for(int i=1;i<=rsmd.getColumnCount(); i++) { %>
					<td style="width: 300px;font-family: Calibri;font-weight: bold; text-align: center; background-color: #d0dce0">
						<%=rsmd.getColumnName(i).toString() + "  " + rsmd.getColumnTypeName(i) + "(" + rsmd.getColumnDisplaySize(i) + ")" %>
					</td>
<% } %>
				</tr>

				<tr>
					<td > <input type="submit" value="Insert" name="insert"> </td>           
<% for(int i=1; i<=rsmd.getColumnCount(); i++) { %>
					<td style="width: 300px;text-align: left;background-color:#f5f5f5">
						<input type="text" name=<%="col" + i %> style="width: 100px;" >
					</td>
<% } %>
				</tr>
			</table>
		</form>
	</body>
</html>
