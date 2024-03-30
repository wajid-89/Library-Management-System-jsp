package daoimpl;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import dao.IssueDao;
import models.Book;
import models.Issue;

import models.Role;
import models.Student;
import models.User;
import util.Database;

public class IssueDaoImpl implements IssueDao {

	Connection conn = Database.getConnection();

	@Override
	public Integer addIssue(Issue issue) {
		Integer row = null;
		try {
			Date date = new Date(new java.util.Date().getTime());
			String add = "insert into issue(`book_id`,`student_id`,`issued_by`,`issue_date`,`created_by`,`create_date`,`status`) values(?,?,?,?,?,?,1)";
			PreparedStatement pst = conn.prepareStatement(add);
			pst.setInt(1, issue.getBook().getId());
			pst.setInt(2, issue.getStudent().getId());
			pst.setInt(3, issue.getIssuedBy().getId());

			pst.setDate(4, date);

			pst.setInt(5, issue.getCreatedBy().getId());
			pst.setDate(6, date);
			row = pst.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return row;
	}

	@Override
	public Integer updateIssue(Issue issue) {
		Integer row = null;
		try {
			java.sql.Date updateDate = new Date(new java.util.Date().getTime());
			String update = "update issue set `book_id`=?,`student_id`=?,`issued_by`=?,`updated_by`=?,`update_date`=? where `id`=?";
			PreparedStatement pst = conn.prepareStatement(update);
			pst.setInt(1, issue.getBook().getId());
			pst.setInt(2, issue.getStudent().getId());
			pst.setInt(3, issue.getIssuedBy().getId());
			pst.setInt(4, issue.getUpdatedBy().getId());
			pst.setDate(5, updateDate);
			pst.setInt(6, issue.getId());
			row = pst.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return row;
	}

	@Override
	public Integer deleteIssue(Integer id) {
		Integer row = null;
		try {
			String delete = "delete from issue where id=?";
			PreparedStatement pst = conn.prepareStatement(delete);
			pst.setInt(1, id);
			row = pst.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return row;
	}

	@Override
	public Integer getIdByBookandStudent(Integer bookId, Integer studentID) {

		return null;
	}

	@Override
	public Issue getIssueById(Integer id) {
		Issue issue = null;
		ResultSet rs = null;
		try {

			PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM issue WHERE id=? and status>0");
			pstmt.setInt(1, id);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				issue = new Issue();
				issue.setId(rs.getInt("id"));

				Book book = new Book();
				book.setId(rs.getInt("book_id"));
				Student student = new Student();
				student.setId(rs.getInt("student_id"));
				User user = new User();
				user.setId(rs.getInt("issued_by"));

				Role r1 = new Role();
				r1.setId(rs.getInt("created_by"));
				Role r2 = new Role();
				r2.setId(rs.getInt("updated_by"));

				issue.setBook(book);
				issue.setStudent(student);
				issue.setIssuedBy(user);
				issue.setCreateDate(rs.getDate("create_date"));
				issue.setCreatedBy(r1);
				issue.setUpdateDate(rs.getDate("update_date"));
				issue.setUpdatedBy(r2);
				issue.setIssueDate(rs.getDate("issue_date"));
				issue.setReturnDate(rs.getDate("return_date"));

			}

		} catch (Exception ex) {
			System.out.println("ERROR: " + ex.getMessage());
			ex.printStackTrace();
		}
		return issue;
	}

	@Override
	public List<Issue> getAllIssue() {
		List<Issue> allIssuedBooks = new ArrayList<Issue>();
		try {

			String getAll = "select * from issue where status >0";
			PreparedStatement pst = conn.prepareStatement(getAll);
			ResultSet rst = pst.executeQuery();
			while (rst.next()) {
				Book book = new Book();
				book.setId(rst.getInt("book_id"));

				Student student = new Student();
				student.setId(rst.getInt("student_id"));

				Role role1 = new Role();
				role1.setId(rst.getInt("created_by"));

				Role role2 = new Role();
				role2.setId(rst.getInt("updated_by"));

				User user = new User();
				user.setId(rst.getInt("issued_by"));

				Issue issue = new Issue();
				issue.setId(rst.getInt("id"));
				issue.setBook(book);
				issue.setStudent(student);
				issue.setIssueDate(rst.getDate("issue_date"));
				issue.setIssuedBy(user);
				issue.setCreatedBy(role1);
				issue.setCreateDate(rst.getDate("create_date"));
				issue.setUpdatedBy(role2);
				issue.setUpdateDate(rst.getDate("update_date"));
				allIssuedBooks.add(issue);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return allIssuedBooks;
	}

	@Override
	public Integer returnBook(Issue issue) {
		Integer row = null;
		try {

			PreparedStatement pstmt = conn.prepareStatement("UPDATE issue SET return_date=?, status=0 WHERE id=?");
			java.sql.Date updateDate = new Date(new java.util.Date().getTime());
			pstmt.setDate(1, updateDate);
			pstmt.setInt(2, issue.getId());

			row = pstmt.executeUpdate();

		} catch (Exception ex) {
			System.out.println("ERROR: " + ex.getMessage());
			ex.printStackTrace();
		}
		return row;
	}

	@Override
	public List<Issue> getAllRequestsByStudentId(Integer id) {
		List<Issue> list = new ArrayList<Issue>();
		ResultSet rs = null;
		try {
			String getIssue = "select * from `issue` where student_id=? and status >0";
			PreparedStatement pst = conn.prepareStatement(getIssue);
			pst.setInt(1, id);

			rs = pst.executeQuery();
			while (rs.next()) {
				Issue book = new Issue();
				book.setId(rs.getInt("id"));
				Student student = new Student();
				student.setId(rs.getInt("student_id"));
				book.setStudent(student);

				Book book1 = new Book();
				book1.setId(rs.getInt("book_id"));

				User user = new User();
				user.setId(rs.getInt("issued_by"));
				book.setIssuedBy(user);
				book.setBook(book1);
				book.setIssueDate(rs.getDate("issue_date"));
				book.setReturnDate(rs.getDate("return_date"));
				list.add(book);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public List<Issue> getAllReturnBookByStudent(int studentId) {
		List<Issue> list = new ArrayList<Issue>();
		ResultSet rs = null;
		try {
			String getIssue = "select * from `issue` where student_id=? and status =0";
			PreparedStatement pst = conn.prepareStatement(getIssue);
			pst.setInt(1, studentId);

			rs = pst.executeQuery();
			while (rs.next()) {
				Issue book = new Issue();
				book.setId(rs.getInt("id"));
				Student student = new Student();
				student.setId(rs.getInt("student_id"));
				book.setStudent(student);

				Book book1 = new Book();
				book1.setId(rs.getInt("book_id"));

				User user = new User();
				user.setId(rs.getInt("issued_by"));
				book.setIssuedBy(user);
				book.setBook(book1);
				book.setIssueDate(rs.getDate("issue_date"));
				book.setReturnDate(rs.getDate("return_date"));
				list.add(book);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

}
