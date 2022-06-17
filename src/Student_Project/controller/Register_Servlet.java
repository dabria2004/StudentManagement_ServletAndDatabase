package Student_Project.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Student_Project.model.UserBean;
import Student_Project.persistance.dao.UserDAO;
import Student_Project.persistance.dto.UserRequesDTO;

@WebServlet("/Register_Servlet")
public class Register_Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Register_Servlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserBean ub=new UserBean();
		ub.setRid(request.getParameter("rid"));
		ub.setRname(request.getParameter("rname"));
		ub.setRpassword(request.getParameter("rpassword"));
		if(ub.getRid().equals("") || ub.getRname().equals("") || ub.getRpassword().equals("")) {
			request.setAttribute("error","You must fullfill the fields");
			request.setAttribute("ub", ub);
			request.getRequestDispatcher("User_Register.jsp").forward(request, response);
		}else {
			UserDAO dao=new UserDAO();
			UserRequesDTO dto=new UserRequesDTO();
			dto.setRid(ub.getRid());
			dto.setRname(ub.getRname());
			dto.setRpassword(ub.getRpassword());
			int i=dao.insertData(dto);
			if(i>0) {
				request.setAttribute("success","Successfully Registered!!");
				request.setAttribute("ub", ub);
				request.getRequestDispatcher("User_Register.jsp").forward(request, response);
			}else {
				request.setAttribute("error","Register Fail!!");
				request.setAttribute("ub", ub);
				request.getRequestDispatcher("User_Register.jsp").forward(request, response);
			}
		}
	}

}
