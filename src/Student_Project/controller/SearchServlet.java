package Student_Project.controller;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Student_Project.persistance.dao.UserDAO;
import Student_Project.persistance.dto.UserResponseDTO;

@WebServlet("/SearchServlet")
public class SearchServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
       
    public SearchServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.getWriter().append("Served at: ").append(request.getContextPath());
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
         response.setContentType("text/html");
           
                String uid = request.getParameter("uid");
                String uname=request.getParameter("uname");
                UserDAO dao = new UserDAO();
                ArrayList<UserResponseDTO> userList = new ArrayList<>();
                
                if(uid.isBlank() || uname.isBlank()) {
                    userList = dao.selectUserByIdOrName(uid, uname);
                }else {
                    userList = dao.selectAll();
                }
                request.setAttribute("userList", userList);
                request.getRequestDispatcher("view.jsp").forward(request, response);
                
        }

        @Override
        public String getServletInfo() {
            return "getting records from database through servlet controller";
        }// </editor-fold>
    }
    