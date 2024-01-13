package kr.or.ddit.juyeon;

import java.util.ArrayList;
import java.util.List;

public class Manager {
	private List<People> peopleList=new ArrayList<People>();
	
	public void insert(People people) {
		if(!peopleList.contains(people)) {
			peopleList.add(people);
		}
	}
	
	public int update(People people) {
		int cnt=0;
		if(peopleList.contains(people)) {
			peopleList.add(people);
		}
		return cnt;
	}
	
	
	public int delete(People people) {
		int cnt=0;
		
		for(int i=0; i<peopleList.size(); i++) {
		}
		return cnt;
	}
	
	public int deleteList(People people) {
		int cnt=0;
		
		return cnt;
	}
	
	public void printPeopleList() {
		for(People people:peopleList) {
			System.out.println(people);
		}
	}
	
	public static void main(String[] args) {
		Manager manager = new Manager();
		People people1 = new Student();
		people1.setName("최주연");
		people1.setSex("여자");
		people1.setAge(13);
		((Student)people1).setHak(3);
		((Student)people1).setBan(1);
		((Student)people1).setNo(15);
		
		System.out.println(people1);
		
		People people2 = new Student("s001","김학생","남자",13,3,1,1);
		People people3 = new Student("s002","김학생2","여자",13,3,1,2);
		People people4 = new Student("s003","김학생3","남자",13,3,1,3);
		
		People people5 = new Teacher("t001", "이선생", "여자", 41, Teacher.OPERATE_TYPE_A,Teacher.MANAGE_TYPE_A);
		People people6 = new Teacher("t002", "이선생", "여자", 41, Teacher.OPERATE_TYPE_B,Teacher.MANAGE_TYPE_A);
		
		manager.insert(people1);
		manager.insert(people2);
		manager.insert(people3);
		manager.insert(people4);
		manager.insert(people5);
		manager.insert(people6);
		
		manager.printPeopleList();
		
		People paramPeople=new People();
		paramPeople.setPeopleId("s001");
		
		int deleteCnt=manager.delete(paramPeople);
		System.out.println("deleteCnt : "+deleteCnt);
		
		manager.printPeopleList();
		
		People people7 = new Teacher("t002", "이선생", "여자", 41, Teacher.OPERATE_TYPE_B,Teacher.MANAGE_TYPE_A);
	
		manager.insert(people7); //같은 id는 안들어가게
	}
}
