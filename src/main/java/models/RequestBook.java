package models;

import java.util.Date;

public class RequestBook {
private int id;
private Book book;
private Student student;
private Date requestDate;
public Date getRequestDate() {
	return requestDate;
}
public void setRequestDate(Date requestDate) {
	this.requestDate = requestDate;
}
private int status;
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public Book getBook() {
	return book;
}
public void setBook(Book book) {
	this.book = book;
}
public Student getStudent() {
	return student;
}
public void setStudent(Student student) {
	this.student = student;
}
public int getStatus() {
	return status;
}
public void setStatus(int status) {
	this.status = status;
}

}
