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
	<sql:setDataSource driver="org.h2.Driver"
		url="jdbc:h2:tcp://localhost/~/FriendsProject" user="sa" password=""
		var="ds" />
		
		
		<sql:query var="rs" dataSource="ds">
			select * from user
		</sql:query>
		
		
		<table>
		<c:forEach items="${rs.row}" var="user">
			<tr>
				<td>
					${user.email}
				</td>
				
			</tr>
			</c:forEach>
		</table>
</body>
</html>