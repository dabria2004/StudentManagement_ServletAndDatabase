package Student_Project.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Student_Project.persistance.dao.UserDAO;
import Student_Project.persistance.dto.UserRequesDTO;

@WebServlet("/DeleteUserServlet")
public class DeleteUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DeleteUserServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uid = request.getParameter("uid");
		
		UserRequesDTO dto=new UserRequesDTO();
		dto.setRid(uid);	
		UserDAO dao=new UserDAO();
		int i=dao.deleteData(dto);
		if(i>0) {
			request.getRequestDispatcher("DisplayUser.jsp").forward(request, response);
			System.out.println("It's in.");
		}
		else {
			request.setAttribute("error","Delete Fail!");
			request.getRequestDispatcher("view.jsp").forward(request, response);
		}	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
