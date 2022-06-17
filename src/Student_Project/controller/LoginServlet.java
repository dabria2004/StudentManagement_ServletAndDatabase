package Student_Project.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Student_Project.model.UserBean;
import Student_Project.persistance.dao.UserDAO;
import Student_Project.persistance.dto.UserResponseDTO;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public LoginServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = request.getParameter("userid");
		String userPassword = request.getParameter("password");
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date = new Date(System.currentTimeMillis());
		String currentDate = formatter.format(date);
		UserDAO dao = new UserDAO();
		if (dao.check(userId, userPassword)) {
			UserResponseDTO dto = dao.selectOneById(userId);
			request.getSession().setAttribute("date", currentDate);
			request.getSession().setAttribute("userInfo", dto);
			request.getRequestDispatcher("Final_exam.jsp").forward(request, response);
		} else {
			UserBean ub = new UserBean();
			ub.setRid(userId);
			ub.setRpassword(userPassword);
			request.setAttribute("loginInfo", ub);
			request.setAttribute("error", "<h3>ID and Password do not match !!</h3>");
			request.getRequestDispatcher("Login.jsp").include(request, response);
		}
	}
}
