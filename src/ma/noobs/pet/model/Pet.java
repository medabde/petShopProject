package ma.noobs.pet.model;

public class Pet {
	private int id;
	private String name;
	private String description;
	private String details;
	private String promotion;
	private boolean isSpecial;
	private boolean isNew;
	private boolean isFeatured;
	private Category category;
	
	
	public Pet() {
		
	}


	public Pet(int id, String name, String description, String details, String promotion, boolean isSpecial,
			boolean isNew, boolean isFeatured, Category category) {
		this.id = id;
		this.name = name;
		this.description = description;
		this.details = details;
		this.promotion = promotion;
		this.isSpecial = isSpecial;
		this.isNew = isNew;
		this.isFeatured = isFeatured;
		this.category = category;
	}


	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getDescription() {
		return description;
	}


	public void setDescription(String description) {
		this.description = description;
	}


	public String getDetails() {
		return details;
	}


	public void setDetails(String details) {
		this.details = details;
	}


	public String getPromotion() {
		return promotion;
	}


	public void setPromotion(String promotion) {
		this.promotion = promotion;
	}


	public boolean isSpecial() {
		return isSpecial;
	}


	public void setSpecial(boolean isSpecial) {
		this.isSpecial = isSpecial;
	}


	public boolean isNew() {
		return isNew;
	}


	public void setNew(boolean isNew) {
		this.isNew = isNew;
	}


	public boolean isFeatured() {
		return isFeatured;
	}


	public void setFeatured(boolean isFeatured) {
		this.isFeatured = isFeatured;
	}


	public Category getCategory() {
		return category;
	}


	public void setCategory(Category category) {
		this.category = category;
	}
	
	

}
