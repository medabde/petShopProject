package ma.noobs.pet.util;

import java.sql.Connection;
import java.sql.DriverManager;

import org.aeonbits.owner.ConfigFactory;



public class ConnectionDb{  
	private static final Configuration configuration = ConfigFactory.create(Configuration.class);
	private static final String url = configuration.getUrl();
	private static final String dbName = configuration.getDbName();
	private static final String username = configuration.getUsername();
	private static final String password = configuration.getPassword();
	private static final String jdbcDriver = configuration.getDriver();
	private static final String timeZone = configuration.getTimeZone();
	
	private static Connection con;
	
	
	public static Connection getConnection() {
		if(con == null) {
			try{
				
				Class.forName(jdbcDriver);
				
				
				con = DriverManager.getConnection(url+dbName+timeZone,username,password);
				
				
				}catch(Exception e){ 
					
					System.out.println(e);
				}
		}
		
		
		return con;
		
	}
	
}  