<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
    <%@ page import="java.util.*" %>
    <%@ page import="javax.servlet.RequestDispatcher" %>
<!DOCTYPE html>
<html>
<head>
<style>
	table,td,th{
	border-collapse:collapse;
	}
</style>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<script src="jquery-3.6.0.min.js"></script>
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
    <div class="search_form">
	<h3>User Search</h3>
	<form method="post" action="SearchServlet">
	<table class="tableForm">
	<tr>
		<td class="tblLabel"><label>User ID</label></td>
		<td class="tblInputNormal"><input type="text" id="txtUserId" class="txt" name="uid"/>	</td>
	
		<td class="tblLabel">User Name	</td>
		<td class="tblInputNormal"><input type="text" id="txtUserName" class="txt" name="uname"/>	　</td>
		</tr>
	</table>
		<br/>
		<input type="submit"  value="Search" class="button"/>
		<a href="User_Register.jsp">
             <input type="button" value="Add" class="button" id="userInsert" />
        </a>
        <a href="User_Search.jsp">
             <input type="button" value="Reset" class="button" />
        </a>
		
	</form>
	<br/>
	<br/>	
	<div id="errormsg">
	<label id="message">Message</label>
	</div>
	</div>   
	<br/><br/><br/>
	<div id="list">
	<div style="color:red;"> ${error}</div>
	<table style="border: 1px solid black;">
	
		<tr class="tblHeader">
			<th width="3%" style="border: 1px solid black;">Delete</th>
			<th width="3%" style="border: 1px solid black;">Update</th>
			<th width="12%" style="border: 1px solid black;">User ID</th>
			<th width="24%" style="border: 1px solid black;">User Name</th>
		</tr>
    
    <c:forEach var = "user" items = "${userList}">
		<tr>
			<td id="userUpdate" style="border: 1px solid black;">
				<a href="UserUpdateServlet?uid=${user.rid}">Update</a>
			</td>
			<td id="delete" style="border: 1px solid black;">
				<a href="DeleteUserServlet?uid=${user.rid}">Delete</a>
			</td>
			<td style="border: 1px solid black;">${user.rid}</td>
			<td style="border: 1px solid black;">${user.rname}</td>
		</tr>
	</c:forEach>
           
        </table>
		
		</div>    
		</div>	
		</div>
		</div> 
		<div class="footer"> 
		<span>Copyright &#169; ACE Inspiration 2016</span>        
		</div>
</body>
</html>