<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>(M00001)Top Menu</title>
<link rel="stylesheet" type="text/css" href="container.css" />
<link rel="stylesheet" type="text/css" href="base.css" />
<script type="text/javascript" src="javascript/accordion-menu.js" ></script>
<script type="text/javascript" src="javascript/general.js" ></script>
<script type="text/javascript">
    window.onload=function()
    {
        menu();  
    }
</script>
</head>
<body class="main_body">
<%
	if(session.getAttribute("userInfo") == null){
		response.sendRedirect("Login.jsp");
	}
	%>	
	
	 <c:set var = "now" value = "<%= new java.util.Date()%>" />
	<div id="header">
	<div id="title">
		<a href="Final_exam.jsp">Student Registration Assignment</a>
	</div>
	<div id="menuLoginTime">
	<table>
		<tr>
			<td>User</td>
			<td>: ${sessionScope.userInfo.rid}
				${sessionScope.userInfo.rname}</td> 
		</tr>
		<tr>
			<td>Current Date</td>
			<td>: ${sessionScope.date}</td>
		</tr>
	</table>
	</div>
		<a href="LogoutServlet"><input id="btn_logout" class="button" type="submit" value="Logout"></a>   
	</div>
	<div id="container"> 
	<div id="left_menu">
	
	</div>
	<div id="main_contents">     
	<div id="contents">
		<h4 style="color:brown;">Welcome...!<br/><br/>
			This is the final exam project of the Java Web Development Course.</h4>
		</div>
	</div> 
	</div>
	<div class="footer">
		<span>Copyright &#169; ACE Inspiration 2016</span>        
	</div>
</body>
</html>