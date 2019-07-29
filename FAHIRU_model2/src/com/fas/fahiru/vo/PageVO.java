package com.fas.fahiru.vo;

public class PageVO {

	private int start, end, no, categoryNo, postNo, replyNo, pageNo, numPage;
	private String searchWord, name, type;
	//	0709 서승현 name,type 추가
	
	
	public PageVO(int pageNo, int numPage) {
		end = pageNo * numPage;
		start = end - numPage + 1;
	}

	public PageVO(int pageNo, int numPage, int no) {
		end = pageNo * numPage;
		start = end - numPage + 1;
		this.no = no;
	}

	public PageVO(int pageNo, int numPage, String searchWord) {
		end = pageNo * numPage;
		start = end - numPage + 1;
		this.searchWord = '%' + searchWord + '%';
	}

	public PageVO(int pageNo, int numPage, int no, int postNo) {
		end = pageNo * numPage;
		start = end - numPage + 1;
		this.no = no;
		this.postNo = postNo;
	}

	public PageVO(int pageNo, int numPage, int no, int categoryNo, int postNo, int replyNo) {
		end = pageNo * numPage;
		start = end - numPage + 1;
		this.no = no;
		this.categoryNo = categoryNo;
		this.postNo = postNo;
		this.replyNo = replyNo;
	}
	
	public PageVO(int pageNo, int numPage,String name, String type) {
		end = pageNo*numPage;
		start = end-numPage+1;
		this.name = "%"+name+"%";
		this.type = type;
	}

	
	
	
	public int getNumPage() {
		return numPage;
	}

	public void setNumPage(int numPage) {
		this.numPage = numPage;
	}

	public int getPageNo() {
		return pageNo;
	}

	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getSearchWord() {
		return searchWord;
	}

	public void setSearchWord(String searchWord) {
		this.searchWord = '%' + searchWord + '%';
	}

	public int getCategoryNo() {
		return categoryNo;
	}

	public void setCategoryNo(int categoryNo) {
		this.categoryNo = categoryNo;
	}

	public int getPostNo() {
		return postNo;
	}

	public void setPostNo(int postNo) {
		this.postNo = postNo;
	}

	public int getReplyNo() {
		return replyNo;
	}

	public void setReplyNo(int replyNo) {
		this.replyNo = replyNo;
	}

	public PageVO() {
		// TODO Auto-generated constructor stub
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public int getEnd() {
		return end;
	}

	public void setEnd(int end) {
		this.end = end;
	}

}
