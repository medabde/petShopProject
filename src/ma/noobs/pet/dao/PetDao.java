package ma.noobs.pet.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import ma.noobs.pet.model.Category;
import ma.noobs.pet.model.Pet;
import ma.noobs.pet.util.ConnectionDb;

public class PetDao {
	private final String tableName = "pet";
	private String[] columns = new String[] {"id","name","picture","description",
			"details","price","promotion","isSpecial",
			"isNew","idcategory","isFeatured"};
	private Connection conn = ConnectionDb.getConnection();
	
	
	
	public Pet get(int id) {
		String query = String.format("SELECT * FROM %s WHERE id = %d", tableName,id);
		Pet pet = new Pet();
		
		try {
			Statement stmt= conn.createStatement();  
			ResultSet rs;
			rs = stmt.executeQuery(query);
			while(rs.next()) {
				pet.setId(rs.getInt(columns[0]));
				pet.setName(rs.getString(columns[1]));
				pet.setPicture(rs.getString(columns[2]));
				pet.setDescription(rs.getString(columns[3]));
				pet.setDetails(rs.getString(columns[4]));
				pet.setPrice(rs.getDouble(columns[5]));
				pet.setPromotion(rs.getInt(columns[6]));
				pet.setSpecial(rs.getBoolean(columns[7]));
				pet.setNew(rs.getBoolean(columns[8]));
				pet.setFeatured(rs.getBoolean(columns[10]));
				
				
				CategoryDao dao = new CategoryDao();
				Category cat = dao.get(rs.getInt(columns[9]));
				pet.setCategory(cat);
				
				return pet;
				
			}
						
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}  
		
		
		
		return null;
	}

	
	public List<Pet> getAll() {
		String query = String.format("SELECT * FROM %s", tableName);
		List<Pet> list = new ArrayList<>();
		
		try {
			Statement stmt = conn.createStatement();  
			ResultSet rs;
			rs = stmt.executeQuery(query);
			while(rs.next()) {
				Pet pet = new Pet();
				pet.setId(rs.getInt(columns[0]));
				pet.setName(rs.getString(columns[1]));
				pet.setPicture(rs.getString(columns[2]));
				pet.setDescription(rs.getString(columns[3]));
				pet.setDetails(rs.getString(columns[4]));
				pet.setPrice(rs.getDouble(columns[5]));
				pet.setPromotion(rs.getInt(columns[6]));
				pet.setSpecial(rs.getBoolean(columns[7]));
				pet.setNew(rs.getBoolean(columns[8]));
				pet.setFeatured(rs.getBoolean(columns[10]));
				
				
				CategoryDao dao = new CategoryDao();
				Category cat = dao.get(rs.getInt(columns[9]));
				pet.setCategory(cat);
				
				
				list.add(pet);
			}
						
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}  
		
		
		
		return list;
	}

	
	public List<Pet> getFromCat(long id) {
		String query = String.format("SELECT * FROM %s WHERE %s = %d", tableName,columns[9],id);
		List<Pet> list = new ArrayList<>();
		
		try {
			Statement stmt = conn.createStatement();  
			ResultSet rs;
			rs = stmt.executeQuery(query);
			while(rs.next()) {
				Pet pet = new Pet();
				pet.setId(rs.getInt(columns[0]));
				pet.setName(rs.getString(columns[1]));
				pet.setPicture(rs.getString(columns[2]));
				pet.setDescription(rs.getString(columns[3]));
				pet.setDetails(rs.getString(columns[4]));
				pet.setPrice(rs.getDouble(columns[5]));
				pet.setPromotion(rs.getInt(columns[6]));
				pet.setSpecial(rs.getBoolean(columns[7]));
				pet.setNew(rs.getBoolean(columns[8]));
				pet.setFeatured(rs.getBoolean(columns[10]));
				
				
				CategoryDao dao = new CategoryDao();
				Category cat = dao.get(rs.getInt(columns[9]));
				pet.setCategory(cat);
				
				
				list.add(pet);
			}
						
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}  
		
		
		
		return list;
	}

	
	public List<Pet> getSpecialPets(){
		String query = String.format("SELECT * FROM %s WHERE %s = %d", tableName,columns[7],1);
		List<Pet> list = new ArrayList<>();
		
		try {
			Statement stmt = conn.createStatement();  
			ResultSet rs;
			rs = stmt.executeQuery(query);
			while(rs.next()) {
				Pet pet = new Pet();
				pet.setId(rs.getInt(columns[0]));
				pet.setName(rs.getString(columns[1]));
				pet.setPicture(rs.getString(columns[2]));
				pet.setDescription(rs.getString(columns[3]));
				pet.setDetails(rs.getString(columns[4]));
				pet.setPrice(rs.getDouble(columns[5]));
				pet.setPromotion(rs.getInt(columns[6]));
				pet.setSpecial(rs.getBoolean(columns[7]));
				pet.setNew(rs.getBoolean(columns[8]));
				pet.setFeatured(rs.getBoolean(columns[10]));
				
				
				CategoryDao dao = new CategoryDao();
				Category cat = dao.get(rs.getInt(columns[9]));
				pet.setCategory(cat);
				
				
				list.add(pet);
			}
						
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}  
		
		
		
		return list;
	}
	
	
	
	
	public List<Pet> getPromotedPets(){
		String query = String.format("SELECT * FROM %s WHERE %s > 0", tableName,columns[6]);
		List<Pet> list = new ArrayList<>();
		
		try {
			Statement stmt = conn.createStatement();  
			ResultSet rs;
			rs = stmt.executeQuery(query);
			while(rs.next()) {
				Pet pet = new Pet();
				pet.setId(rs.getInt(columns[0]));
				pet.setName(rs.getString(columns[1]));
				pet.setPicture(rs.getString(columns[2]));
				pet.setDescription(rs.getString(columns[3]));
				pet.setDetails(rs.getString(columns[4]));
				pet.setPrice(rs.getDouble(columns[5]));
				pet.setPromotion(rs.getInt(columns[6]));
				pet.setSpecial(rs.getBoolean(columns[7]));
				pet.setNew(rs.getBoolean(columns[8]));
				pet.setFeatured(rs.getBoolean(columns[10]));
				
				
				CategoryDao dao = new CategoryDao();
				Category cat = dao.get(rs.getInt(columns[9]));
				pet.setCategory(cat);
				
				
				list.add(pet);
			}
						
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}  
		
		
		
		return list;
	}
	
	
	
	
	public List<Pet> getFeaturedPets(){
		String query = String.format("SELECT * FROM %s WHERE %s = '%d'", tableName,columns[10],1);
		List<Pet> list = new ArrayList<>();
		
		try {
			Statement stmt = conn.createStatement();  
			ResultSet rs;
			rs = stmt.executeQuery(query);
			while(rs.next()) {
				Pet pet = new Pet();
				pet.setId(rs.getInt(columns[0]));
				pet.setName(rs.getString(columns[1]));
				pet.setPicture(rs.getString(columns[2]));
				pet.setDescription(rs.getString(columns[3]));
				pet.setDetails(rs.getString(columns[4]));
				pet.setPrice(rs.getDouble(columns[5]));
				pet.setPromotion(rs.getInt(columns[6]));
				pet.setSpecial(rs.getBoolean(columns[7]));
				pet.setNew(rs.getBoolean(columns[8]));
				pet.setFeatured(rs.getBoolean(columns[10]));
				
				
				CategoryDao dao = new CategoryDao();
				Category cat = dao.get(rs.getInt(columns[9]));
				pet.setCategory(cat);
				
				
				list.add(pet);
			}
						
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}  
		
		
		
		return list;
	}
	
	public List<Pet> getNewPets(){
		String query = String.format("SELECT * FROM %s WHERE %s = '%d'", tableName,columns[8],1);
		List<Pet> list = new ArrayList<>();
		
		try {
			Statement stmt = conn.createStatement();  
			ResultSet rs;
			rs = stmt.executeQuery(query);
			while(rs.next()) {
				Pet pet = new Pet();
				pet.setId(rs.getInt(columns[0]));
				pet.setName(rs.getString(columns[1]));
				pet.setPicture(rs.getString(columns[2]));
				pet.setDescription(rs.getString(columns[3]));
				pet.setDetails(rs.getString(columns[4]));
				pet.setPrice(rs.getDouble(columns[5]));
				pet.setPromotion(rs.getInt(columns[6]));
				pet.setSpecial(rs.getBoolean(columns[7]));
				pet.setNew(rs.getBoolean(columns[8]));
				pet.setFeatured(rs.getBoolean(columns[10]));
				
				
				CategoryDao dao = new CategoryDao();
				Category cat = dao.get(rs.getInt(columns[9]));
				pet.setCategory(cat);
				
				
				list.add(pet);
			}
						
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}  
		
		
		
		return list;
		
	}
	
	public void save(Pet t) {
		String query = String.format("INSERT INTO %s(%s,%s,%s,%s,%s,%s,%s,%s,%s,%s) VALUES('%s','%s','%s','%s','%s','%s','%s','%s','%s','%s')", 
				tableName,columns[1],columns[2],columns[3],columns[4],columns[5],columns[6],columns[7],columns[8],columns[9],columns[10],
				t.getName(),t.getPicture(),t.getDescription(),t.getDetails(),t.getPrice(),
				t.getPromotion(),(t.isSpecial())?1:0,(t.isNew())?1:0,t.getCategory().getId(),(t.isFeatured())?1:0);
		
		try {
			Statement stmt= conn.createStatement();  
			stmt.executeUpdate(query);
						
		} catch (SQLException e) {
			
			e.printStackTrace();
		}  
	}

	
	public void update(Pet t, HashMap<String,String> params) {
		String query = String.format("UPDATE %s SET %s = '%s', %s = '%s',%s = '%s', %s = '%s',%s = '%s', %s = '%s', %s = '%s', %s = '%s', %s = '%s', %s = '%s' WHERE id = '%d'", 
				tableName,
				columns[1],(params.get(columns[1])==null)?t.getName():params.get(columns[1]),
				columns[2],(params.get(columns[2])==null)?t.getPicture():params.get(columns[2]),
				columns[3],(params.get(columns[3])==null)?t.getDescription():params.get(columns[3]),
				columns[4],(params.get(columns[4])==null)?t.getDetails():params.get(columns[4]),
				columns[5],(params.get(columns[5])==null)?t.getPrice():params.get(columns[5]),
				columns[6],(params.get(columns[6])==null)?t.getPromotion():params.get(columns[6]),
				columns[7],(params.get(columns[7])==null)?(t.isSpecial())?1:0:params.get(columns[7]),
				columns[8],(params.get(columns[8])==null)?(t.isNew())?1:0:params.get(columns[8]),
				columns[9],(params.get(columns[9])==null)?t.getCategory().getId():params.get(columns[9]),
				columns[10],(params.get(columns[10])==null)?(t.isFeatured())?1:0:params.get(columns[10]),
				t.getId());
		
		
		try {
			Statement stmt= conn.createStatement();  
			stmt.executeUpdate(query);
						
		} catch (SQLException e) {
			
			e.printStackTrace();
		}  
		
	}

	
	public void delete(Pet t) {
		String query = String.format("DELETE FROM %s WHERE id = '%d'", tableName,t.getId());
		
		try {
			Statement stmt= conn.createStatement();  
			stmt.executeUpdate(query);
						
		} catch (SQLException e) {
			
			e.printStackTrace();
		}  
		
	}

}
