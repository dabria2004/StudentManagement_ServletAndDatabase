<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%! String driverName = "com.mysql.jdbc.Driver";%>
<%!String url = "jdbc:mysql://localhost:3306/testdb";%>
<%!String user = "root";%>
<%!String psw = "root";%>
<%
String id = request.getParameter("ur_id");
String name=request.getParameter("ur_name");
String password=request.getParameter("ur_pw");
if(id != null)
{
Connection con = null;
PreparedStatement ps = null;

try
{
Class.forName(driverName);
con = DriverManager.getConnection(url,user,psw);
String sql="update user set user_id=?,user_name=?,user_password=? where user_id='" + id + "' ";
ps = con.prepareStatement(sql);
ps.setString(1,id);
ps.setString(2,name);
ps.setString(3,password);

int i = ps.executeUpdate();
if(i > 0)
{
	request.setAttribute("upsuccess", "Record Updated Successfully");
	request.getRequestDispatcher("view.jsp").forward(request, response);
}
else
{
	request.setAttribute("upfail", "There is a problem in updating Record");
	request.getRequestDispatcher("view.jsp").forward(request, response);
} 
}
catch(SQLException sql)
{
request.setAttribute("error", sql);
out.println(sql);
}
}
%>