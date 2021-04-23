package com.example.demo.utils;
/*
 	페이징은 여러군대에서 사용되기때문에 페이징 관련된 기능을 별도의 클래스로 분리해서 만듬 
 */
public class Pagination {

	private int page; // 현재 페이지 번호
	private int perPageNum; // 한 페이지당 보여줄 동영상 게시글 개수 
	
	// 현재 페이지의 게시글 시작 번호를 얻는 공식 
	// ex) 현재 페이지 번호(2) - 1 * 페이지당 보여줄 게시글 갯수(5) -> 5(2번째 페이지에서는 5번째 행부터 5,6,7,8,9 총 5개의 게시물을 출력할 수 있음)
	public int getPageStart() {
		return (this.page-1)*perPageNum;
	}
	
	// 최초로 동영상 카테고리 게시판에 들어왔을 떄 기본 셋팅 
	public Pagination() {
		this.perPageNum = 5; 
		this.page = 1;
	}
	
	public int getPage() {
        return page;
    }
	
    public void setPage(int page) {
        if(page <= 0) {
            this.page = 1;
        } else {
            this.page = page;
        }
    }
	
	public int getPerPageNum() {
		return this.perPageNum;
	}
	
	public void setPerPageNum(int pageSize) {
		this.perPageNum = pageSize;
	}
	
	
}





















