<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
<link rel="stylesheet" type="text/css" href="container.css" />
<link rel="stylesheet" type="text/css" href="base.css" />
</head>
<body class="main_body" onload="noBack();" onpageshow="if (event.persisted) noBack();" onunload="">
	
	<div id="header">
    <div id="title">
    	<u>Student Registration Assignment</u>     
    </div> 
    </div>

	<div id="container"> 
	<div id="main_contents">     
	<div style="margin-left:35%">
	<form action="LoginServlet" name="confirm" method="post">
		<br/>  
			<table class="sortName">
        <tr>
        	<td colspan="2" align="center"><h2>Login</h2></td>
		</tr>
		                   
		<tr align="left">
			<td>User ID</td>
			<td><input type="text" name="userid" value="${loginInfo.userId}"/></td>
		</tr>
		
		<tr align="left">
			<td>Password</td>
			<td><input type="password" name="password"  value="${loginInfo.userPassword}"/></td>
		</tr>
		<tr>
			<td></td>
			<td><input name="Submit" type="submit" value="Login" class="button"/></td>
		</tr>
	</table>
	
	</form>  
	<div style="color:red;">${error}</div>
	</div>  
	</div> <!-- end of main contents --> 
    </div><!-- end of container -->
    
    <div class="footer">    
        <span>Copyright &#169; ACE Inspiration 2016</span>
    </div> 
</body>
</html>