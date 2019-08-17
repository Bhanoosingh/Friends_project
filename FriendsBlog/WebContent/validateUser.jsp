<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<sql:setDataSource driver="org.h2.Driver"
		url="jdbc:h2:tcp://localhost/~/FriendsProject" user="sa" password=""
		var="ds" />
		
		<sql:query var="rs" dataSource="ds">
			select * from user where email='<%=request.getParameter("uname")%>' and pswd='<%=request.getParameter("upass") %>'
		</sql:query>
		
		<c:if test="${rs != null}">
			<%
				session.setAttribute("cuser", request.getParameter("uname"));
				RequestDispatcher rd=request.getRequestDispatcher("friends.jsp");
				rd.forward(request, response);
			%>
		</c:if>
</body>
</html>