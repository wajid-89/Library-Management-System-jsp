package daoimpl;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import dao.StudentDao;
import models.Role;
import models.Student;
import util.Database;

public class StudentDaoImpl implements StudentDao {
	Connection conn = Database.getConnection();

	@Override
	public Integer addStudent(Student student) {
		Integer row = null;
        try {
            
            java.sql.Date createdDate = new Date(new java.util.Date().getTime());
            
            PreparedStatement pstmt = conn.prepareStatement("INSERT INTO student(`roll-no`,`name`,dateofbirth,contact,email,password,create_date,created_by,`status`) VALUES(?,?,?,?,?,?,?,?,1)");
            pstmt.setString(1, student.getRollNo());
            pstmt.setString(2, student.getName());
            pstmt.setDate(3, new Date(student.getDateOfBirth().getTime()));
            pstmt.setString(4, student.getContact());
            pstmt.setString(5, student.getEmail());
            pstmt.setString(6,student.getPassword());
            pstmt.setDate(7, createdDate);
            pstmt.setInt(8, student.getCreatedBy().getId());
           
                        
            row = pstmt.executeUpdate();
            
        } catch (Exception ex) {
            System.out.println("ERROR: "+ex.getMessage());
            ex.printStackTrace();
        }
        return row;
	}

	@Override
	public Integer updateStudent(Student student) {
		
		Integer row = null;
        try {
            
            java.sql.Date createdDate = new Date(new java.util.Date().getTime());
            
            PreparedStatement pstmt = conn.prepareStatement("UPDATE student SET `roll-no`=?,`name`=?,dateofbirth=?,contact=?,email=?,password=?,update_date=?,updated_by=? WHERE id=?");
            pstmt.setString(1, student.getRollNo());
            pstmt.setString(2, student.getName());
            pstmt.setDate(3, new Date(student.getDateOfBirth().getTime()));
            pstmt.setString(4, student.getContact());
            pstmt.setString(5, student.getEmail());
            pstmt.setString(6, student.getPassword());
            pstmt.setDate(7, createdDate);
           pstmt.setInt(8, student.getUpdatedBy().getId());
           pstmt.setInt(9, student.getId());
           
                        
            row = pstmt.executeUpdate();
            
        } catch (Exception ex) {
            System.out.println("ERROR: "+ex.getMessage());
            ex.printStackTrace();
        }
        return row;
	}

	@Override
	public Integer deleteStudent(Integer id) {
		Integer row = null;
        try {
        	
            PreparedStatement pstmt = conn.prepareStatement("UPDATE student SET `status`=0 WHERE id=?");
            pstmt.setInt(1, id);
           
                        
            row = pstmt.executeUpdate();
            
        } catch (Exception ex) {
            System.out.println("ERROR: "+ex.getMessage());
            ex.printStackTrace();
        }
        return row;
	}

	@Override
	public Integer getIdByName(Integer id) {
		Integer sid = null;
		ResultSet rs = null;
        try {
        	
            PreparedStatement pstmt = conn.prepareStatement("SELECT id FROM student WHERE `name`=? and `status`=1");
            pstmt.setInt(1, id);
           
                        
            rs = pstmt.executeQuery();
            
            if (rs.next()) {
				sid = rs.getInt("id");
			}
            
        } catch (Exception ex) {
            System.out.println("ERROR: "+ex.getMessage());
            ex.printStackTrace();
        }
        return sid;
	}

	@Override
	public Student getStudentById(Integer id) {
		Student student = null;
		ResultSet rs = null;
        try {
        	
            PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM student WHERE id=? and `status`=1");
            pstmt.setInt(1, id);
           
                        
            rs = pstmt.executeQuery();
            
            if (rs.next()) {
				student = new Student();
				student.setId(rs.getInt("id"));
				student.setRollNo(rs.getString("roll-no"));
				student.setName(rs.getString("name"));
				student.setDateOfBirth(rs.getDate("dateofbirth"));
				student.setContact(rs.getString("contact"));
				student.setEmail(rs.getString("email"));
				student.setPassword(rs.getString("password"));
				student.setCreateDate(rs.getDate("create_date"));
				student.setUpdateDate(rs.getDate("update_date"));
				
				Role r1 = new Role();
				r1.setId(rs.getInt("created_by"));
				Role r2 = new Role();
				r1.setId(rs.getInt("updated_by"));
				
				student.setCreatedBy(r1);
				student.setUpdatedBy(r2);
			}
            
        } catch (Exception ex) {
            System.out.println("ERROR: "+ex.getMessage());
            ex.printStackTrace();
        }
        return student;
	}

	@Override
	public List<Student> getAllStudent() {
		List<Student> allStudent = new ArrayList<Student>();
		ResultSet rs = null;
        try {
        	
            PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM student WHERE `status`=1");
           
                        
            rs = pstmt.executeQuery();
            
            while (rs.next()) {
				Student student = new Student();
				Role r1 = new Role();
				Role r2 = new Role();
				
				student.setId(rs.getInt("id"));
				student.setRollNo(rs.getString("roll-no"));
				student.setName(rs.getString("name"));
				student.setDateOfBirth(rs.getDate("dateofbirth"));
				student.setContact(rs.getString("contact"));
				student.setEmail(rs.getString("email"));
				student.setPassword(rs.getString("password"));
				student.setCreateDate(rs.getDate("create_date"));
				student.setUpdateDate(rs.getDate("update_date"));
				
				
				
				Integer r1Id = rs.getInt("created_by");
				
				System.out.println("Created By id from database: "+r1Id);
				
				r1.setId(r1Id);
				
				r1.setId(rs.getInt("updated_by"));
				
				student.setCreatedBy(r1);
				student.setUpdatedBy(r2);
				
				allStudent.add(student);
			}
            
        } catch (Exception ex) {
            System.out.println("ERROR: "+ex.getMessage());
            ex.printStackTrace();
        }
        return allStudent;
	}

	@Override
	public Integer getIdByRollNo(String rollNo) {
		Integer sid = null;
		ResultSet rs = null;
        try {
        	
            PreparedStatement pstmt = conn.prepareStatement("SELECT id FROM student WHERE `roll-no`=? and `status`=1");
            pstmt.setString(1, rollNo);
           
                        
            rs = pstmt.executeQuery();
            
            if (rs.next()) {
				sid = rs.getInt("id");
			}
            
        } catch (Exception ex) {
            System.out.println("ERROR: "+ex.getMessage());
            ex.printStackTrace();
        }
        return sid;
	}

	@Override
	public Integer getStudentIdByRollNoandPass(String rollNo, String pass) {
		Integer id = null;
		ResultSet rs = null;
        try {
            
            
            PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM student where `roll-no`=? and `password`=? and status > 0");
            pstmt.setString(1, rollNo);
            pstmt.setString(2, pass);
            
            rs = pstmt.executeQuery();
            
            if (rs.next()) {
            	
            	
            	id = rs.getInt("id");
				
				
			}
            
        } catch (Exception ex) {
            System.out.println("ERROR: "+ex.getMessage());
            ex.printStackTrace();
        }
        return id;
		
	}

	

}
