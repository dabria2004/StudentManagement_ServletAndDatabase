package Student_Project.controller;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Student_Project.persistance.dao.ClassDAO;
import Student_Project.persistance.dto.ClassResponseDTO;

@WebServlet("/ClassNameServlet")
public class ClassNameServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ClassNameServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ClassDAO dao=new ClassDAO();
		ArrayList<ClassResponseDTO> list=dao.selectAll();
		request.getSession().setAttribute("classlist", list);
		request.getRequestDispatcher("Student_Register.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
