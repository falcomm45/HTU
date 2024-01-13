package kr.or.ddit.juyeon;

public class Student extends People{
	private int hak; //학번
	private int ban; //학번
	private int no; //학번
	
	public Student() {}
	
	public Student(String peopleId
			,String name
			,String sex
			,int age
			,int hak
			,int ban
			,int no) {
		this.name=name;
		this.peopleId=peopleId;
		this.age=age;
		this.sex=sex;
		this.hak=hak;
		this.ban=ban;
		this.no=no;
	}
	
	public int getHak() {
		return hak;
	}
	public void setHak(int hak) {
		this.hak = hak;
	}
	public int getBan() {
		return ban;
	}
	public void setBan(int ban) {
		this.ban = ban;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	@Override
	public String toString() {
		return "Student [hak=" + hak + ", ban=" + ban + ", no=" + no + "]";
	}
	
	
}
