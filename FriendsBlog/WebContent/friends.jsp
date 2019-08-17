<%@page import="com.bhanoo.config.DBConfig"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	
	<%
		String email=request.getParameter("uname");
	
		ResultSet rs=DBConfig.executeQuery("select * from user minus select toid,fromid from friends where fromid='"+email+"' ");
	
	%>
		<c:set var="rs" value="<%=rs %>"/>
		
		<table>
		<%while(rs.next()) {%>
				<tr>
				<td>
					<%=rs.getString(1) %>
				</td>
				<td>
					<button>Send Request</button>
				</td>
			</tr>
			
		
		<%} %>
		
			
		</table>
</body>
</html>