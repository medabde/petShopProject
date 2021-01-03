package ma.noobs.pet.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Optional;

import ma.noobs.pet.model.Pet;
import ma.noobs.pet.util.ConnectionDb;

public class PetDao implements Dao<Pet> {
	private final String tableName = "pet";
	private Connection conn = ConnectionDb.getConnection();
	
	@Override
	public Optional<Pet> get(long id) {
		Pet pet = new Pet();
		try {
			Statement stmt= conn.createStatement();  
			ResultSet rs;
			rs = stmt.executeQuery("SELECT * FROM user WHERE id = "+id);
			while(rs.next()) {
				System.out.println(rs.getString(1)+rs.getString(2));
				
			}
						
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}  
		
		
		
		return null;
	}

	@Override
	public List<Pet> getAll() {
		// TODO Auto-generated method stub
		return new ArrayList<Pet>();
	}

	@Override
	public void save(Pet t) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void update(Pet t, HashMap<String,String> params) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(Pet t) {
		// TODO Auto-generated method stub
		
	}

}
