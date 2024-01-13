package kr.or.ddit.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;
import lombok.Setter;

@Getter
@Setter
@ToString
@NoArgsConstructor
public class WishLectureVO {
	
	private String stuCd;
	
	private String lecCd;
	
	public WishLectureVO(String stuCd, String lecCd) {
		this.stuCd = stuCd;
		this.lecCd = lecCd;
		
	}
	
}
