<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script language="javascript" src="confirm.js" type="text/javascript"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="./default.css" rel="stylesheet" type="text/css"/>

</head>
<body bgcolor="#f5f5f5">

<form>
<a href="welcome.jsp">Server : <% out.println(request.getParameter("server"));%></a>&nbsp;&nbsp;&nbsp;&nbsp;<img class="icon" src="./images/arrow.png" alt="-" width="5" height="9">&nbsp;&nbsp;&nbsp;&nbsp;<a href="right.jsp?server=<%=request.getParameter("server")%>&db=<%=request.getParameter("db") %>">Database : <% out.println(request.getParameter("db"));%></a>
<%if (request.getParameter("table")!=null && request.getParameter("table")!=""){%>
&nbsp;&nbsp;&nbsp;&nbsp;<img class="icon" src="./images/arrow.png" alt="-" width="5" height="9">&nbsp;&nbsp;&nbsp;&nbsp;
<a href="tabledata.jsp?server=<%=request.getParameter("server")%>&db=<%=request.getParameter("db") %>&table=<%=request.getParameter("table") %>">Table : <% out.println(request.getParameter("table"));%></a>
<%}%>

                <div id="tabs1">
                        <ul>
                                <!-- CSS Tabs -->
<li id="current"><a href="right.jsp?server=<%=request.getParameter("server")%>&db=<%=request.getParameter("db")%>"><span>Structure</span></a></li>

<%if (request.getParameter("table") == null || "".equals(request.getParameter("table"))){%>
<li><a href="query.jsp?server=<%=request.getParameter("server")%>&db=<%=request.getParameter("db")%>"><span>Query</span></a></li>
<li><a href="update.jsp?server=<%=request.getParameter("server")%>&db=<%=request.getParameter("db")%>"><span>Update</span></a></li>
<%} else { %>
<li><a href="query.jsp?server=<%=request.getParameter("server")%>&db=<%=request.getParameter("db")%>&table=<%=request.getParameter("table")%>"><span>Query</span></a></li>
<li><a href="update.jsp?server=<%=request.getParameter("server")%>&db=<%=request.getParameter("db")%>&table=<%=request.getParameter("table")%>"><span>Update</span></a></li>
<%}%>

<li><a href="tabledata.jsp?server=localhost&db=mysql&table=user"><span>Privileges</span></a></li>

<%if (request.getParameter("table") == null || "".equals(request.getParameter("table"))){%>
<!--
<li><a href="javascript:dDatabase('drop.jsp?db=<%=request.getParameter("db")%>')" target="jspmain"><span>Drop Database <%=request.getParameter("db")%></span></a></li>
-->
<%} else { %>
<li><a href="export.jsp?db=<%=request.getParameter("db")%>&table=<%=request.getParameter("table")%>"><span>Export</span></a></li>

<!--
<li><a href="javascript:dData('drop.jsp?db=<%=request.getParameter("db")%>&table=<%=request.getParameter("table")%>&empty=yes')" target="jspmain"><span>Drop Data in <%=request.getParameter("table")%></span></a></li>
<li><a href="javascript:dTable('drop.jsp?db=<%=request.getParameter("db")%>&table=<%=request.getParameter("table")%>')" target="jspmain"><span>Drop Data and Table <%=request.getParameter("table")%></span></a></li>
-->
<%}%>

                        </ul>
                </div>
</form>
</body>
</html>
