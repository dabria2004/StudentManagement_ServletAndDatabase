<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="Student_Project.persistance.dto.StudentResponseDTO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>editStudentjsp</title>
<link rel="stylesheet" type="text/css" href="container.css" />
<link rel="stylesheet" type="text/css" href="base.css" />
<script type="text/javascript" src="javascript/general.js" ></script>
<script type="text/javascript" src="javascript/accordion-menu.js" ></script>
<script type="text/javascript">
	window.onload = function() {
		menu();
	}
</script>
</head>
<body class="main_body">
<div id="header">
		<div id="title">
			<a href="welcome.jsp">Student Registration Assignment</a>
		</div>
		<div id="menuLoginTime">
			<table>
				<tr>
					<td>User</td>
					<td>: ${sessionScope.userInfo.rid}
						${sessionScope.userInfo.rname}</td>
				</tr>
				<tr>
					<td>Login Date</td>
					<td>: ${sessionScope.date}</td>
				</tr>
			</table>
		</div>
		<a href="LogoutServlet"><input id="btn_logout" class="button"
			type="button" value="Logout"></a>
	</div>

	<div id="container">
		<div id="left_menu">
			<!-- menu html code exist the menu function of general.js -->
		</div>
		<div id="main_contents">
			<div id="contents">
				<h3>Student Register</h3>
				${message}
				<div style="color:blue;"> ${success}</div>
				<form name="registerForm" action="UpdateStudentServlet" method="post">
					<table class="tableForm">
						<tr>
							<td class="tblSingleLabel">Student No *</td>
							<td class="tblSingleInput">
			<input type="text" required readonly="readonly" class="txtlong" name="studentid" value="${editStuInfo.sno}" /></td>
						</tr>
						<tr>
							<td class="tblSingleLabel">Student Name *</td>
							<td class="tblSingleInput">
			<input type="text" required name="studentname" class="txtlong" value="${editStuInfo.sname}" />
						</tr>
						<tr>
							<td class="tblSingleLabel">Class Name *</td>
							<td class="tblSingleInput">
							<select id="expenseType" required name="classname" class="normal_sel">
									<option value="${editStuInfo.sclass}">${editStuInfo.sclass}</option>
									<c:forEach var="list" items="${sessionScope.classList}">
										<option value="${list.classname}">${list.classname}</option>
									</c:forEach>
							</select></td>
						</tr>
						<tr>
							<td class="tblSingleLabel">Registered Date *</td>
							<td class="tblSingleInput"><select id="expenseType" required
								name="year" class="short_sel">
									<option value="${editStuInfo.year}">${editStuInfo.year}</option>
									<option value="2016">2016</option>
									<option value="2015">2015</option>
									<option value="2014">2014</option>
									<option value="2013">2013</option>
									<option value="2012">2012</option>
									<option value="2011">2011</option>
									<option value="2010">2010</option>
									<option value="2009">2009</option>
							</select> <select id="expenseType" class="short_sel" required name="month">
									<option ${editStuInfo.month}>${editStuInfo.month}</option>
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
									<option ${editStuInfo.day}>${editStuInfo.day}</option>
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
									<option value="${editStuInfo.status}">${editStuInfo.status}</option>
									<option value="Attending">Attending</option>
									<option value="passed">Passed</option>
									<option value="failed">Failed</option>
							</select></td>
						</tr>


					</table>
					<br />
<div id="btnGroup">
	<input type="submit" value="Update" class="button" /> 
	<a href="DeleteStudentServlet?id=${editStuInfo.sno}"><input type="button" value="Delete" class="button" /></a> 
	<a href="StudentSearchServlet"><input type="button" value="Back" class="button" /></a>
</div>
				</form>
			</div>
		</div>
	</div>

	<div class="footer">
		<span>Copyright &#169; ACE Inspiration 2016</span>
	</div>
</body>
</html>