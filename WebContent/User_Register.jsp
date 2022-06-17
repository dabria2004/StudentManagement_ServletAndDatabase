<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>(USR002)User Register</title>
<link rel="stylesheet" type="text/css" href="container.css" />
<link rel="stylesheet" type="text/css" href="base.css" />
<script type="text/javascript" src="javascript/general.js" ></script>
<script type="text/javascript" src="javascript/accordion-menu.js" ></script>
<script type="text/javascript">
    window.onload=function()
    {
        menu();     

    }
	
	function insert()
    {
        var con = confirm("Are you sure to register?");
        if(con)
        {
            document.getElementById('errormsg').innerHTML = "Successfully Saved!";
        }
        
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
            <a href="M00001.html">Student Registration Assignment</a>
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
				<h3>User Register</h3>
				<label id="errormsg" > Message </label><br/><br/><br/>
	<div style="color:red;"> ${error}</div>
	<div style="color:blue;"> ${success}</div>
		<form name="registerForm" action="Register_Servlet" method="post">
		<table class="tableForm">
		<tr>
			<td class="tblSingleLabel"> User ID </td>
			<td class="tblSingleInput"><input type="text" id="txtUserId" class="txt_popup" name="rid" value="${res.rid}"/></td>
		</tr>
		<tr>
			<td class="tblSingleLabel">User Name</td>
			<td class="tblSingleInput"><input type="text" class="txtlong_popup" id="txtUserName" name="rname" value="${res.rname}"/></td>              
		</tr>
		<tr>
			<td class="tblSingleLabel">Password </td>
			<td class="tblSingleInput"><input type="password" class="txtlong_popup" id="txtUserName" name="rpassword" value="${res.password}"/></td>              
		</tr>
		<tr>
			<td class="tblSingleLabel">Confirm Password </td>
			<td class="tblSingleInput"><input type="password" class="txtlong_popup" id="txtUserName" name="rconpassword"/></td>              
		</tr>
	 	</table>
		<br/>
		<input type="submit" value="Register" class="button"/>
		</form>
		<br/><br/><br/>
		</div>
        </div> 
    </div>
    <div class="footer"> 
            <span>Copyright &#169; ACE Inspiration 2016</span>        
    </div>
    
</body>
</html>