<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Class Register</title>
<link rel="stylesheet" type="text/css" href="container.css" />
<link rel="stylesheet" type="text/css" href="base.css" />
<script type="text/javascript" src="javascript/accordion-menu.js" ></script>
<script type="text/javascript" src="javascript/general.js" ></script>
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
	<h3>Class Register</h3>
	<label id="errormsg" > Message </label><br/><br/><br/>
	<div style="color:blue;"> ${success}</div>
	<div style="color:red;"> ${error}</div>
	<form action="ClassRegisterServlet" method="post" name="registerForm">
	<table class="tableForm">
		<tr>
			<td class="tblSingleLabel"> Class ID </td>
			<td class="tblSingleInput"><input type="text" id="txtUserId" class="txt_popup" name="classid" value="${classInfo.classid}"/></td>
		</tr>
		<tr>
			<td class="tblSingleLabel">Class Name </td>
			<td class="tblSingleInput"><input type="text" class="txtlong_popup" id="txtUserName" name="classname" value="${classInfo.classname}"/></td>              
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