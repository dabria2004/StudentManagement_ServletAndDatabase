package Student_Project.persistance.dao;
import java.sql.*;
import java.util.ArrayList;

import Student_Project.model.UserBean;
import Student_Project.persistance.dto.UserRequesDTO;
import Student_Project.persistance.dto.UserResponseDTO;
public class UserDAO {
		public static Connection con=null;
		static {
			con=MyConnection.getConnection();
			System.out.println("Got Connection...");
		}
		public int insertData(UserRequesDTO dto) {
			int result=0;
			String sql="insert into user(user_id,user_name,user_password) values(?,?,?)";	
			try {
					PreparedStatement ps=con.prepareStatement(sql);
					ps.setString(1,dto.getRid());
					ps.setString(2,dto.getRname());
					ps.setString(3,dto.getRpassword());
					result=ps.executeUpdate();
			} catch (SQLException e) {
				System.out.println("Database error in inserthing");
			}
			return result;
		}
		
		public int updateData(UserRequesDTO dto) {
			int result=0;
			String sql="update user set user_id=?,user_name=?,user_password=? where user_id=?";	
			try {
					PreparedStatement ps=con.prepareStatement(sql);
					ps.setString(1,dto.getRid());
					ps.setString(2,dto.getRname());
					ps.setString(3,dto.getRpassword());
					result=ps.executeUpdate();
			} catch (SQLException e) {
				System.out.println("Database error in updating");
			}
			return result;
		}
		
		public int deleteData(UserRequesDTO dto) {
			int result=0;
			String sql="delete from user where user_id=?";	
			try {
					PreparedStatement ps=con.prepareStatement(sql);
					ps.setString(1,dto.getRid());
					ps.executeUpdate();
			} catch (SQLException e) {
				System.out.println("Database error in deleting");
			}
			return result;
		}
		
		
		public UserResponseDTO selectOneByname(String rname) {
			UserResponseDTO res=new UserResponseDTO();
			String sql="select * from user where user_name=?";
			try {
				PreparedStatement ps=con.prepareStatement(sql);
				ps.setString(1,rname);
				ResultSet rs=ps.executeQuery();
				while(rs.next()) {
					res.setRid(rs.getString("user_id"));
					res.setRname(rs.getString("user_name"));
					res.setRpassword(rs.getString("user_password"));
				}
			}catch(SQLException e) {
				e.printStackTrace();
			}
			return res;		
		}
		
		public ArrayList<UserResponseDTO> selectAll(){
			ArrayList<UserResponseDTO> list=new ArrayList<>();
			String sql="select * from user";		
			try {
			PreparedStatement ps=con.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				UserResponseDTO res=new UserResponseDTO();
				res.setRid(rs.getString("user_id"));
				res.setRname(rs.getString("user_name"));
				res.setRpassword(rs.getString("user_password"));
				list.add(res);
	}
		} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return list;
		}
		
		public ArrayList<UserResponseDTO> selectUserByIdOrName(String userId, String userName) {
			String sql = "select * from user where user_id=? or user_name=?";
			ArrayList<UserResponseDTO> userList = new ArrayList<>();
			try {
				PreparedStatement ps = con.prepareStatement(sql);
				ps.setString(1, userId);
				ps.setString(2, userName);
				ResultSet rs = ps.executeQuery();
				while (rs.next()) {
				    UserResponseDTO res = new UserResponseDTO();
					res.setRid(rs.getString("user_id"));
					res.setRname(rs.getString("user_name"));
					res.setRpassword(rs.getString("user_password"));
					userList.add(res);
				}
			} catch (Exception e) {
				System.out.println(e);
			}
			return userList;
		}
		
		public boolean check(String user_id, String user_password) {

			String sql = "select * from user where user_id=? && user_password=?";
			try {
				PreparedStatement st = con.prepareStatement(sql);
				st.setString(1, user_id);
				st.setString(2, user_password);
				ResultSet rs = st.executeQuery();
				if (rs.next()) {
					return true;
				}
			} catch (Exception e) {
				System.out.println(e);
			}

			return false;
		}
		
		public UserResponseDTO selectOneById(String userId) {
            String sql = "select * from user where user_id=?";
            UserResponseDTO res = new UserResponseDTO();
            try {
                PreparedStatement ps = con.prepareStatement(sql);
                ps.setString(1, userId);
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    res.setRid(rs.getString("user_id"));
                    res.setRname(rs.getString("user_name"));
                    res.setRpassword(rs.getString("user_password"));
                }
            } catch (Exception e) {
                System.out.println(e);
            }
            return res;
        }
}
