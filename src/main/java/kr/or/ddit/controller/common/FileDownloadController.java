package kr.or.ddit.controller.common;

import java.io.UnsupportedEncodingException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class FileDownloadController{
	
	@Autowired
	private String uploadFolder;
//	<a href="/download?fileName=/${vo.fileSvnm}" >다운로드 ${vo.fileOrnm}</a> 형식으로 눌럿을때 다운로드 가능
	// 없어도됨 <a href="/resources/upload/${vo.fileSvnm}" download>파일이름</a> 으로 다운가능
	@RequestMapping(value = "/download", produces = MediaType.APPLICATION_OCTET_STREAM_VALUE)
	public ResponseEntity<Resource> downloadFile(String fileName) {
	    Resource resource = new FileSystemResource(this.uploadFolder + fileName);

	    HttpHeaders headers = new HttpHeaders();
	    
	    try {
	        headers.add("Content-Disposition",
	                "attachment;filename=" + new String(resource.getFilename().getBytes("UTF-8"), "ISO-8859-1"));
	    } catch (UnsupportedEncodingException e) {
	        log.error(e.getMessage());
	    }

	    return new ResponseEntity<Resource>(resource, headers, HttpStatus.OK);
	}
	
	
}
