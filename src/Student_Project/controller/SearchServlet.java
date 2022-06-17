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

@WebServlet("/SearchServlet")
public class SearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SearchServlet() {
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
	        String userName = "root";
	        String password = "root";
	        Statement st=null;
	        try {
	            Class.forName(driver).newInstance();
	            conn = DriverManager.getConnection(url + dbName, userName, password);
	            System.out.println("connected!.....");
	            String uid = request.getParameter("uid");
	            String uname=request.getParameter("uname");
	            ArrayList al = null;
	            ArrayList pid_list = new ArrayList();
	            String query = "select * from user";
	            if(uid!=null && !uid.equals("") && uname.equals("")){
	                query = "select * from user where user_id='" + uid + "' ";
	            }else if(uname!=null && !uname.equals("") && uid.equals("")){
	            	query = "select * from user where user_name='" + uname + "' ";
	            }else if(uid!=null && !uid.equals("") && uname!=null && !uname.equals("")) {
	            	query = "select * from user where user_id='" + uid + "' ";
	            }
	            System.out.println("query " + query);
	            st = conn.createStatement();
	            ResultSet rs = st.executeQuery(query);

	            while (rs.next()) {
	                al = new ArrayList();

	                al.add(rs.getString(1));
	                al.add(rs.getString(2));
	                al.add(rs.getString(3));
	                System.out.println("al :: " + al);
	                pid_list.add(al);
	            }

	            request.setAttribute("piList", pid_list);
	            RequestDispatcher view = request.getRequestDispatcher("view.jsp");
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
	
