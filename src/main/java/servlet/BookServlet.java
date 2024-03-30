package servlet;

import java.io.IOException;

import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.BookDao;
import dao.CategoryDao;
import dao.IssueDao;
import dao.RoleDao;
import dao.StudentDao;
import daoimpl.BookDaoImpl;
import daoimpl.CategoryDaoImpl;
import daoimpl.IssueDaoImpl;
import daoimpl.RoleDaoImpl;
import daoimpl.StudentDaoImpl;
import models.Book;
import models.Category;
import models.Issue;
import models.Role;
import models.Student;
import models.User;

/**
 * Servlet implementation class BookServlet
 */
@WebServlet("/Book")
public class BookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	CategoryDao categoryDaoImpl = new CategoryDaoImpl();
	
	BookDao bookDaoImpl = new BookDaoImpl();
	
	RoleDao roleDaoImpl = new RoleDaoImpl();
	
	IssueDao issueDaoImpl=new  IssueDaoImpl();
	StudentDao studentDaoImpl=new StudentDaoImpl();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public BookServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		User u = (User) session.getAttribute("user");

		String title = request.getParameter("title");
		String author = request.getParameter("author");
		String categoryName = request.getParameter("category");
		
		
		
		

		Category category = categoryDaoImpl.getCategoryById(categoryDaoImpl.getIdByName(categoryName));

		String action = request.getParameter("action");

		System.out.print("Action: " + action);
		System.out.print("No of copies: " + request.getParameter("no-of-copies"));

		Book book = null;
		Integer id = null;
		Integer result = null;
		if (action.equals("add")) {


			Integer noOfCopies = Integer.parseInt(request.getParameter("no-of-copies"));
			book = new Book();
			book.setTitle(title);
			book.setBookCode(generateBookCode());
			book.setAuthor(author);
			book.setCategory(category);
			book.setNoOfCopies(noOfCopies);
			book.setCreatedBy(u.getRole());

			result = bookDaoImpl.addBook(book);
			if (result > 0) {
				response.sendRedirect("view_book.jsp");
			}
		}
			else if(action.equals("update")) {

				Integer	noOfCopies = Integer.parseInt(request.getParameter("no-of-copies"));
			id = Integer.parseInt(request.getParameter("id"));
			book = bookDaoImpl.getBookById(id);
			book.setTitle(title);
			book.setAuthor(author);
			book.setCategory(category);
			book.setNoOfCopies(noOfCopies);

			Role role = new Role();
			role.setId(u.getRole().getId());

			book.setUpdatedBy(role);

			result = bookDaoImpl.updateBook(book);
			System.out.print("Result : " + result);
			if (result > 0) {
				response.sendRedirect("view_book.jsp");
			}
			}
			
			else if(action.equals("delete")){
			id = Integer.parseInt(request.getParameter("id"));
			result = bookDaoImpl.deleteBook(id);

			if (result > 0) {
				response.sendRedirect("view_book.jsp");
			} else {
				response.getWriter().print("Error in deleting book!");
			}

		}
			else if(action.equals("issue")) {
				String[] selectedBooks=request.getParameterValues("selected");
				
				String rollNo=request.getParameter("rollNo");
				
				Integer studentId=studentDaoImpl.getIdByRollNo(rollNo);
				
				Student student=studentDaoImpl.getStudentById(studentId);
				
				for(int i=0; i<selectedBooks.length; i++) {
					Integer bookId=Integer.parseInt(selectedBooks[i]);
					System.out.println("SELECTED:"+selectedBooks[i]);
					Book book1=bookDaoImpl.getBookById(bookId);
					Role createdBy=roleDaoImpl.getRoleById(u.getRole().getId());
					
					Issue issue=new Issue();
					issue.setBook(book1);
					issue.setStudent(student);
					issue.setCreatedBy(createdBy);
					issue.setIssuedBy(u);
					
					result=issueDaoImpl.addIssue(issue);
					
				}
					if(result >0) {
					
						response.sendRedirect("view_issued_book.jsp");
					}
					
				}
			else if(action.equals("return")) {
				 id = Integer.parseInt(request.getParameter("id"));
				 Issue issue = issueDaoImpl.getIssueById(id);
					
					result = issueDaoImpl.returnBook(issue);
					
					if (result > 0) {
						response.sendRedirect("student_view_issue.jsp");
					}	
			}
			else if(action.equals("deleteIssue")) {
				id = Integer.parseInt(request.getParameter("id"));
			   result =issueDaoImpl.deleteIssue(id);
			   if (result > 0) {
					response.sendRedirect("view_issued_book.jsp");
				} else {
					response.getWriter().print("Error in deleting book!");
				}
			}
}
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

	static public String generateBookCode() {

		String Capital_chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
		String numbers = "0123456789";

		// Using random method
		Random rndm_method = new Random();

		String code = "";

		for (int i = 0; i < 6; i++) {
			// Use of charAt() method : to get character value
			// Use of nextInt() as it is scanning the value as int
			if (i == 2) {
				code += "-";
			}
			if (i == 0 || i == 1) {
				code += Capital_chars.charAt(rndm_method.nextInt(Capital_chars.length()));
			} else {
				code += numbers.charAt(rndm_method.nextInt(numbers.length()));
			}
		}
		return code;
	}

}
