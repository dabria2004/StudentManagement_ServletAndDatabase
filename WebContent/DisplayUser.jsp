<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*"%>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
    <%
String id = request.getParameter("userid");
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "testdb";
String userid = "root";
String password = "root";
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<!DOCTYPE html>
<html>
<head>
<style>{
	table,td,th{
		border-collapse: collapse;
	}
}</style>
<meta charset="ISO-8859-1">
<title>Display User</title>
<link rel="stylesheet" type="text/css" href="container.css" />
<link rel="stylesheet" type="text/css" href="base.css" />
<script type="text/javascript" src="javascript/accordion-menu.js" ></script>
<script type="text/javascript" src="javascript/accordion-menu.js" ></script>
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
 	<div id="accordian" style="visibility: visible;">
	
	</div>	
	</div>
	 <div id="main_contents">     
                <div id="contents">
	<div class="search_form">
	<div id="list">
				<form name="listForm" >
					<table style="border: 1px solid black;">
		<tr class="tblHeader">
			<th width="7%" style="border: 1px solid black;">User ID</th>
			<th width="7%" style="border: 1px solid black;">User Name</th>
			<th width="7%" style="border: 1px solid black;">Password</th>
		</tr>
<%
	try{
	connection = DriverManager.getConnection(connectionUrl+database, userid, password);
	statement=connection.createStatement();
	String sql ="select * from user";
	resultSet = statement.executeQuery(sql);
	while(resultSet.next()){
%>
		<tr>
			<td style="border: 1px solid black;"><%=resultSet.getString("user_id") %></td>
			<td style="border: 1px solid black;"><%=resultSet.getString("user_name") %></td>
			<td style="border: 1px solid black;"><%=resultSet.getString("user_password") %></td>
		</tr>
		</table>
		</form>
			</div>    

            </div>
            </div>
            </div>
            </div> 

<%
			}
	connection.close();
		} 	catch (Exception e) {
	e.printStackTrace();
	}
%>


</body>
</html>