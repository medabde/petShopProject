package ma.noobs.pet.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionDb{  
	private static final String url = "jdbc:mysql://localhost:3306/";
	private static final String username = "root";
	private static final String password = "root";
	private static final String dbName = "jeeprjct";
	
	private static Connection con;
	
	
	public static Connection getConnection() {
		if(con == null) {
			try{  
				
				con = DriverManager.getConnection(url+dbName,username,password);
				
				
				}catch(Exception e){ 
					
					System.out.println(e);
				}
		}
		
		return con;
		
	}
	
}  