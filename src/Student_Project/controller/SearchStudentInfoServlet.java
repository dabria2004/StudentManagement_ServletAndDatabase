package Student_Project.controller;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Student_Project.persistance.dao.ClassDAO;
import Student_Project.persistance.dao.StudentDAO;
import Student_Project.persistance.dto.ClassResponseDTO;
import Student_Project.persistance.dto.StudentResponseDTO;

@WebServlet("/SearchStudentInfoServlet")
public class SearchStudentInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SearchStudentInfoServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		StudentDAO dao = new StudentDAO();
		ArrayList<StudentResponseDTO> allStuInfo = dao.selectAll();
		
		ClassDAO daoC = new ClassDAO();
		ArrayList<ClassResponseDTO> list = daoC.selectAll();
		
		request.getSession().setAttribute("classList", list);
		request.getSession().setAttribute("stuList", allStuInfo);
		request.getRequestDispatcher("StudentSearchForm.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
