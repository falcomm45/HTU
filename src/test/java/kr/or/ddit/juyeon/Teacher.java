package kr.or.ddit.juyeon;

public class Teacher extends People{
	public static final String OPERATE_TYPE_A="정규직";
	public static final String OPERATE_TYPE_B="기간제";
	
	public static final String MANAGE_TYPE_A="일반교사";
	public static final String MANAGE_TYPE_B="담임교사";
	
	private String operateType;
	private String manageType;
	
	public Teacher(String peopleId
			,String name
			,String sex
			,int age
			,String operateType
			,String manageType) {
		this.peopleId=peopleId;
		this.name=name;
		this.sex=sex;
		this.age=age;
		this.operateType=operateType;
		this.manageType=manageType;
		
	}
	
	public String getOperateType() {
		return operateType;
	}
	public void setOperateType(String operateType) {
		this.operateType = operateType;
	}
	public String getManageType() {
		return manageType;
	}
	public void setManageType(String manageType) {
		this.manageType = manageType;
	}
	@Override
	public String toString() {
		return "Teacher [operateType=" + operateType + ", manageType=" + manageType + "]";
	}
	
}
