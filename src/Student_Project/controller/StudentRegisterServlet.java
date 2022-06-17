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

@WebServlet("/StudentRegisterServlet")
public class StudentRegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public StudentRegisterServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		StudentBean sb=new StudentBean();
		sb.setSno(request.getParameter("sno"));
		sb.setSname(request.getParameter("sname"));
		sb.setSclass(request.getParameter("classname"));
		sb.setStatus(request.getParameter("status"));
		
		String year = request.getParameter("year");
		String month = request.getParameter("month");
		String day = request.getParameter("day");
		
		if(sb.getSno().equals("") || sb.getSname().equals("") || sb.getSclass().equals("") || year==null || month==null || day==null || sb.getStatus().equals("")) {
			request.setAttribute("error","You must fullfill the fields");
			request.setAttribute("stuInfo", sb);
			request.getRequestDispatcher("Student_Register.jsp").forward(request, response);
		}else {
			int intYear = Integer.parseInt(year);
			int intMonth = Integer.parseInt(month);
			int intDay = Integer.parseInt(day);
			LocalDate date = LocalDate.of(intYear, intMonth, intDay);
			sb.setDate(date);
			
			StudentDAO dao=new StudentDAO();
			StudentRequestDTO dto=new StudentRequestDTO();
			dto.setSno(sb.getSno());
			dto.setSname(sb.getSname());
			dto.setSclass(sb.getSclass());
			dto.setDate(sb.getDate());
			dto.setStatus(sb.getStatus());
			int i=dao.insertData(dto);
			if(i>0) {
				request.setAttribute("success","Successfully Registered!!");
//				request.setAttribute("stuInfo", sb);
				request.getRequestDispatcher("Student_Register.jsp").forward(request, response);
			}else {
				request.setAttribute("error","Register Fail!!");
//				request.setAttribute("stuInfo", sb);
				request.getRequestDispatcher("Student_Register.jsp").forward(request, response);
			}
		}
	}

}
