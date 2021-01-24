package ma.noobs.pet.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import ma.noobs.pet.model.User;
import ma.noobs.pet.util.ConnectionDb;
import ma.noobs.pet.util.PasswordCrypting;

public class UserDao {
	private final String tableName = "user";
	private final String[] columns = new String[] {"id","username","password","email","phone","company","address","isAdmin"};
	private Connection conn = ConnectionDb.getConnection();
	
	public User get(long id) {
		String query = String.format("SELECT * FROM %s WHERE id = %d", tableName,id);
		User user = new User();
		
		try {
			Statement stmt= conn.createStatement();  
			ResultSet rs;
			rs = stmt.executeQuery(query);
			while(rs.next()) {
				user.setId(rs.getInt(columns[0]));
				user.setUsername(rs.getString(columns[1]));
				user.setPassword(rs.getString(columns[2]));
				user.setEmail(rs.getString(columns[3]));
				user.setPhone(rs.getString(columns[4]));
				user.setCompany(rs.getString(columns[5]));
				user.setAddress(rs.getString(columns[6]));
				user.setAdmin(rs.getBoolean(columns[7]));
				
				
				return user;
			}
						
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}  
		
		
		
		return null;
	}

	
	public List<User> getAll() {
		String query = String.format("SELECT * FROM %s", tableName);
		List<User> list = new ArrayList<>();
		
		try {
			Statement stmt = conn.createStatement();  
			ResultSet rs;
			rs = stmt.executeQuery(query);
			while(rs.next()) {
				User user = new User();
				
				user.setId(rs.getInt(columns[0]));
				user.setUsername(rs.getString(columns[1]));
				user.setPassword(rs.getString(columns[2]));
				user.setEmail(rs.getString(columns[3]));
				user.setPhone(rs.getString(columns[4]));
				user.setCompany(rs.getString(columns[5]));
				user.setAddress(rs.getString(columns[6]));
				user.setAdmin(rs.getBoolean(columns[7]));
				
				
				list.add(user);
			}
						
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}  
		
		
		
		return list;
	}

	
	public void save(User t) {
		String query = String.format("INSERT INTO %s(%s,%s,%s,%s,%s,%s,%s) VALUES('%s','%s','%s','%s','%s','%s','%s')", 
				tableName,columns[1],columns[2],columns[3],columns[4],columns[5],columns[6],columns[7],
				t.getUsername(),PasswordCrypting.generateSecurePassword(t.getPassword()),t.getEmail(),t.getPhone(),t.getCompany(),
				t.getAddress(),(t.isAdmin())?1:0);
		
		try {
			Statement stmt= conn.createStatement();  
			stmt.executeUpdate(query);
						
		} catch (SQLException e) {
			
			e.printStackTrace();
		}  
		
	}

	
	public void update(User t, HashMap<String,String> params) {
		String query = String.format("UPDATE %s SET %s = '%s',%s = '%s', %s = '%s', %s = '%s', %s = '%s', %s = '%s', %s = '%s' WHERE id = '%d'", 
				tableName,
				columns[1],(params.get(columns[1])==null)?t.getUsername():params.get(columns[1]),
				columns[2],(params.get(columns[2])==null)?t.getPassword():PasswordCrypting.generateSecurePassword(params.get(columns[2])),
				columns[3],(params.get(columns[3])==null)?t.getEmail():params.get(columns[3]),
				columns[4],(params.get(columns[4])==null)?t.getPhone():params.get(columns[4]),
				columns[5],(params.get(columns[5])==null)?t.getCompany():params.get(columns[5]),
				columns[6],(params.get(columns[6])==null)?t.getAddress():params.get(columns[6]),
				columns[7],(params.get(columns[7])==null)?(t.isAdmin())?1:0:params.get(columns[7]),
				t.getId());
		
		try {
			Statement stmt= conn.createStatement();  
			stmt.executeUpdate(query);
						
		} catch (SQLException e) {
			
			e.printStackTrace();
		}  
		
	}
	
	public boolean isUserNameExist(String username) {
		String query = String.format("SELECT * FROM %s WHERE %s = '%s'", tableName,columns[1],username);
		
		try {
			Statement stmt = conn.createStatement();  
			ResultSet rs;
			rs = stmt.executeQuery(query);
			while(rs.next()) {
				return true;
			}
						
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}  
		
		
		
		return false;
	}
	
	public boolean isEmailExist(String email) {
		String query = String.format("SELECT * FROM %s WHERE %s = '%s'", tableName,columns[3],email);
		
		try {
			Statement stmt = conn.createStatement();  
			ResultSet rs;
			rs = stmt.executeQuery(query);
			while(rs.next()) {
				return true;
			}
						
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}  
		
		
		
		return false;
	}

	
	public void delete(User t) {
		String query = String.format("DELETE FROM %s WHERE id = '%d'", tableName,t.getId());
		
		try {
			Statement stmt= conn.createStatement();  
			stmt.executeUpdate(query);
						
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
	}
	
	public User checkLogin(String username,String password,boolean isAdmin) {
		String query = String.format("SELECT id FROM %s WHERE %s = '%s' AND %s = '%s' AND %s = '%d' ", 
				tableName,columns[1],username,columns[2],PasswordCrypting.generateSecurePassword(password),columns[7],(isAdmin)?1:0);
		
		
		try {
			Statement stmt= conn.createStatement();  
			ResultSet rs;
			rs = stmt.executeQuery(query);
			while(rs.next()) {
				return this.get(rs.getInt("id"));
			}
						
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}  
		
		
		
		return null;
		
	}

}
