package com.javalec.ex03;

public class PageList {
	public static void main(String args[]) {
		
		
		int totalCount = 255;	//DB���� count(*)�� �����;���
		int countList = 10; 	//10���� �Խñ� ����Ʈ
		int totalPage = totalCount / countList;	// �� �������� ��
		int page = 22;	//���� ���̽� �� ������
		int countPage = 10; //1~10 ,11~20, �̷������� ��ư �����Ϸ���
		
		int startPage = ((page - 1) / 10) * 10 + 1; // ��ŸƮ ���� 1~10 �� ��� 1, 11~20�� ��� 11
		int endPage = startPage + countPage - 1;	// ������ ���� 1~10 �� ��� 10, 11~20�� ��� 20
		
		if (totalCount % countList > 0) {	//totalCount�� ������ �κ� ����¡ +1 �߰� ó��

		    totalPage++;

		}		
		
		if (endPage > totalPage) {	//������ �������� ��ü ������ ���� Ŭ�� ó��

		    endPage = totalPage;

		}
		for (int iCount = startPage; iCount <= endPage; iCount++) { //1~10 11~20 .... �̺κп� html �;���

		    System.out.print(" " + iCount + " ");

		}
	}

}
