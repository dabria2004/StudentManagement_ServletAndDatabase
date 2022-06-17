<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<title>(BUD001)Student Search</title>
<link rel="stylesheet" type="text/css" href="container.css" />
<link rel="stylesheet" type="text/css" href="base.css" />
<script type="text/javascript" src="javascript/general.js" ></script>
<script type="text/javascript" src="javascript/accordion-menu.js" ></script>
<script type="text/javascript">
    window.onload=function()
    {
        menu();
        var param = getPara('flag');
        if(param==1)
        {
            document.getElementById('list').style.display="none";           
        }
        else if(param==2)
        {
            document.getElementById('list').style.display="block";
        }      

    }
    function changeName()
    {
        var ascName = document.getElementById('ascName').style.display;
        var dscName = document.getElementById('dscName').style.display;
        if(ascName == 'none')
        {
            document.getElementById('ascName').style.display = 'inline';
            document.getElementById('dscName').style.display= 'none';
        }
        else if(ascName == 'inline')
        {
            document.getElementById('ascName').style.display = 'none';
            document.getElementById('dscName').style.display= 'inline';
        }
    }
    function searchList()
    {
        document.getElementById('list').style.display="block";
    }

    function resetForm()
    {
        document.getElementById('message').innerHTML = "Message";
        document.getElementById('list').style.display="none";
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
                        <h3>Student Search Page</h3>
                        <div style="color:red;"> ${upsuccess}</div>
                        
		<form action="StudentSearchServlet" method="post">
			<table class="tableForm">
				<tr>
					<td class="tblLabel">Student No.</td>                       
					<td class="tblInputShort">
						<input type="text" name="id" class="txt" />  
					</td>
					<td class="tblLabel">Student Name</td>  
					<td class="tblInputShort">
						<input type="text" name="name" class="txt"/>
					</td>
				<tr/> 
				<tr>
					<td class="tblLabel">Class Name</td> 
					<td class="tblInputNormal" colspan="3">
						<input type="text" id="companyName" class="txtlong" name="cname"/>
					</td>   
				</tr>                                        
			</table>
			<br/> 
				<input type="submit"  value="Search" class="button"/>
				<input type="button"  value="Reset" onClick="resetForm()" class="button"/>
			<br/><br/>
		<div id="errormsg">
			<label id="message">Message</label>
		</div>  
		</form>
</div>   
                </div>  
            </div>
            
     </div>

    <div class="footer"> 
            <span>Copyright &#169; ACE Inspiration 2016</span>        
    </div>
</body>
</html>