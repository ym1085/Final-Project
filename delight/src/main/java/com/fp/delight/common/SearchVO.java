package com.fp.delight.common;


/**
 * 검색 정보를 담고있는 Bean
 * 페이징 처리 관련 변수 포함
*/

public class SearchVO {
	/** 검색조건 */
	private String searchCondition = "";
	
	/** 검색키워드 */
	private String searchKeyword = "";
	
	/** 검색조건 */
	private String searchCondition2 = "";
	
	/** 검색키워드 */
	private String searchKeyword2 = "";
    
	/** 검색 사용여부 */
	private String searchUseYn = "";
	
	/** 현재 페이지 */
	private int currentPage = 1;
	
	private int currentPage2 = 1;
    
    /**블럭당 보여질 페이지 수,  페이지 사이즈 */
    private int blockSize; // properties에서 설정
    
    /** 시작 인덱스 */
    private int firstRecordIndex = 1;
    
    /** 끝 인덱스 */
    private int lastRecordIndex = 1;
    
    /**페이지 별 레코드 갯수 (pageSize) */
    private int recordCountPerPage; 
    
   /**
     * 검색 조건을  설정한다.
     * @param bean 검색조건
     */
    public void setSearchVO(SearchVO bean){
    	this.currentPage = bean.currentPage;
    	this.searchCondition = bean.getSearchCondition();
    	this.searchCondition2=bean.getSearchCondition2();
    	this.searchKeyword = bean.getSearchKeyword();
    	this.searchKeyword2=bean.getSearchKeyword2();
    	this.searchUseYn = bean.getSearchUseYn();
    	this.blockSize = bean.blockSize;
    	this.firstRecordIndex = bean.firstRecordIndex;
    	this.lastRecordIndex = bean.lastRecordIndex;
    	this.recordCountPerPage = bean.recordCountPerPage;
    	
    }

    public String getSearchCondition() {
    	return searchCondition;
    }

    public void setSearchCondition(String searchCondition) {
    	this.searchCondition = searchCondition;
    }

    public String getSearchKeyword() {
    	return searchKeyword;
    }

    public void setSearchKeyword(String searchKeyword) {
    	this.searchKeyword = searchKeyword;
    }

    public String getSearchUseYn() {
    	return searchUseYn;
    }

    public void setSearchUseYn(String searchUseYn) {
    	this.searchUseYn = searchUseYn;
    }

    public int getCurrentPage() {
    	return currentPage;
    }

    public void setCurrentPage(int currentPage) {
    	this.currentPage = currentPage;
    }

    public int getBlockSize() {
    	return blockSize;
    }

    public void setBlockSize(int blockSize) {
    	this.blockSize = blockSize;
    }

    public int getFirstRecordIndex() {
    	return firstRecordIndex;
    }

    public void setFirstRecordIndex(int firstRecordIndex) {
    	this.firstRecordIndex = firstRecordIndex;
    }

    public int getLastRecordIndex() {
    	return lastRecordIndex;
    }

    public void setLastRecordIndex(int lastRecordIndex) {
    	this.lastRecordIndex = lastRecordIndex;
    }

    
	public int getRecordCountPerPage() {
		return recordCountPerPage;
	}

	public void setRecordCountPerPage(int recordCountPerPage) {
		this.recordCountPerPage = recordCountPerPage;
	}
	
	

	public String getSearchCondition2() {
		return searchCondition2;
	}

	public void setSearchCondition2(String searchCondition2) {
		this.searchCondition2 = searchCondition2;
	}

	public String getSearchKeyword2() {
		return searchKeyword2;
	}

	public void setSearchKeyword2(String searchKeyword2) {
		this.searchKeyword2 = searchKeyword2;
	}

	
	
	public int getCurrentPage2() {
		return currentPage2;
	}

	public void setCurrentPage2(int currentPage2) {
		this.currentPage2 = currentPage2;
	}

	@Override
	public String toString() {
		return "SearchVO [searchCondition=" + searchCondition + ", searchKeyword=" + searchKeyword
				+ ", searchCondition2=" + searchCondition2 + ", searchKeyword2=" + searchKeyword2 + ", searchUseYn="
				+ searchUseYn + ", currentPage=" + currentPage + ", currentPage2=" + currentPage2 + ", blockSize="
				+ blockSize + ", firstRecordIndex=" + firstRecordIndex + ", lastRecordIndex=" + lastRecordIndex
				+ ", recordCountPerPage=" + recordCountPerPage + "]";
	}



	
}
 