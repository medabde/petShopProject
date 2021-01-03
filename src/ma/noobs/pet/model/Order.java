package ma.noobs.pet.model;

public class Order {
	private int id;
	private User user;
	private Pet pet;
	
	public Order() {
		
	}

	public Order(int id, User user, Pet pet) {
		this.id = id;
		this.user = user;
		this.pet = pet;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Pet getPet() {
		return pet;
	}

	public void setPet(Pet pet) {
		this.pet = pet;
	}
	
	
	
	
	
	
}
