package com.example.demo.utils;

import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileOutputStream;
import java.util.Iterator;
import java.util.Map;
import java.util.UUID;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Component("FileUtils")
public class FileUtils {

	//파일이 저장될 위치를 정해줌 
	private static final String filePath = "C:\\videoFileUpload\\";
	
	// 만들어질 썸네일의 가로 세로길이를 정해줌 
	static final int THUMB_WIDTH = 370;
	static final int THUMB_HEIGHT = 246;
	
	public Map<String,Object> parseInsertFileInfo(Map<String,Object> videoFile,HttpServletRequest request) { 
		
		try {
			// 1.HttpServletRequest 이용해 전송된(업로드한) 파일들(썸네일,동영상)을 가져온다 
			MultipartHttpServletRequest MultipartHttpServletRequest = (MultipartHttpServletRequest)request;
			Iterator<String> iterator = MultipartHttpServletRequest.getFileNames();		
			MultipartFile multipartFile = null;
			
			String originalFileName = null; // 올린 파일 이름 
			String originalFileExtension = null; // 확장명 
			String storedFileName = null; // 중복되지 않은 이름으로 저장될 파일명 
			
			// 2.파일을 저장할 경로에 해당폴더가 없으면 폴더를 생성함 
			File file = new File(filePath); 
			if(file.exists() == false){ 
				file.mkdirs(); 
			}
			
			// 3.썸네일 파일 + 동영상 파일 업로드 하기 
			while(iterator.hasNext()) {
				multipartFile = MultipartHttpServletRequest.getFile(iterator.next());
	
				System.out.println("파일 이름 : " + multipartFile.getOriginalFilename());
				System.out.println("파일 크기 : " + multipartFile.getSize());
				
				// multipartFile 안에 있는 이름이 "video_file" 경우 지정된 장소에 업로드 
				if(multipartFile.getName().equals("video_File")) {
					originalFileName = multipartFile.getOriginalFilename(); //원본파일의 이름을 받아옴 (exam.png)
					originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf(".")); // 해당원본파일의 확장명을 뽑아냄 (png)  
					storedFileName = "Video" + UUID.randomUUID().toString().replaceAll("-","") + originalFileExtension; // 32자리의 랜덤파일이름 + 확장명 			
	
					file = new File(filePath + storedFileName); // 서버에 실제파일이 저장될 경로와 저장될 파일설정
					multipartFile.transferTo(file); // 업로드한 파일을 지정된 폴더에 저장함  	
					
					videoFile.put("orgin_video_name", originalFileName); // 사용자가 업로드한 원본 동영상 이름
					videoFile.put("stored_video_name", storedFileName); //  중복되지 않은 이름으로 저장될 동영상 파일명	
				}else { // multipartFile 안에 있는 이름이 "video_thumbNail" 경우 지정된 장소에 업로드 
					originalFileName = multipartFile.getOriginalFilename(); //원본파일의 이름을 받아옴 (exam.png)
					originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf(".")); // 해당원본파일의 확장명을 뽑아냄 (png)  
					storedFileName = "Thumb" + UUID.randomUUID().toString().replaceAll("-","") + originalFileExtension; // 32자리의 랜덤파일이름 + 확장명 	
					
					file = new File(filePath + storedFileName); // 서버에 실제파일이 저장될 경로와 저장될 파일설정
					multipartFile.transferTo(file); // 업로드한 파일을 지정된 폴더에 저장함 
					
					//썸네일 이미지 생성 (참고 : https://m.blog.naver.com/PostView.nhn?blogId=heronj&logNo=220627515961&proxyReferer=https:%2F%2Fwww.google.com%2F)
					BufferedImage orginal = ImageIO.read(file);
					BufferedImage thumbnail = new BufferedImage(THUMB_WIDTH,THUMB_HEIGHT,BufferedImage.TYPE_3BYTE_BGR);
					//썸네일 그리기 
					Graphics2D g = thumbnail.createGraphics();
					g.drawImage(orginal,0,0,THUMB_WIDTH,THUMB_HEIGHT,null);
					//파일생성
					FileOutputStream out = new FileOutputStream(filePath+storedFileName);
					ImageIO.write(thumbnail,"jpg",out);
					
					videoFile.put("orgin_video_thumb", originalFileName); // 사용자가 업로드한 원본 썸네일 동영상 이름
					videoFile.put("stored_video_thumb", storedFileName); //  중복되지 않은 이름으로 저장될 썸네일 동영상 파일명
					
					out.flush(); // 파일객체를 다사용하면 연결되어있는 파일 자원들을 끊어줌 										
				}
				
			}
		}catch (Exception e) {
			e.printStackTrace();
			System.out.println("파일을 업로드하는 도중 에러 발생 ... " + e.getMessage());
		}		
		
		return videoFile; 
		
	}
	
}
