<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%
String id = request.getParameter("id");
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
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql = "select * from student where student_id='" + id + "' ";

resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>(USR002)User Update</title>
<link rel="stylesheet" type="text/css" href="container.css" />
<link rel="stylesheet" type="text/css" href="base.css" />
<script type="text/javascript" src="javascript/general.js" ></script>
<script type="text/javascript" src="javascript/accordion-menu.js" ></script>
	<script type="text/javascript">
     window.onload=function()
    {
        menu();  
    }

    function deleteBudget()
    {
        var isOk= confirm("Are you sure to delete?");
        if(isOk)
        {
            window.location.replace('BUD001.html?flag=2')  
        }
    }

    function update()
    {
        var con = confirm("Are you sure to update?");
        if(con)
        {
            window.location.replace('BUD001.html?flag=2')
        }
        
    }
    
    function showMessage(){     
        var message = confirm("Are you sure to register?");
        if(message)                 
        document.getElementById('errormsg').innerHTML = "Registration completed.";    
    }
    
    function addListData(source,destination)
    {
        var sourceList=document.getElementById(source.id);
        var sourceSelect=sourceList.selectedIndex;
        
        var len=sourceList.length;
        
        if(sourceSelect!=-1)
        {
            for(i=0;i<len;i++)
            {
                var isExist = false;
                var sourceText=sourceList.options[i].text;
                var destinationList=document.getElementById(destination.id);
                if(sourceList[i].selected)
                {
                    for(var j=0;j<destinationList.length;j++)
                    {
                        if(destinationList.options[j].text == sourceText)
                        {
                            isExist = true;
                        }
                    }
                    if(!isExist)
                    {
                        destinationList.options[destinationList.length]=new Option(sourceText,"0");     
                    }
                }
            }           
        }
    }
    function delListData(source)
    {
        var sourceList=document.getElementById(source.id);
        for(var index=0;index<sourceList.length;index++){   
            if (sourceList[index].selected) {
                sourceList.remove(index);
                delListData(source);
            }
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
	<h3>Student Update</h3>
	<label id="errormsg"> Message </label><br/><br/><br/>
	<div style="color:red;"> ${upfail}</div>
	<form>
		<table class="tableForm">
			<tr height="30px">
				<td class="tblSingleLabel">Student No.</td>
				<td class="tblSingleInput">
					<input type="text" class="txtlong_popup" name="stu_id" value="<%=resultSet.getString("student_id") %>"/>
				</td>
			</tr>
			<tr>
				<td class="tblSingleLabel">Student Name *</td>
				<td class="tblSingleInput">
					<input type="text" class="txtlong_popup" name="stu_name" value="<%=resultSet.getString("student_name") %>"/>
				</td>
			</tr>
			<tr>
				<td class="tblSingleLabel">Class Name *</td>
				<td class="tblSingleInput">
					<input type="text" class="txtlong_popup" name="stu_cname" value="<%=resultSet.getString("class_name") %>"/>                           
				</td>                  
			</tr>
			<tr>
				<td class="tblSingleLabel">Registered Date	 *</td>
				<td class="tblSingleInput">
<input type="text" class="txtlong_popup" name="stu_date" value="<%=resultSet.getString("register_date") %>"/>                    	
				</td> 
			</tr>
			<tr>
				<td class="tblSingleLabel">Status *</td>
				<td class="tblSingleInput">
<input type="text" class="txtlong_popup" name="stu_status" value="<%=resultSet.getString("status") %>"/>                            
				</td>
			</tr>
		</table>
<br/>
		<div id="btnGroup">
                    
<input type="submit" value="Update" class="button" formaction="StudentUpdateProcess.jsp" formmethod="post" onClick="javascript:update()"/>
                    
<input type="submit" value="Delete" id="delete" class="button" formaction="DeleteStudentServlet" onClick="javascript:deleteBudget()" />
                        
<input type="button" value="Back" class="button" formaction="Student_Search.jsp" onClick="window.location.replace('Student_Search.jsp?flag=2')"/>        
						</div>
                    </form>
                </div> 
            </div>
        </div>    
     </div>

    <div class="footer"> 
            <span>Copyright &#169; ACE Inspiration 2016</span>        
    </div>
<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</body>
</html>