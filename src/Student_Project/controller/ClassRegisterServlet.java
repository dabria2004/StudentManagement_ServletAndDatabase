package Student_Project.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Student_Project.model.ClassBean;
import Student_Project.persistance.dao.ClassDAO;
import Student_Project.persistance.dto.ClassRequestDTO;

@WebServlet("/ClassRegisterServlet")
public class ClassRegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ClassRegisterServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ClassBean cb=new ClassBean();
		cb.setClassid(request.getParameter("classid"));
		cb.setClassname(request.getParameter("classname"));
		
		if(cb.getClassid().equals("") || cb.getClassname().equals("")) {
			request.setAttribute("classInfo",cb);
			request.setAttribute("classerror", "Fields can't be blank");
			request.getRequestDispatcher("Class.jsp").forward(request, response);
		}else {
			ClassDAO dao=new ClassDAO();
			ClassRequestDTO dto=new ClassRequestDTO();
			dto.setClassid(cb.getClassid());
			dto.setClassname(cb.getClassname());
			int i=dao.insertData(dto);
			if(i>0) {
			request.setAttribute("success","Successfully Registered!!");
			request.setAttribute("classInfo",cb);
			request.getRequestDispatcher("Class.jsp").forward(request, response);
		}
			else {
				request.setAttribute("error","Insert Fail!");
				request.setAttribute("classInfo",cb);
				request.getRequestDispatcher("Class.jsp").forward(request, response);
			}
		}
	}

}
