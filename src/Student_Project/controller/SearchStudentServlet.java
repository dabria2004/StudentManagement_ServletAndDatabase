package Student_Project.controller;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Student_Project.persistance.dao.StudentDAO;
import Student_Project.persistance.dto.StudentResponseDTO;

@WebServlet("/SearchStudentServlet")
public class SearchStudentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SearchStudentServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("studentId");
		String name = request.getParameter("studentName");
		String class_name = request.getParameter("className");

		StudentDAO dao = new StudentDAO();
		ArrayList<StudentResponseDTO> list = null;

		if (id.isEmpty() && name.isEmpty()) {
			list = dao.selectOneByClass(class_name);
		} else if (id.isEmpty() && class_name.isEmpty()) {
			list = dao.selectOneByName(name);
		} else if (name.isEmpty() && class_name.isEmpty()) {
			list = dao.selectOneById(id);
		} else {
			list = dao.selectOneById(id);
			if (list.size() == 0) {
				list = dao.selectOneByName(name);
			}
		}

		request.setAttribute("studentList", list);
		request.getRequestDispatcher("StudentSearch.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
