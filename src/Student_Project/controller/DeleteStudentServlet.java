package Student_Project.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Student_Project.persistance.dao.StudentDAO;

@WebServlet("/DeleteStudentServlet")
public class DeleteStudentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DeleteStudentServlet() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id = request.getParameter("id");
		StudentDAO dao = new StudentDAO();
		dao.deleteData(id);
		response.sendRedirect("SearchStudentInfoServlet");
//		StudentRequestDTO dto=new StudentRequestDTO();
//		dto.setSno(id);	
//		StudentDAO dao=new StudentDAO();
//		int i=dao.deleteData(dto);
//		if(i>0) {
//			request.getRequestDispatcher("Student_Search.jsp").forward(request, response);
//			System.out.println("It's in.");
//		}
//		else {
//			
//			request.getRequestDispatcher("Student_Search.jsp").forward(request, response);
//		}	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
