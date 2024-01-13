package kr.or.ddit.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class EmployeeVO {
	private String empCd;
	private String empDept;
	private String empPos;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date empJoin;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date empQuit;
	
	
}
