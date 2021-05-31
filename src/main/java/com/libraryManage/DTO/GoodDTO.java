package com.libraryManage.DTO;

import java.sql.*;

public class GoodDTO {
	private int goodID; // 사서 추천 도서 아이디
	private String goodISBN; // 사서 추천 도서 ISBN
	private String goodTitle; // 사서 추천 도서 게시글 제목
	private String goodContent; // 사서 추천 도서 게시글 내용
	private Date goodDate; // 사소 추천 도서 게시글 날짜

	public GoodDTO(int _goodID, String _goodISBN, String _goodTitle, String _goodContent, Date _goodDate) {
		// 대여 도서 데이터 받아올 때
		this.goodID = _goodID;
		this.goodISBN = _goodISBN;
		this.goodTitle = _goodTitle;
		this.goodContent = _goodContent;
		this.goodDate = _goodDate;
	}

	public GoodDTO(String _goodISBN, String _goodTitle, String _goodContent) {
		// 대여 도서 데이터 추가할 때
		this.goodISBN = _goodISBN;
		this.goodTitle = _goodTitle;
		this.goodContent = _goodContent;
	}

	public int getGoodID() {
		return goodID;
	}

	public void setGoodID(int goodID) {
		this.goodID = goodID;
	}

	public String getGoodISBN() {
		return goodISBN;
	}

	public void setGoodISBN(String goodISBN) {
		this.goodISBN = goodISBN;
	}

	public String getGoodTitle() {
		return goodTitle;
	}

	public void setGoodTitle(String goodTitle) {
		this.goodTitle = goodTitle;
	}

	public String getGoodContent() {
		return goodContent;
	}

	public void setGoodContent(String goodContent) {
		this.goodContent = goodContent;
	}

	public Date getGoodDate() {
		return goodDate;
	}

	public void setGoodDate(Date goodDate) {
		this.goodDate = goodDate;
	}
}