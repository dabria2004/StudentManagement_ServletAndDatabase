package Student_Project.persistance.dao;

import java.sql.*;

public class MyConnection {
	static Connection con=null;
	public static Connection getConnection(){
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/testdb","ppt","ppt@2004");
			System.out.println("Connecting...");
		}catch(ClassNotFoundException e){
			System.out.println("Driver class not found.");
		}catch(SQLException e) {
			System.out.println("Database not found.");
		}
			return con;
	}
}
