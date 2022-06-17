<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
	<%@ page import="java.util.*" %>
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
<link rel="stylesheet" type="text/css" href="container.css" />
<link rel="stylesheet" type="text/css" href="base.css" />
<script type="text/javascript" src="javascript/accordion-menu.js" ></script>
<script type="text/javascript" src="javascript/general.js" ></script>
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
                    <div class="search_form">
                        <h3>Student Search Page</h3>
		<form action="StudentSearchServlet" method="post">
			<table class="tableForm">
				<tr>
					<td class="tblLabel">Student No.</td>                       
					<td class="tblInputShort"><input type="text" name="id" class="txt" />  </td>
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
		 <div id="list">
                <form name="listForm" >
                    <Br/><Br/>
                    <br />
                    <table style="border: 1px solid black;">
                        <tr class="tblHeader">
                            <th width="10%" style="border: 1px solid black;">Student No</th>
                            <th width="25%" style="border: 1px solid black;">Student Name</th>
                            <th width="40%" style="border: 1px solid black;">Class Name</th>
                            <th width="10%" style="border: 1px solid black;">Registered Date</th>
                            <th width="10%" style="border: 1px solid black;">Status</th>
                        </tr>
	<%
		int count = 0;
		String color = "#F9EBB3";
		if (request.getAttribute("piList") != null) {
		ArrayList al = (ArrayList) request.getAttribute("piList");
			System.out.println(al);
				Iterator itr = al.iterator();
					while (itr.hasNext()) {
						if ((count % 2) == 0) {
					color = "#eeffee";
				}
			count++;
		ArrayList pList = (ArrayList) itr.next();
	%>
		<tr>
			<td style="border: 1px solid black;"><%=pList.get(0)%></td>
			<td style="border: 1px solid black;"><a href="SelectStudent.jsp?id=<%=pList.get(0)%>"><%=pList.get(1)%></a></td>
			<td style="border: 1px solid black;"><%=pList.get(2)%></td>
			<td style="border: 1px solid black;"><%=pList.get(3)%></td>
			<td style="border: 1px solid black;"><%=pList.get(4)%></td>
		</tr>
	<%
                    }
                }
                if (count == 0) {
            %>
            <tr>
                <td colspan=4 align="center"
                    style="background-color:#eeffee"><b>No Record Found..</b></td>
            </tr>
            <%            }
            %>
                        </table>
                        </form>
                        </div>
                        
</div>   
</div>  
</div>
</div>

</body>
</html>