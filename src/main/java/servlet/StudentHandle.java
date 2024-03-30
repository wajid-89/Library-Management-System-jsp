package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.BookDao;

import dao.StudentDao;
import daoimpl.BookDaoImpl;

import daoimpl.StudentDaoImpl;

import models.Student;

/**
 * Servlet implementation class StudentHandle
 */
@WebServlet("/StudentHandle")
public class StudentHandle extends HttpServlet {
	private static final long serialVersionUID = 1L;
	StudentDao studentDaoImpl=new StudentDaoImpl();
	BookDao bookDaoImpl=new BookDaoImpl();

       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StudentHandle() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String rollNo=request.getParameter("roll-no");
		String password= request.getParameter("password");
		String action=request.getParameter("action");
		System.out.println("Roll :"+rollNo);
		System.out.println("Password :"+password);
		System.out.println("Action :"+action);
		
		
		switch (action) {
		case "login":
			Integer id=studentDaoImpl.getStudentIdByRollNoandPass(rollNo, password);
			System.out.println("ID :"+id);
			if(id != null) {
				
				Student student=studentDaoImpl.getStudentById(id);
				HttpSession session=request.getSession();
				session.setAttribute("student",student);
				response.sendRedirect("student_dashboard.jsp");
			} else {
				response.getWriter().print("Email & Password incorrect");
			     }
		break;
		
		case "logout":
			HttpSession session = request.getSession();
			session.invalidate();
			response.sendRedirect("index.jsp");
			break;
		}
		
		
		
}


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
