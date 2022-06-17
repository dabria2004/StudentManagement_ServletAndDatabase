<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="Student_Project.persistance.dto.StudentResponseDTO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>(BUD002)Student Register</title>
<link rel="stylesheet" type="text/css" href="container.css" />
<link rel="stylesheet" type="text/css" href="base.css" />
<script type="text/javascript" src="javascript/general.js" ></script>
<script type="text/javascript" src="javascript/accordion-menu.js" ></script>
<script type="text/javascript">
    window.onload=function()
    {
        menu();
    }

	function myRegister() {
        confirm("Welcome for Registration!");
	}
	
	function myUpdate(){
	   confirm("Welcome for Update!");
	}
	
	function showMessage(){     
        var message = confirm("Are you sure to register?");
        if(message)                 
        document.getElementById('message').innerHTML = "Registration completed.";    
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
	
 	<div id="accordian" style="visibility: visible;">
	<ul>
		<li class="top has-sub">
	<div>
		<div class="caret active"></div>
			"Class Management"
	</div>
		<ul id="sec" style="transition: all 150ms ease 0s; display: block; padding-top: 0px; margin-bottom: 0px;
				margin-top:0px; height: auto;">
			<li><a href="Class.jsp">Class Registration</a></li>
			<li><a href="SearchStudentInfoServlet">Student Search</a></li>
			<li><a href="ClassNameServlet">Student Registration</a></li>
		</ul>
		</li>
		<li id="no-child" class="top">
			<a href="User_Search.jsp" style="font-weight:bold;">User Management</a>
		</li>
	</ul>
	</div>	
	</div>
	<div id="main_contents">     
	<div id="contents">
	<div class="search_form">
	<h3>Student Register</h3>
	<label id="errormsg" > Message </label><br/><br/><br/>
	<div style="color:red;"> ${error}</div>
	<div style="color:blue;"> ${success}</div>
		<form action="StudentRegisterServlet" method="post">
			<table class="tableForm">
				<tr>
					<td class="tblSingleLabel">Student No *</td>
					<td class="tblSingleInput">
						<input type="text" class="txtlong" name="sno"/>
					</td>
				</tr>
				<tr>
					<td class="tblSingleLabel">Student Name *</td>
					<td class="tblSingleInput">
						<input type="text" class="txtlong" name="sname"/>
				</tr>
				<tr>
					<td class="tblSingleLabel">Class Name *</td>
					<td class="tblSingleInput">  
						<select id="expenseType" class="normal_sel" name="classname">
							<option value="${stuInfo.sclass}">${stuInfo.sclass}</option>
							<c:forEach var="list" items="${sessionScope.classlist}">
								<option value="${list.classname }">${list.classname}</option>
							</c:forEach>
						</select>
					</td>                  
				</tr>
				<tr>
							<td class="tblSingleLabel">Registered Date *</td>
							<td class="tblSingleInput"><select id="expenseType" required
								name="year" class="short_sel">
									<option selected disabled>Year</option>
									<option value="2016">2016</option>
									<option value="2015">2015</option>
									<option value="2014">2014</option>
									<option value="2013">2013</option>
									<option value="2012">2012</option>
									<option value="2011">2011</option>
									<option value="2010">2010</option>
									<option value="2009">2009</option>
							</select> <select id="expenseType" class="short_sel" required name="month">
									<option>Month</option>
									<option>01</option>
									<option>02</option>
									<option>03</option>
									<option>04</option>
									<option>05</option>
									<option>06</option>
									<option>07</option>
									<option>08</option>
									<option>09</option>
									<option>10</option>
									<option>11</option>
									<option>12</option>
							</select> <select id="expenseType" class="short_sel" name="day" required>
									<option selected disabled>Day</option>
									<option>01</option>
									<option>02</option>
									<option>03</option>
									<option>04</option>
									<option>05</option>
									<option>06</option>
									<option>07</option>
									<option>08</option>
									<option>09</option>
									<option>10</option>
									<option>11</option>
									<option>12</option>
									<option>13</option>
									<option>14</option>
									<option>15</option>
									<option>16</option>
									<option>17</option>
									<option>18</option>
									<option>19</option>
									<option>20</option>
									<option>21</option>
									<option>22</option>
									<option>23</option>
									<option>24</option>
									<option>25</option>
									<option>26</option>
									<option>27</option>
									<option>28</option>
									<option>29</option>
									<option>30</option>
									<option>31</option>
							</select></td>
						<tr>
							<td class="tblSingleLabel">Status *</td>
							<td class="tblSingleInput"><select id="expenseType"
								name="status" required class="normal_sel">
									<option value="${stuInfo.status}">${stuInfo.status}</option>
									<option value="Attending">Attending</option>
									<option value="passed">Passed</option>
									<option value="failed">Failed</option>
							</select></td>
						</tr>
		</table>
<br/>
	<div id="btnGroup">
		<input type="submit" value="Register" class="button" onclick="javascript:showMessage()"/>
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