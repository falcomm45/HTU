package kr.or.ddit.service.employee.impl;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.mapper.CommonMapper;
import kr.or.ddit.mapper.DepartmentMapper;
import kr.or.ddit.mapper.StuAdminMapper;
import kr.or.ddit.service.employee.StuAdminService;
import kr.or.ddit.util.EtcUtil;
import kr.or.ddit.util.FileUtil;
import kr.or.ddit.vo.DepartmentVO;
import kr.or.ddit.vo.OrganizationChartVO;
import kr.or.ddit.vo.RecordVO;
import kr.or.ddit.vo.StudentVO;
import kr.or.ddit.vo.UserVO;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class StuAdminServiceImpl implements StuAdminService {

	@Autowired
	private StuAdminMapper stuAdminMapper;
	
	@Autowired
	private DepartmentMapper departmentMapper;
	
	@Autowired
	private CommonMapper commonMapper;

	@Autowired
	private FileUtil fileUtil;
	
	@Autowired
	private PasswordEncoder passwordEncoder;

	@Override
	public List<StudentVO> stuinfolist() {
		List<StudentVO> stuList = this.stuAdminMapper.stuinfolist();
		for (StudentVO stu : stuList) {
			stu.setFormAddt(EtcUtil.formDate(stu.getStuAddt()));
			if (stu.getStuGrdt() != null)
				stu.setFormGrdt(EtcUtil.formDate(stu.getStuGrdt()));
		}
		return stuList;
	}

	@Override
	public StudentVO stuinfodetail(String stuCd) {
		return this.stuAdminMapper.stuinfodetail(stuCd);
	}

	@Override
	public List<OrganizationChartVO> chartList() {
		return this.stuAdminMapper.chartList();
	}

	@Override
	public List<StudentVO> coldetail(String organizationCode) {
		List<StudentVO> stuList = this.stuAdminMapper.coldetail(organizationCode);
		for (StudentVO stu : stuList) {
			stu.setFormAddt(EtcUtil.formDate(stu.getStuAddt()));
			if (stu.getStuGrdt() != null)
				stu.setFormGrdt(EtcUtil.formDate(stu.getStuGrdt()));
		}
		return stuList;
	}

	@Override
	public List<StudentVO> deptdetail(String organizationCode) {
		List<StudentVO> stuList = this.stuAdminMapper.deptdetail(organizationCode);
		for (StudentVO stu : stuList) {
			stu.setFormAddt(EtcUtil.formDate(stu.getStuAddt()));
			if (stu.getStuGrdt() != null)
				stu.setFormGrdt(EtcUtil.formDate(stu.getStuGrdt()));
		}
		return stuList;
	}

	@Override
	public int update(UserVO userVO) {
		int cnt = this.stuAdminMapper.updateuser(userVO);

		StudentVO studentVO = userVO.getStudentVO();
		studentVO.setStuCd(userVO.getUserCd());
		cnt += this.stuAdminMapper.updatestu(studentVO);

		return cnt;
	}

	@Override
	public List<DepartmentVO> deptList() {
		return this.stuAdminMapper.deptList();
	}

	@Override
	public int upload(UserVO userVO) {
		int result = this.stuAdminMapper.usedupdate(userVO.getUserCd());

		result += fileUtil.uploadFile(userVO.getUploadFiles(), userVO.getUserCd());

		return result;
	}

	@Override
	public StudentVO excelUpload(MultipartFile file) {
		
		if (!file.getOriginalFilename().endsWith(".xlsx")) {
			return null;
		}
		
		List<Map<String, Object>> mapList = new ArrayList<Map<String,Object>>();
		
		try {
			XSSFWorkbook workbook = new XSSFWorkbook(file.getInputStream());
			XSSFSheet sheet = workbook.getSheetAt(0);
			XSSFRow row = null;
			XSSFCell cell = null;

			List<String> categoryList = new ArrayList<String>();

			log.info("rowNum ==> {}", sheet.getLastRowNum());
			
			for (int i = 0; i < sheet.getLastRowNum() + 1; i++) {
				
				Map<String, Object> map = new HashMap<String, Object>();
				
				row = sheet.getRow(i);
				
				log.info("cellNum ==> {}",row.getLastCellNum());
				
				for (int j = 0; j < row.getLastCellNum(); j++) {
					
					cell = row.getCell(j);
					if (cell == null)
						continue;

					if (i == 0) {
						categoryList.add(j, cell.getStringCellValue());
						continue;
					} else {
						switch (cell.getCellType()) {
						case NUMERIC:
							int numericCellValue = (int) cell.getNumericCellValue();
							map.put(categoryList.get(j), numericCellValue);
							break;
						case STRING:
							String StringCellValue = cell.getStringCellValue();
							map.put(categoryList.get(j), StringCellValue);
							break;
						default:
							break;
						}
					}
				}
				if (!map.isEmpty()) {
					mapList.add(map);
				}
			}
		} catch (IOException e) {
			log.error(e.getMessage());
		}
		log.info("JYB ==> {}", mapList);
		
		log.info("size ==> {}", mapList.size());
		
		List<UserVO> userList = new ArrayList<UserVO>();
		List<StudentVO> studentList = new ArrayList<StudentVO>();
		
		int sum = 1;
		
		for (Map<String, Object> map : mapList) {
			
			UserVO userVO = new UserVO();
			StudentVO studentVO = new StudentVO();
			
			map.forEach((key, value) -> {
				if (key.equals("이름"	)) 				userVO.setUserNm((String)value);
				else if (key.equals("영문이름")) 		userVO.setUserNme((String)value);
				else if (key.equals("전화번호")) 		userVO.setUserTel((String)value);
				else if (key.equals("우편번호")) 		userVO.setUserZip(Integer.parseInt((String)value));
				else if (key.equals("주소")) 			userVO.setUserAddr1((String)value);
				else if (key.equals("상세주소")) 		userVO.setUserAddr2((String)value);
				else if (key.equals("주민등록번호1")) 	userVO.setUserReg1((String)value);
				else if (key.equals("주민등록번호2")) 	userVO.setUserReg2((String)value);
				else if (key.equals("이메일")) 		userVO.setUserMail((String)value);
				else if (key.equals("은행")) 			userVO.setUserBank((String)value);
				else if (key.equals("예금주")) 		userVO.setUserDepo((String)value);
				else if (key.equals("계좌번호")) 		userVO.setUserAcc((String)value);
				else if (key.equals("학년")) 			studentVO.setStuYear((int)value);
				else if (key.equals("학기")) 			studentVO.setStuSem((int)value);
				else if (key.equals("학과명")) {
					DepartmentVO departmentVO = this.departmentMapper.getDepCdByDepNm((String)value);
					studentVO.setStuCd(departmentVO.getColCd());
					studentVO.setDepCd(departmentVO.getDepCd());
				} else if (key.equals("학적")) {
					String rcdCd = this.commonMapper.getRecordCd((String)value);
					studentVO.setComdCd(rcdCd);
				}
			});
			
			String year = new SimpleDateFormat("yy").format(new Date());
			String colNo = studentVO.getStuCd().substring(5);
			String depNo = studentVO.getDepCd().substring(6);
			Map<String, String> paramMap = new HashMap<String, String>();
			paramMap.put("depCd", studentVO.getDepCd());
			paramMap.put("year", year);
			int cnt = this.stuAdminMapper.cntDepStu(paramMap) + sum;
			String strCnt = String.format("%03d", cnt);
			String userCd = year + colNo + depNo + strCnt;
			
			userVO.setUserCd(userCd);
			userVO.setComdCd("USER01");
			userVO.setUserPass(this.passwordEncoder.encode(userVO.getUserReg1()));
			
			
			studentVO.setStuCd(userCd);
			
//			log.info("userVO ==> {}\nstudentVO ==> {}", userVO, studentVO);
			
			studentList.add(studentVO);
			userList.add(userVO);
			sum++;
		}
		
		int cnt = this.stuAdminMapper.insertUserList(userList);
		cnt += this.stuAdminMapper.insertStudentList(studentList);
		
		if (cnt > 0) {
			StudentVO studentVO = studentList.get(0);
			studentVO.setStuCoc(cnt);
			return studentVO;
		}
		
		return null;
		
	}

	@Override
	public int registStudent(Map<String, Object> paramMap) {
		
		UserVO userVO = (UserVO)paramMap.get("userVO");
		StudentVO studentVO = userVO.getStudentVO();
		String year = new SimpleDateFormat("yy").format(new Date());
		String colNo = studentVO.getDepCd().substring(5,6);
		String depNo = studentVO.getDepCd().substring(6);
		Map<String, String> paramMap2 = new HashMap<String, String>();
		paramMap2.put("depCd", studentVO.getDepCd());
		paramMap2.put("year", year);
		log.info("depCd ==> {}, year ==> {}", studentVO.getDepCd(), year);
		int no = this.stuAdminMapper.cntDepStu(paramMap2) + 1;
		String strCnt = String.format("%03d", no);
		String userCd = year + colNo + depNo + strCnt;
		userVO.setUserCd(userCd);
		userVO.setUserPass(this.passwordEncoder.encode(userVO.getUserReg1()));
		userVO.setComdCd("USER01");
		studentVO.setStuCd(userCd);
		studentVO.setComdCd("RECD01");
		
		int cnt = this.stuAdminMapper.insertUser(userVO);
		cnt += this.stuAdminMapper.insertStudent(studentVO);
		
		if (cnt > 1) {
			cnt += this.fileUtil.uploadFile((MultipartFile[])paramMap.get("file"), userCd);
		}
		
		return cnt;
	}

	@Override
	public List<RecordVO> recordAdminList() {
		return this.stuAdminMapper.recordAdminList();
	}
	//학생학적정보 승인시 승인테이블 업데이트
	@Override
	public int recordUpdate(RecordVO recordVO) {
		return this.stuAdminMapper.recordUpdate(recordVO);
	}
	
	//학생학적정보 승인시 같이 업데이트 되는 항목 -> 완료되면 학생의 학적상태가 변경된다.
	@Override
	public int stuStatusUpdate(RecordVO recordVO) {
		return this.stuAdminMapper.stuStatusUpdate(recordVO);
	}
}
