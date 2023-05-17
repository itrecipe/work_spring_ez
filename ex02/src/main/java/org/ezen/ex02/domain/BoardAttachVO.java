package org.ezen.ex02.domain;

import lombok.Data;

@Data
//tbl_attach 테이블과 매핑되는 VO 클래스
public class BoardAttachVO {
	
	private String uuid;
	private String uploadPath; //YYYY/MM/DD
	private String fileName;	
	private boolean fileType; //image는 true 아닌것은 false
	
	private Long bno;
}