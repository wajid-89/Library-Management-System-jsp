package dao;

import java.util.List;

import models.Book;

public interface BookDao {
	public Integer addBook(Book book);
	public Integer updateBook(Book book);
	public Integer deleteBook(Integer id);
	public Integer getIdByName(String name);
	public Book getBookById(Integer id);
	public List<Book> getAllBook();
	public Integer updateBookCopies();
}
