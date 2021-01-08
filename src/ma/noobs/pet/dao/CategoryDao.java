package ma.noobs.pet.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import ma.noobs.pet.model.Category;
import ma.noobs.pet.util.ConnectionDb;

public class CategoryDao{
	private final String tableName = "category";
	private final String[] columns = new String[] {"id","name"};
	private Connection conn = ConnectionDb.getConnection();
	
	public Category get(int id) {
		String query = String.format("SELECT * FROM %s WHERE id = %d", tableName,id);
		Category cat = new Category();
		
		try {
			Statement stmt= conn.createStatement();  
			ResultSet rs;
			rs = stmt.executeQuery(query);
			while(rs.next()) {
				cat.setId(rs.getInt(columns[0]));
				cat.setName(rs.getString(columns[1]));
				return cat;
			}
						
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}  
		
		
		
		return null;
	}

	
	public List<Category> getAll() {
		String query = String.format("SELECT * FROM %s", tableName);
		List<Category> list = new ArrayList<>();
		
		try {
			Statement stmt= conn.createStatement();  
			ResultSet rs;
			rs = stmt.executeQuery(query);
			while(rs.next()) {
				Category cat = new Category(rs.getInt(columns[0]),rs.getString(columns[1]));
				list.add(cat);
			}
						
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}  
		
		
		
		return list;
	}

	
	public void save(Category t) {
		String query = String.format("INSERT INTO %s(%s) VALUES('%s')", tableName,columns[1],t.getName());
		
		try {
			Statement stmt= conn.createStatement();  
			stmt.executeUpdate(query);
						
		} catch (SQLException e) {
			
			e.printStackTrace();
		}  
	}

	
	public void update(Category t, HashMap<String,String> params) {
		String query = String.format("UPDATE %s SET %s = '%s' WHERE id = '%d'", tableName,columns[1],params.get(columns[1]),t.getId());
		
		try {
			Statement stmt= conn.createStatement();  
			stmt.executeUpdate(query);
						
		} catch (SQLException e) {
			
			e.printStackTrace();
		}  
	}

	
	public void delete(Category t) {
		String query = String.format("DELETE FROM %s WHERE id = '%d'", tableName,t.getId());
		
		try {
			Statement stmt= conn.createStatement();  
			stmt.executeUpdate(query);
						
		} catch (SQLException e) {
			
			e.printStackTrace();
		}  
		
	}

}
