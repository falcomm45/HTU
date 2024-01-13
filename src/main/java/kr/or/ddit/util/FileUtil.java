package kr.or.ddit.util;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.or.ddit.mapper.FilesDetailMapper;
import kr.or.ddit.vo.FilesDetailVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import net.coobird.thumbnailator.Thumbnailator;

@Component
@RequiredArgsConstructor
@Slf4j
public class FileUtil {
	
	@Autowired
	private FilesDetailMapper fileDetailMapper;

	//root-context.xml에 bean으로 등록되어있음
	@Autowired
	private String uploadFolder;

	@Transactional
	public int uploadFile(MultipartFile[] uploadFiles, String fileCd) {

		int result = 0;

		String fileName = "";
		
		log.info("uploadFile->uploadFiles : " + uploadFiles);
		log.info("fileCd : " + fileCd);
		log.info("uploadFiles[0].getOriginalFilename().length() : " + uploadFiles[0].getOriginalFilename().length());
		
		//첨부파일이 있을때만 실행
		if (uploadFiles[0].getOriginalFilename().length() > 0) {
			
			//기존 정보 삭제
			fileDetailMapper.deleteFiles(fileCd);
			
			int cnt = fileDetailMapper.searchFileCd(fileCd);
			
			if (cnt == 0) {
				fileDetailMapper.insertFile(fileCd);
			}
			
			for (MultipartFile multipartFile : uploadFiles) {
				
				File uploadPath = new File(uploadFolder + "/" + getFolderNames());
				
				if (!uploadPath.exists())
					uploadPath.mkdirs();
				
				fileName = UUID.randomUUID().toString() + "_" + multipartFile.getOriginalFilename();
				
				File saveFile = new File(uploadPath, fileName);
				
				try {
					log.info("uploadFile->saveFile : " + saveFile);
					multipartFile.transferTo(saveFile);
					
					FilesDetailVO fileDetailVO = new FilesDetailVO();
					fileDetailVO.setFileCd(fileCd);
					fileDetailVO.setFileSn(0);
					fileDetailVO.setFilePath(saveFile.toString());
					fileDetailVO.setFileOrnm(multipartFile.getOriginalFilename());
					// 유빈 파일 업로드
					fileDetailVO.setFileSvnm(getFolderNames() + "/" + fileName);
					fileDetailVO.setFileCon("content");
					fileDetailVO.setFileSize(Integer.parseInt(String.valueOf(multipartFile.getSize())));
					fileDetailVO.setFileExtsn(fileName.substring(fileName.lastIndexOf(".") + 1));
					//파일테이블에 insert
					result += fileDetailMapper.insertFilesDetail(fileDetailVO);
					if (fileDetailVO.getFileExtsn().equals("jpg") || fileDetailVO.getFileExtsn().equals("png")) {
						if (checkImageType(saveFile)) {
							
							FileOutputStream thumbnail = new FileOutputStream(new File(uploadPath + "/s_" + fileName));
							
							Thumbnailator.createThumbnail(multipartFile.getInputStream(), thumbnail, 100, 100);
							thumbnail.close();
						}
					}
					
				} catch (IllegalStateException | IOException e) {
					log.error(e.getMessage());
				}
			}
		}

		return result;
	}
	
	
	public Map<String, Object> uploadCkEditor(MultipartHttpServletRequest request) throws Exception {
		
		MultipartFile uploadFile = request.getFile("upload");
		log.info("uploadFile : " + uploadFile);
		
		File uploadPath = new File(uploadFolder + "/" + getFolderNames());
		
		if (!uploadPath.exists()) uploadPath.mkdirs();
		
		// 파일의 오리지널 네임
		String originalFileName = uploadFile.getOriginalFilename();
		log.info("originalFileName : " + originalFileName);

        // 파일의 확장자
	    String ext = originalFileName.substring(originalFileName.indexOf("."));
	    log.info("ext : " + ext);

		// 서버에 저장될 때 중복된 파일 이름인 경우를 방지하기 위해 UUID에 확장자를 붙여 새로운 파일 이름을 생성
		String newFileName = UUID.randomUUID() + ext;

		// 이미지를 현재 경로와 연관된 파일에 저장하기 위해 현재 경로를 알아냄
		// String realPath = request.getServletContext().getRealPath("/");
		String url = request.getRequestURL().toString();
		url = url.substring(0, url.indexOf("/", 7));
		log.info("url : " + url);

		// 현재경로/upload/파일명이 저장 경로
		String savePath = uploadPath + "/" + newFileName;
		log.info("savePath : " + savePath);

		// 브라우저에서 이미지 불러올 때 절대 경로로 불러오면 보안의 위험 있어 상대경로를 쓰거나 이미지 불러오는 jsp 또는 클래스 파일을 만들어
		// 가져오는 식으로 우회해야 함
		// 때문에 savePath와 별개로 상대 경로인 uploadPath 만들어줌
		String uploadPath2 = "/resources/upload/" + getFolderNames() + "/" + newFileName;
		log.info("uploadPath : " + uploadPath2);
		
		// 저장 경로로 파일 객체 생성
		File file = new File(savePath);

		// 파일 업로드
		uploadFile.transferTo(file);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("uploaded", true);
		map.put("url", url + uploadPath2);
		log.info("map : " + map);

		return map;
	}
	
	
	public boolean checkImageType(File saveFile) {

		String contentType = "";

		try {
			contentType = Files.probeContentType(saveFile.toPath());
			return contentType.startsWith("image");
		} catch (IOException e) {
			log.error(e.getMessage());
		}
		return false;
	}

	public String getFolderNames() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
		return sdf.format(new Date());
	}

	// 파일 사용
	public int updateFileUsed(String fileCd) {
		int result = this.fileDetailMapper.updateFileUsed(fileCd);
		return result;
	}

	public int deleteFileUpdate(String fileCd, int fileSn) {
		int result = this.fileDetailMapper.deleteFileUpdate(fileCd, fileSn);
		return result;
	}

}
