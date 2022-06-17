<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Search </title>
<script src="jquery-3.6.0.min.js"></script>
<link rel="stylesheet" type="text/css" href="container.css" />
<link rel="stylesheet" type="text/css" href="base.css" />
<script type="text/javascript" src="javascript/general.js" ></script>
<script type="text/javascript" src="javascript/accordion-menu.js" ></script>
<script type="text/javascript">

	window.onload=function()
    {
    	menu();

        var param = getPara( 'flag');
        if(param==1)
        {
            document.getElementById('list').style.display="block";           
        }
        else
        {
            document.getElementById('list').style.display="none";
        }
    }

    function searchList(flag)
    {
        if(flag==1){
             document.getElementById('list').style.display="block";
        
        }else{
            document.getElementById('list').style.display="none";
           
        }
    }
	function resetForm()
	{
		document.getElementById('message').innerHTML = "Message";
		document.getElementById('list').style.display="none";
	}

	function checkDelete()
    {
        var con = confirm("Are you sure to delete?");
        if(con)
        {
            window.location.replace('USR001.html?flag=1')
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
             <input type="button" value="Reset" class="button" id="userInsert" />
        </a>

	</form>
	<br/>
	<br/>	
	<div id="errormsg">
	<label id="message">Message</label>
	</div>
	</div>
	</div>
    </div></div>
</body>
</html>