package com.javalec.ex03;

public class PageList {
	public static void main(String args[]) {
		
		
		int totalCount = 255;	//DB에서 count(*)로 가져와야함
		int countList = 10; 	//10개의 게시글 리스트
		int totalPage = totalCount / countList;	// 총 페이지의 수
		int page = 22;	//내가 초이스 한 페이지
		int countPage = 10; //1~10 ,11~20, 이런식으로 버튼 생성하려함
		
		int startPage = ((page - 1) / 10) * 10 + 1; // 스타트 지점 1~10 은 모두 1, 11~20은 모두 11
		int endPage = startPage + countPage - 1;	// 끝나는 지점 1~10 은 모두 10, 11~20은 모두 20
		
		if (totalCount % countList > 0) {	//totalCount의 자투리 부분 페이징 +1 추가 처리

		    totalPage++;

		}		
		
		if (endPage > totalPage) {	//끝나는 페이지가 전체 페이지 보다 클떄 처리

		    endPage = totalPage;

		}
		for (int iCount = startPage; iCount <= endPage; iCount++) { //1~10 11~20 .... 이부분에 html 와야함

		    System.out.print(" " + iCount + " ");

		}
	}

}
