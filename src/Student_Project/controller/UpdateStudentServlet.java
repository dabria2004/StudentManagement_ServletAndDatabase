package Student_Project.controller;

import java.io.IOException;
import java.time.LocalDate;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Student_Project.model.StudentBean;
import Student_Project.persistance.dao.StudentDAO;
import Student_Project.persistance.dto.StudentRequestDTO;
import Student_Project.persistance.dto.StudentResponseDTO;

@WebServlet("/UpdateStudentServlet")
public class UpdateStudentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UpdateStudentServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		StudentDAO dao = new StudentDAO();
		StudentResponseDTO dto = dao.selectById(id);
		String date = dto.getDate();
		dto.setYear(date.substring(0, 4));
		dto.setMonth(date.substring(5, 7));
		dto.setDay(date.substring(8));
		request.setAttribute("editStuInfo", dto);
		request.getRequestDispatcher("editStudent.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("studentid");
		String name = request.getParameter("studentname");
		String _class_ = request.getParameter("classname");
		String year = request.getParameter("year");
		String month = request.getParameter("month");
		String day = request.getParameter("day");
		String status = request.getParameter("status");

		StudentBean student = new StudentBean();
		student.setSno(id);
		student.setSname(name);
		student.setSclass(_class_);
		student.setStatus(status);

		StudentDAO dao = new StudentDAO();

		if (year == null || month == null || day == null) {
			request.setAttribute("editStuInfo", student);
			request.setAttribute("message", "<h3>Fill Register Date !!!</h3>");
			request.getRequestDispatcher("editStudent.jsp").forward(request, response);
		} else {
			int intYear = Integer.parseInt(year);
			int intMonth = Integer.parseInt(month);
			int intDay = Integer.parseInt(day);
			LocalDate date = LocalDate.of(intYear, intMonth, intDay);
			student.setDate(date);

			StudentRequestDTO dto = new StudentRequestDTO();
			dto.setSno(student.getSno());
			dto.setSname(student.getSname());
			dto.setSclass(student.getSclass());
			dto.setDate(student.getDate());
			dto.setStatus(student.getStatus());
			dao.updateData(dto);
			request.setAttribute("success", "<h3>Successfully Updated !!!</h3>");
			request.getRequestDispatcher("editStudent.jsp").forward(request, response);
//			response.sendRedirect("SearchStudentInfoServlet");
		}
	}

}
