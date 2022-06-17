<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%! String driverName = "com.mysql.jdbc.Driver";%>
<%!String url = "jdbc:mysql://localhost:3306/testdb";%>
<%!String user = "root";%>
<%!String psw = "root";%>
<%
String id = request.getParameter("stu_id");
String name=request.getParameter("stu_name");
String cname=request.getParameter("stu_cname");
String date=request.getParameter("stu_date");
String status=request.getParameter("stu_status");
if(id != null)
{
Connection con = null;
PreparedStatement ps = null;

try
{
Class.forName(driverName);
con = DriverManager.getConnection(url,user,psw);
String sql="update student set student_id=?,student_name=?,class_name=?,register_date=?,status=? where student_id='" + id + "' ";
ps = con.prepareStatement(sql);
ps.setString(1,id);
ps.setString(2,name);
ps.setString(3,cname);
ps.setString(4,date);
ps.setString(5,status);
int i = ps.executeUpdate();
if(i > 0)
{
	request.setAttribute("upsuccess", "Record Updated Successfully");
	request.getRequestDispatcher("Student_Search.jsp").forward(request, response);
}
else
{
	request.setAttribute("upfail", "There is a problem in updating Record");
	request.getRequestDispatcher("SelectStudent.jsp").forward(request, response);
} 
}
catch(SQLException sql)
{
request.setAttribute("error", sql);
out.println(sql);
}
}
%>