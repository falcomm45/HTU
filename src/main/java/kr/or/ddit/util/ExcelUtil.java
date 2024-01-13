package kr.or.ddit.util;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.poi.hssf.usermodel.HSSFDateUtil;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellType;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.stereotype.Component;

import kr.or.ddit.vo.ExcelVO;
import lombok.extern.slf4j.Slf4j;

@Component
@Slf4j
public class ExcelUtil {

	/**
	 * 엑셀 파일을 읽어서 Workbook 객체로 return
	 * 
	 * @param filePath
	 * @return
	 */
	public Workbook getWorkBook(String filePath) {

		FileInputStream fis = null;

		try {
			fis = new FileInputStream(filePath);
		} catch (FileNotFoundException e) {
			log.error(e.getMessage());
		}

		Workbook wb = null;

		if (filePath.toUpperCase().endsWith(".XLSL")) {
			try {
				wb = new XSSFWorkbook(fis);
			} catch (IOException e) {
				log.error(e.getMessage());
			}
		}
		if (fis != null) {
			try {
				fis.close();
			} catch (IOException e) {
				log.error(e.getMessage());
			}
		}
		return wb;
	}

	public List<Map<String, String>> readExcel(ExcelVO excelVO) {
		List<Map<String, String>> result = null;
		if (excelVO != null) {

			Workbook wb = this.getWorkBook(excelVO.getFilePath());
			int sheetNum = wb.getNumberOfSheets();
			Row row = null;
			Cell cell = null;
			String cellName = "";
			int numOfCells = 0;

			// 각 row 마다의 값을 저장할 맵 객체
			Map<String, String> map = null;

			result = new ArrayList<Map<String, String>>();

			for (int i = 0; i < sheetNum; i++) {
				log.info("SheetName ==> {}", wb.getSheetName(i));
				Sheet sheet = wb.getSheetAt(i);

				// sheet 에서의 유효한 행의 갯수
				int numOfRows = sheet.getLastRowNum() + 1;

				if (numOfRows <= 1) {
					map = new HashMap<String, String>();
					map.put("errorMessage", "읽을 행 없음");
					result.add(map);
					return result;
				}

				// 각 각의 row 를 반복
				for (int j = excelVO.getStartRow() - 1; j < numOfRows; j++) {

					row = sheet.getRow(j);

					// sheet.getRow(j).getCell(2) : cell(2) (= 3번째 컬럼값)이 null 인 경우 if문 빠져나온다?
					if (sheet.getRow(j).getCell(2) != null && row != null) {

						// 가져온 row 의 cell 의 갯수
						numOfCells = row.getLastCellNum();

						map = new HashMap<String, String>();

						for (int k = 0; k < numOfCells; k++) {
							cell = row.getCell(k);

							if (cell == null)
								continue;
							else {

								switch (cell.getCellType()) {
								case NUMERIC:
									if (HSSFDateUtil.isCellDateFormatted(cell)) {
										SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
										cell.setCellValue(sdf.format(cell.getDateCellValue()));
									} else {
										if ((cell.getNumericCellValue() + "").contains(".0")) {
											cell.setCellValue((int) cell.getNumericCellValue() + "");
										} else {
											cell.setCellValue((float) cell.getNumericCellValue() + "");
										}
									}
									break;

								case STRING:
									cell.setCellType(CellType.STRING);	
								default:
									break;
								}

							}
						}

					}

				}
			}

		}
		return result;
	}

}
