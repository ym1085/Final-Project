package com.fp.delight.admin.userManagemet.model;

import java.util.List;
import java.util.Map;

import com.fp.delight.common.SearchVO;

public interface InqAnwDAO {
	List<Map<String, Object>> adminInqSel(SearchVO searchVo);
	int adminInqSelTotal(SearchVO searchVo);
	Map<String, Object> inqDetail(int inqSeq);
	int anwCompl(int inqSeq);
	int inqanwWrite(InqAnwVO inqAnwVo);
	int anwCk(int inqSeq);
	
}
