package Student_Project.persistance.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import Student_Project.persistance.dto.ClassRequestDTO;
import Student_Project.persistance.dto.ClassResponseDTO;

public class ClassDAO {
	public static Connection con=null;
	static {
		con=MyConnection.getConnection();
		System.out.println("Got Connection...");
	}
	public int insertData(ClassRequestDTO dto) {
		int result=0;
		String sql="insert into class(class_id,class_name) values(?,?)";	
		try {
				PreparedStatement ps=con.prepareStatement(sql);
				ps.setString(1,dto.getClassid());
				ps.setString(2,dto.getClassname());
				result=ps.executeUpdate();
		} catch (SQLException e) {
			System.out.println("Database error");
		}
		return result;
	}
	public ClassResponseDTO selectOne(ClassRequestDTO dto) {
		ClassResponseDTO res=new ClassResponseDTO();
		String sql="select * from class where class_id=?";
		try {
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1,dto.getClassid());
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				res.setClassid(rs.getString("class_id"));
				res.setClassname(rs.getString("class_name"));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return res;		
	}
	
	public ArrayList<ClassResponseDTO> selectAll(){
		ArrayList<ClassResponseDTO> list=new ArrayList<>();
		String sql="select * from class";		
		try {
		PreparedStatement ps=con.prepareStatement(sql);
		ResultSet rs=ps.executeQuery();
		while(rs.next()) {
			ClassResponseDTO res=new ClassResponseDTO();
			res.setClassid(rs.getString("class_id"));
			res.setClassname(rs.getString("class_name"));
			list.add(res);
}
	} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
}
