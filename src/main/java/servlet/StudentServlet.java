package servlet;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.RoleDao;
import dao.StudentDao;
import daoimpl.RoleDaoImpl;
import daoimpl.StudentDaoImpl;
import models.Role;
import models.Student;
import models.User;

/**
 * Servlet implementation class StudentServlet
 */
@WebServlet("/StudentServlet")
public class StudentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	StudentDao studentDaoImpl = new StudentDaoImpl();
	RoleDao roleDaoImpl = new RoleDaoImpl();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public StudentServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");

		String rollNo = request.getParameter("rollNo");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String password=request.getParameter("password");
		String contact = request.getParameter("contact");
		String studentDOB = request.getParameter("date-of-birth");

		String action = request.getParameter("action");

		Date date = null;

		try {
			DateFormat dateFormat = new SimpleDateFormat("yyy-MM-dd");
			date = dateFormat.parse(studentDOB);

		} catch (Exception e) {
			e.printStackTrace();
		}

		Student student = null;
		Integer result;
		if (action.equals("add")) {
			student = new Student();
			student.setRollNo(rollNo);
			student.setName(name);
			student.setEmail(email);
			student.setPassword(password);
			student.setContact(contact);
			student.setDateOfBirth(date);
			Role createdBy = roleDaoImpl.getRoleById(user.getRole().getId());
			student.setCreatedBy(createdBy);
			result = studentDaoImpl.addStudent(student);
			if (result > 0) {
				response.sendRedirect("view_student.jsp");
			}
		}

		else if (action.equals("update")) {
			Integer id = Integer.parseInt(request.getParameter("id"));
			
			student = studentDaoImpl.getStudentById(id);
			
			student.setRollNo(rollNo);
			student.setName(name);
			student.setEmail(email);
			student.setPassword(password);
			student.setContact(contact);
			student.setDateOfBirth(date);
			
			Role updatedBy = roleDaoImpl.getRoleById(user.getId());
			
			student.setUpdatedBy(updatedBy);
			
			result = studentDaoImpl.updateStudent(student);
			if (result > 0) {
				response.sendRedirect("view_student.jsp");
			}

		}
		else if(action.equals("delete")) {
		Integer id = Integer.parseInt(request.getParameter("id"));
		
	    result=studentDaoImpl.deleteStudent(id);
		if(result >0) {
			response.sendRedirect("view_student.jsp");
		             }else {
			response.getWriter().print("<center><h1>ERROR</h1></center>");}
		}

	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
