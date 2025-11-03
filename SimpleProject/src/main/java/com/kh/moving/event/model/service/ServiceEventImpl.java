package com.kh.moving.event.model.service;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import com.kh.moving.event.model.dao.EventDAO;
import com.kh.moving.event.model.dto.EventDTO;
import com.kh.moving.exception.AuthenticationException;
import com.kh.moving.exception.InvalidArgumentsException;
import com.kh.moving.member.model.dto.MemberDTO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@Service
public class ServiceEventImpl implements ServiceEvent {
	
	private final EventDAO eventDao;
	
	/**
	 * 매니저 권한 검증
	 */
	private void validateManager(EventDTO event, HttpSession session) {
		MemberDTO loginMember = (MemberDTO) session.getAttribute("loginMember");
		
		if (loginMember == null || !"Y".equals(loginMember.getManager())) {
			throw new AuthenticationException("권한 없는 접근입니다.");
		}
	}
	
	/**
	 * 이벤트 내용 검증
	 */
	private void validateContent(EventDTO event) {
		if (event.getEventTitle() == null || event.getEventTitle().trim().isEmpty() ||
		    event.getDescription() == null || event.getDescription().trim().isEmpty()) {
			throw new InvalidArgumentsException("유효하지 않는 요청입니다.");
		}
	}
	
	/**
	 * 파일명 생성
	 */
	private String generateFileName(String originalFilename) {
		StringBuilder sb = new StringBuilder();
		sb.append("Event_");
		
		// 현재 시간 추가
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		sb.append(currentTime);
		sb.append("_");
		
		// 난수 추가 (100~999)
		int num = (int)(Math.random() * 900) + 100;
		sb.append(num);
		
		// 확장자 추가
		String ext = originalFilename.substring(originalFilename.lastIndexOf("."));
		sb.append(ext);
		
		return sb.toString();
	}
	
	/**
	 * 파일 저장
	 */
	private void uploadFile(MultipartFile file, HttpSession session, String newFileName) {
		try {
			// 저장 경로 설정
			ServletContext application = session.getServletContext();
			String savePath = application.getRealPath("/resources/file/");
			
			// 디렉토리 생성 (없으면)
			File directory = new File(savePath);
			if (!directory.exists()) {
				directory.mkdirs();
				log.info("디렉토리 생성: {}", savePath);
			}
			
			// 파일 저장
			File saveFile = new File(savePath + newFileName);
			file.transferTo(saveFile);
			log.info("파일 저장 성공: {}", saveFile.getAbsolutePath());
			
		} catch (Exception e) {
			log.error("파일 저장 실패", e);
			throw new RuntimeException("파일 업로드 실패", e);
		}
	}
	
	/**
	 * 이벤트 저장 (파일 처리 포함)
	 */
	@Override
	public int save(EventDTO event, MultipartFile file, HttpSession session) {
		try {
			// 1. 권한 검증
			validateManager(event, session);
			log.info("권한 검증 완료");
			
			// 2. 유효성 검증
			validateContent(event);
			log.info("유효성 검증 완료");
			
			// 3. 파일 처리
			if (file != null && !file.isEmpty()) {
				log.info("파일 업로드 시작: {}", file.getOriginalFilename());
				
				// 새 파일명 생성
				String newFileName = generateFileName(file.getOriginalFilename());
				
				// 파일 저장
				uploadFile(file, session, newFileName);
				
				// EventDTO에 파일 정보 설정
				event.setOriginName(file.getOriginalFilename());
				event.setChangeName("/resources/file/" + newFileName);
				
				log.info("파일 정보 설정 완료");
			} else {
				log.info("파일 없이 저장");
				// 파일 없으면 파일 정보를 설정하지 않음 (NULL 유지)
			}
			
			// 4. DB에 저장
			int result = eventDao.save(event);
			log.info("이벤트 저장 결과: {}", result);
			
			return result;
			
		} catch (AuthenticationException | InvalidArgumentsException e) {
			log.warn("검증 실패: {}", e.getMessage());
			throw e;
		} catch (Exception e) {
			log.error("이벤트 저장 중 예상치 못한 에러 발생", e);
			throw new RuntimeException("이벤트 저장 실패", e);
		}
	}
}


// ========================================
// 원본 코드의 문제점 및 개선사항
// ========================================

/*
❌ 원본 코드의 문제점:

1. null 체크 부족
   if(!file.getOriginalFilename().isEmpty())
   → file이 null이면 NullPointerException 발생
   ✅ 개선: if (file != null && !file.isEmpty())

2. 시간 형식 순서
   sb.append("Event_");
   sb.append("_");        ← 이상한 순서
   sb.append(currentTime);
   ✅ 개선: Event_ + currentTime + _ + 난수 + 확장자

3. 파일 없을 때 처리
   else {
       return 1;  ← 무조건 성공으로 반환? 
   }
   ✅ 개선: 파일이 없어도 이벤트는 저장되도록

4. 에러 처리 부족
   e.printStackTrace();  ← 단순히 출력만 함
   ✅ 개선: throw 해서 상위에서 처리

5. 메서드 분리 부족
   ✅ 개선: 메서드 분리 (파일명 생성, 파일 저장)

6. null 체크 누락
   event.getEventTitle().trim()
   → null이면 NullPointerException
   ✅ 개선: null 체크 후 trim()

7. 디렉토리 생성 없음
   ✅ 개선: 디렉토리 없으면 자동 생성


✅ 개선된 코드의 장점:

1. 안전한 null 체크
2. 파일 있을 때/없을 때 모두 처리
3. 메서드 분리로 가독성 향상
4. 로깅 추가로 디버깅 용이
5. 명확한 에러 처리
6. 디렉토리 자동 생성
*/