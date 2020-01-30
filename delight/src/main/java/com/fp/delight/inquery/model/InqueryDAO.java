package com.fp.delight.inquery.model;

import java.util.List;
import java.util.Map;

public interface InqueryDAO {
	int Inquerywrite(InqueryVO inqueryVo);
	List<InqueryVO> selectNew3(String userid);
	Map<String, Object> selectInqDetail(InqueryVO inqueryVo);
	List<InqueryVO> selectInqueryList(InqueryVO inqueryVo);
	int selectTotalRecord(String userid);
}
