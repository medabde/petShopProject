package ma.noobs.pet.model;

public class User {
	private int id;
	private String username;
	private String password;
	private String email;
	private String phone;
	private String company;
	private String address;
	private boolean isAdmin;
	
	
	public User() {
		
	}
	
	public User(String username,String password, String email, String phone, String company, String address, boolean isAdmin) {
		this.username = username;
		this.email = email;
		this.phone = phone;
		this.company = company;
		this.address = address;
		this.isAdmin = isAdmin;
		this.password = password;
	}
	
	
	public User(int id, String username,String password, String email, String phone, String company, String address, boolean isAdmin) {
		this.id = id;
		this.username = username;
		this.email = email;
		this.phone = phone;
		this.company = company;
		this.address = address;
		this.isAdmin = isAdmin;
		this.password = password;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public boolean isAdmin() {
		return isAdmin;
	}

	public void setAdmin(boolean isAdmin) {
		this.isAdmin = isAdmin;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
	
	
	
	
	
}
