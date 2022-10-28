package Student_Project.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/StudentSearchServlet")
public class StudentSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public StudentSearchServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	@SuppressWarnings({ "unchecked", "rawtypes", "deprecation" })
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
        @SuppressWarnings("unused")
		PrintWriter out = response.getWriter();
        Connection conn = null;
        String url = "jdbc:mysql://localhost:3306/";
        String dbName = "testdb";
        String driver = "com.mysql.jdbc.Driver";
        String userName = "ppt";
        String password = "ppt@2004";
        Statement st=null;
        try {
            Class.forName(driver).newInstance();
            conn = DriverManager.getConnection(url + dbName, userName, password);
            System.out.println("connected!.....");
            String id = request.getParameter("id");
            String name=request.getParameter("name");
            String cname=request.getParameter("cname");
            ArrayList al = null;
            ArrayList pid_list = new ArrayList();
            String query = "select * from student";
            if(id!=null && !id.equals("") && name.equals("") && cname.equals("")){
                query = "select * from student where student_id='" + id + "' ";
            }else if(name!=null && !name.equals("") && id.equals("") && cname.equals("")){
            	query = "select * from student where student_name='" + name + "' ";
            }else if(cname!=null && !cname.equals("") && id.equals("") && name.equals("")){
            	query = "select * from student where class_name='" + cname + "' ";
            }else if(id!=null && !id.equals("") && name!=null && !name.equals("") && cname!=null && !cname.equals("")) {
            	query = "select * from student where student_id='" + id + "' ";
            }
            System.out.println("query " + query);
            st = conn.createStatement();
            ResultSet rs = st.executeQuery(query);

            while (rs.next()) {
                al = new ArrayList();

                al.add(rs.getString(1));
                al.add(rs.getString(2));
                al.add(rs.getString(3));
                al.add(rs.getString(4));
                al.add(rs.getString(5));
                System.out.println("al :: " + al);
                pid_list.add(al);
            }

            request.setAttribute("piList", pid_list);
            RequestDispatcher view = request.getRequestDispatcher("StudentSearchResult.jsp");
            view.forward(request, response);
            conn.close();
            System.out.println("Disconnected!");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public String getServletInfo() {
        return "getting records from database through servlet controller";
    }// </editor-fold>
	}


