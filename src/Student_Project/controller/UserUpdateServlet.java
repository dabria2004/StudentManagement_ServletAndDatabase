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
import Student_Project.persistance.dto.UserResponseDTO;

@WebServlet("/UserUpdateServlet")
public class UserUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UserUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    String id = request.getParameter("uid");
	    UserDAO dao = new UserDAO();
	    UserResponseDTO dto = dao.selectOneById(id);
	    request.setAttribute("user", dto);
	    request.getRequestDispatcher("update.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		//String id = request.getParameter("uid");
		UserBean ub=new UserBean();
        ub.setRid(request.getParameter("id"));
        ub.setRname(request.getParameter("name"));
        ub.setRpassword(request.getParameter("password"));
        if(ub.getRid().isBlank() || ub.getRname().isBlank() || ub.getRpassword().isBlank()) {
            request.setAttribute("error","You must fullfill the fields");
            request.setAttribute("user", ub);
            request.getRequestDispatcher("update.jsp").forward(request, response);
        }else {
            UserDAO dao=new UserDAO();
            UserRequesDTO dto=new UserRequesDTO();
            dto.setRid(ub.getRid());
            dto.setRname(ub.getRname());
            dto.setRpassword(ub.getRpassword());
            int i=dao.updateData(dto);
            if(i>0) {
                request.setAttribute("upsuccess","Successfully Registered!!");
                request.setAttribute("user", ub);
                request.getRequestDispatcher("update.jsp").forward(request, response);
            }else {
                request.setAttribute("upfail","Update Fail!!");
                request.setAttribute("user", ub);
                request.getRequestDispatcher("update.jsp").forward(request, response);
            }
        }
	}

}
