package com.luvit.domain;

public class FridgeVO {
	
	private String grain;
	private String meat;
	private String fish;
	private String veg;
	private String bread;
	private String fruit;
	private String dairy;
	private String nuts;
	private String spice;
	
	
	public FridgeVO() {}
	public FridgeVO(String grain, String meat, String fish, String veg, String bread, String fruit, String dairy,
			String nuts, String spice) {
		super();
		this.grain = grain;
		this.meat = meat;
		this.fish = fish;
		this.veg = veg;
		this.bread = bread;
		this.fruit = fruit;
		this.dairy = dairy;
		this.nuts = nuts;
		this.spice = spice;
	}
	public String getGrain() {
		return grain;
	}
	public void setGrain(String grain) {
		this.grain = grain;
	}
	public String getMeat() {
		return meat;
	}
	public void setMeat(String meat) {
		this.meat = meat;
	}
	public String getFish() {
		return fish;
	}
	public void setFish(String fish) {
		this.fish = fish;
	}
	public String getVeg() {
		return veg;
	}
	public void setVeg(String veg) {
		this.veg = veg;
	}
	public String getBread() {
		return bread;
	}
	public void setBread(String bread) {
		this.bread = bread;
	}
	public String getFruit() {
		return fruit;
	}
	public void setFruit(String fruit) {
		this.fruit = fruit;
	}
	public String getDairy() {
		return dairy;
	}
	public void setDairy(String dairy) {
		this.dairy = dairy;
	}
	public String getNuts() {
		return nuts;
	}
	public void setNuts(String nuts) {
		this.nuts = nuts;
	}
	public String getSpice() {
		return spice;
	}
	public void setSpice(String spice) {
		this.spice = spice;
	}
	@Override
	public String toString() {
		return "FridgeVO [grain=" + grain + ", meat=" + meat + ", fish=" + fish + ", veg=" + veg + ", bread=" + bread
				+ ", fruit=" + fruit + ", dairy=" + dairy + ", nuts=" + nuts + ", spice=" + spice + "]";
	}
	
	
	

}
