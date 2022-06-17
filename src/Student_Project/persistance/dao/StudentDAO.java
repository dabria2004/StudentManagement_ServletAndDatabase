package Student_Project.persistance.dao;
import java.sql.*;
import java.util.ArrayList;
import Student_Project.persistance.dto.StudentRequestDTO;
import Student_Project.persistance.dto.StudentResponseDTO;

public class StudentDAO {
	public static Connection con=null;
	static {
		con=MyConnection.getConnection();
		System.out.println("Got Connection...");
	}
	public int insertData(StudentRequestDTO dto) {
		int result=0;
		String sql="insert into student(student_id,student_name,class_name,register_date,status) values(?,?,?,?,?)";	
		try {
				PreparedStatement ps=con.prepareStatement(sql);
				ps.setString(1,dto.getSno());
				ps.setString(2, dto.getSname());
				ps.setString(3, dto.getSclass());
				ps.setString(4, dto.getDate());
				ps.setString(5, dto.getStatus());
				result=ps.executeUpdate();
		} catch (SQLException e) {
			System.out.println("Database error in inserthing");
		}
		return result;
	}
	
	public int updateData(StudentRequestDTO dto) {
		String sql = "update student set student_name=?, class_name=?, register_date=?, status=? where student_id=?";
		int i = 0;
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, dto.getSname());
			ps.setString(2, dto.getSclass());
			ps.setString(3, dto.getDate());
			ps.setString(4, dto.getStatus());
			ps.setString(5, dto.getSno());

			i = ps.executeUpdate();
		} catch (Exception e) {
			System.out.println("Database error in updating student data.");
		}
		return i;
	}
	
	public ArrayList<StudentResponseDTO> selectAll() {
		ArrayList<StudentResponseDTO> list = new ArrayList<>();
		String sql = "select * from student";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				StudentResponseDTO res = new StudentResponseDTO();
				res.setSno(rs.getString("student_id"));
				res.setSname(rs.getString("student_name"));
				res.setSclass(rs.getString("class_name"));
				res.setDate(rs.getDate("register_date").toLocalDate());
				res.setStatus(rs.getString("status"));
				list.add(res);
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return list;
	}
	
	public ArrayList<StudentResponseDTO> selectOneById(String id) {
		ArrayList<StudentResponseDTO> list = new ArrayList<>();
		String sql = "select * from student where student_id=?";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, id);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				StudentResponseDTO res = new StudentResponseDTO();
				res.setSno(rs.getString("student_id"));
				res.setSname(rs.getString("student_name"));
				res.setSclass(rs.getString("class_name"));
				res.setDate(rs.getDate("register_date").toLocalDate());
				res.setStatus(rs.getString("status"));
				list.add(res);
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return list;
	}

	public ArrayList<StudentResponseDTO> selectOneByName(String name) {
		ArrayList<StudentResponseDTO> list = new ArrayList<>();
		String sql = "select * from student where student_name=?";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, name);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				StudentResponseDTO res = new StudentResponseDTO();
				res.setSno(rs.getString("student_id"));
				res.setSname(rs.getString("student_name"));
				res.setSclass(rs.getString("class_name"));
				res.setDate(rs.getDate("register_date").toLocalDate());
				res.setStatus(rs.getString("status"));
				list.add(res);
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return list;
	}

	public ArrayList<StudentResponseDTO> selectOneByClass(String class_name) {
		ArrayList<StudentResponseDTO> list = new ArrayList<>();
		String sql = "select * from student where class_name=?";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, class_name);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				StudentResponseDTO res = new StudentResponseDTO();
				res.setSno(rs.getString("student_id"));
				res.setSname(rs.getString("student_name"));
				res.setSclass(rs.getString("class_name"));
				res.setDate(rs.getDate("register_date").toLocalDate());
				res.setStatus(rs.getString("status"));
				list.add(res);
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return list;
	}
	
	public int deleteData(StudentRequestDTO dto) {
		int result=0;
		String sql="delete from student where student_id=?";	
		try {
				PreparedStatement ps=con.prepareStatement(sql);
				ps.setString(1,dto.getSno());
				ps.executeUpdate();
		} catch (SQLException e) {
			System.out.println("Database error in deleting");
		}
		return result;
	}
	
	public StudentResponseDTO selectById(String id) {
		String sql = "select * from student where student_id=?";
		StudentResponseDTO res = new StudentResponseDTO();
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, id);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				res.setSno(rs.getString("student_id"));
				res.setSname(rs.getString("student_name"));
				res.setSclass(rs.getString("class_name"));
				res.setDate(rs.getDate("register_date").toLocalDate());
				res.setStatus(rs.getString("status"));
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return res;
	}
	
	public int deleteData(String id) {
		String sql = "delete from student where student_id=?";
		int i = 0;
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, id);
			i = ps.executeUpdate();
		} catch (Exception e) {
			System.out.println(e);
		}
		return i;
	}
}
