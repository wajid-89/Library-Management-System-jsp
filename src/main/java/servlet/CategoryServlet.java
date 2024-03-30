package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import dao.CategoryDao;
import daoimpl.CategoryDaoImpl;
import models.Category;
import models.User;

/**
 * Servlet implementation class CategoryServlet
 */
@WebServlet("/CategoryServlet")
public class CategoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	CategoryDao categoryDaoImpl = new CategoryDaoImpl();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CategoryServlet() {
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
		String category = null;
		Integer result = null;

		String action = request.getParameter("action");

		switch (action) {
		case "add":
			category = request.getParameter("category");
			Category c = new Category();
			c.setCategory(category);
			c.setCreatedBy(user.getRole());
			result = categoryDaoImpl.addCategory(c);
			if (result > 0) {
				response.sendRedirect("view_category.jsp");
			}

			break;

		case "update":
			Integer id = Integer.parseInt(request.getParameter("id"));
			category = request.getParameter("category");
			c = categoryDaoImpl.getCategoryById(id);
			c.setCategory(category);
			c.setUpdatedBy(user.getRole());
			result = categoryDaoImpl.updateCategory(c);
			if (result > 0) {
				response.sendRedirect("view_category.jsp");
			}

			break;

		case "delete":
			Integer id1 = Integer.parseInt(request.getParameter("id"));
			result = categoryDaoImpl.deleteCategory(id1);
			if (result > 0) {
				response.sendRedirect("view_category.jsp");
			}

			break;

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

}
