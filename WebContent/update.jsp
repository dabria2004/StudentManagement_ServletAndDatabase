<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>(USR002)User Update</title>
<link rel="stylesheet" type="text/css" href="container.css" />
<link rel="stylesheet" type="text/css" href="base.css" />
<script type="text/javascript" src="javascript/general.js"></script>
<script type="text/javascript" src="javascript/accordion-menu.js"></script>
<script type="text/javascript">
	window.onload = function() {
		menu();

	}

	function update() {
		var con = confirm("Are you sure to register?");
		if (con) {
			window.close();
		}

	}
</script>
</head>
<body class="main_body">
	<%
		if (session.getAttribute("userInfo") == null) {
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
		<a href="LogoutServlet"><input id="btn_logout" class="button"
			type="submit" value="Logout"></a>
	</div>
	<div id="container">
		<div id="left_menu">
			<div id="accordian" style="visibility: visible;">
				<ul>
					<li class="top has-sub">
						<div>
							<div class="caret active"></div>
							"Class Management"
						</div>
						<ul id="sec"
							style="transition: all 150ms ease 0s; display: block; padding-top: 0px; margin-bottom: 0px; margin-top: 0px; height: auto;">
							<li><a href="Class.jsp">Class Registration</a></li>
							<li><a href="Student_Search.jsp">Student Search</a></li>
							<li><a href="Student_Register.jsp">Student Registration</a></li>
						</ul>
					</li>
					<li id="no-child" class="top"><a href="User_Search.jsp"
						style="font-weight: bold;">User Management</a></li>
				</ul>
			</div>
		</div>
		<div id="main_contents">
			<div id="contents">
				<h3>User Update</h3>
				<label id="errormsg"> Message </label><br />
				<br />
				<br />
				<div style="color: red;">${upsuccess}</div>
				<div style="color: red;">${error}</div>
				<div style="color: red;">${upfail}</div>
				<form name="registerForm" method="post" action="UserUpdateServlet">
					<table class="tableForm">
						<tr>
							<td class="tblSingleLabel">User ID *</td>
							<td class="tblSingleInput"><input type="text" name="id"
								value="${user.rid}"></td>
						</tr>
						<tr>
							<td class="tblSingleLabel">User Name</td>
							<td class="tblSingleInput"><input type="text"
								class="txtlong_popup" id="txtUserName" name="name"
								value="${user.rname}" /></td>
						</tr>
						<tr>
							<td class="tblSingleLabel">Password *</td>
							<td class="tblSingleInput"><input type="password"
								class="txtlong_popup" id="txtUserName" name="password"
								value="${user.rpassword}" /></td>
						</tr>
					</table>
					<br /> <input type="submit" value="Update" class="button" /> 
					
					<input type="button" value="Back" class="button"
						onClick="window.location.replace('User_Search.jsp')" />
				</form>
				<br />
				<br />
				<br />
			</div>
		</div>
	</div>
	<div class="footer">
		<span>Copyright &#169; ACE Inspiration 2016</span>
	</div>
</body>
</html>