package com.kh.moving.utll;

import org.springframework.stereotype.Component;

@Component //클래스를 빈으로 등록하는것이다. 즉 spring제어하게 만드는 것객체를 생성안해도됨 
public class Pagenation {

	public PageInfo getPageInfo(int listCount
							  , int currentPage
							  , int boardLimit
							  , int pageLimit) {
		int maxPage = (int)Math.ceil((double)listCount/ boardLimit);
		int startPage =(currentPage-1)/pageLimit*pageLimit +1;
		int endPage =startPage + pageLimit -1 ;
		if(endPage>maxPage) endPage = maxPage;
		return new PageInfo(listCount,currentPage,boardLimit,pageLimit,maxPage,
				startPage,endPage);
	}
		
}
