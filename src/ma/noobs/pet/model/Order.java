package ma.noobs.pet.model;

public class Order {
	private int id;
	private User user;
	private Pet pet;
	private int quantity;
	
	public Order() {
		
	}

	public Order(int id, User user, Pet pet, int quantity) {
		this.id = id;
		this.user = user;
		this.pet = pet;
		this.quantity = quantity;
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

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	
	
	
	
	
	
}
