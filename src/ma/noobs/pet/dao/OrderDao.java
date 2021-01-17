package ma.noobs.pet.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import ma.noobs.pet.model.Order;
import ma.noobs.pet.util.ConnectionDb;

public class OrderDao {
	private final String tableName = "order";
	private final String[] columns = new String[] {"id","iduser","idpet","quantity"};
	private Connection conn = ConnectionDb.getConnection();

	private UserDao userdao = new UserDao();
	private PetDao petdao = new PetDao();
	
	

	public Order get(long id) {
		String query = String.format("SELECT * FROM `%s` WHERE id = %d", tableName,id);
		Order order = new Order();
		
		try {
			Statement stmt= conn.createStatement();  
			ResultSet rs;
			rs = stmt.executeQuery(query);
			while(rs.next()) {
				order.setId(rs.getInt(columns[0]));
				order.setUser(userdao.get(rs.getInt(columns[1])));
				order.setPet(petdao.get(rs.getInt(columns[2])));
				order.setQuantity(rs.getInt(columns[3]));
				
				return order;
			}
						
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}  
		
		
		return null;
	}
	
	public List<Order> getUserOrders(long idUser){
		String query = String.format("SELECT * FROM `%s` WHERE %s = %d", tableName,columns[1],idUser);
		List<Order> list = new ArrayList<>();
		
		try {
			Statement stmt = conn.createStatement();  
			ResultSet rs;
			rs = stmt.executeQuery(query);
			while(rs.next()) {
				Order order = new Order();
				
				order.setId(rs.getInt(columns[0]));
				order.setUser(userdao.get(rs.getInt(columns[1])));
				order.setPet(petdao.get(rs.getInt(columns[2])));
				order.setQuantity(rs.getInt(columns[3]));
				
				list.add(order);
			}
						
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}  
		
		
		
		return list;
	}

	
	public List<Order> getAll() {
		String query = String.format("SELECT * FROM `%s`", tableName);
		List<Order> list = new ArrayList<>();
		
		try {
			Statement stmt = conn.createStatement();  
			ResultSet rs;
			rs = stmt.executeQuery(query);
			while(rs.next()) {
				Order order = new Order();
				
				order.setId(rs.getInt(columns[0]));
				order.setUser(userdao.get(rs.getInt(columns[1])));
				order.setPet(petdao.get(rs.getInt(columns[2])));
				order.setQuantity(rs.getInt(columns[3]));
				
				list.add(order);
			}
						
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}  
		
		
		
		return list;
	}

	
	public void save(Order t) {
		Order ord = this.getOrderByUserAndPet(t.getUser().getId(), t.getPet().getId()); 
		if(ord==null) {
			
			String query = String.format("INSERT INTO `%s`(%s,%s,%s) VALUES('%s','%s','%s')", 
					tableName,columns[1],columns[2],columns[3],
					t.getUser().getId(),t.getPet().getId(),t.getQuantity());
			
			try {
				Statement stmt= conn.createStatement();  
				stmt.executeUpdate(query);
							
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
			
		}else {
			this.increaseQuantity(ord);
		}
		  
		
	}

	
	public void update(Order t, HashMap<String,String> params) {
		String query = String.format("UPDATE `%s` SET %s = '%s',%s = '%s', %s = '%s' WHERE id = '%d'", 
				tableName,
				columns[1],(params.get(columns[1])==null)?t.getUser().getId():params.get(columns[1]),
				columns[2],(params.get(columns[2])==null)?t.getPet().getId():params.get(columns[2]),
				columns[3],(params.get(columns[3])==null)?t.getQuantity():params.get(columns[3]),
				t.getId());
		
		try {
			Statement stmt= conn.createStatement();  
			stmt.executeUpdate(query);
						
		} catch (SQLException e) {
			
			e.printStackTrace();
		}  
	}

	
	public void delete(Order t) {
		String query = String.format("DELETE FROM `%s` WHERE id = '%d'", tableName,t.getId());
		
		try {
			Statement stmt= conn.createStatement();  
			stmt.executeUpdate(query);
						
		} catch (SQLException e) {
			
			e.printStackTrace();
		}  
		
	}

	
	private Order getOrderByUserAndPet(int idUser,int idOrder) {
		String query = String.format("SELECT * FROM `%s` WHERE %s = %d AND %s = %d", tableName,columns[1],idUser,columns[2],idOrder);
		Order order = new Order();
		
		try {
			Statement stmt= conn.createStatement();  
			ResultSet rs;
			rs = stmt.executeQuery(query);
			while(rs.next()) {
				order.setId(rs.getInt(columns[0]));
				order.setUser(userdao.get(rs.getInt(columns[1])));
				order.setPet(petdao.get(rs.getInt(columns[2])));
				order.setQuantity(rs.getInt(columns[3]));
				
				return order;
			}
						
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}  
		
		
		return null;
	}

	public void increaseQuantity(Order t) {
		HashMap<String,String> params = new HashMap<>();
		params.put(columns[3], String.valueOf(t.getQuantity()+1));
		this.update(t,params);
	}
	
	public void reduceQuantity(Order t) {
		if(t.getQuantity()==1) {
			this.delete(t);
		}else {
			HashMap<String,String> params = new HashMap<>();
			params.put(columns[3], String.valueOf(t.getQuantity()-1));
			this.update(t,params);
		}
	}

}
