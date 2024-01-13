package kr.or.ddit.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
public class RoomVO {
	
	private String 	roomCd; // 호실코드
	
	private String 	bldCd;	// 빌딩코드
	
	private String 	roomPur; // 호실목적
	
	private int 	roomCap; // 수용인원
	
	private String 	roomTel; // 호실전화번호
	
	private String 	roomNm; // 호실이름
	
	private BuildingVO buildingVO;
	
}
