package ma.noobs.pet.model;

public class Currency {
	private String name ;
	private double multiplier;
	private String code;
	
	public Currency() {
		
	}

	public Currency(String name, double multiplier, String code) {
		super();
		this.name = name;
		this.multiplier = multiplier;
		this.code = code;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public double getMultiplier() {
		return multiplier;
	}

	public void setMultiplier(double multiplier) {
		this.multiplier = multiplier;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}
	
	

}
