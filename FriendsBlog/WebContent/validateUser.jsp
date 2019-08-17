<%@page import="java.sql.ResultSet"%>
<%@page import="com.bhanoo.config.DBConfig" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
		String u=request.getParameter("uemail");
		String p=request.getParameter("upass");
		ResultSet rs=DBConfig.executeQuery("select * from user where email='"+u+"' and pswd='"+p+"'");
	%>
	
	<c:set var="rs" value="<%=rs%>"/>
		
		<c:if test="${rs != null}">
			<%
				session.setAttribute("cuser", request.getParameter("uname"));
				RequestDispatcher rd=request.getRequestDispatcher("friends.jsp");
				rd.forward(request, response);
			%>
		</c:if>
</body>
</html>