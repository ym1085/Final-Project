package com.fp.delight.inquery.model;

import java.util.List;
import java.util.Map;

public interface InqueryService {
	int Inquerywrite(InqueryVO inqueryVo);
	List<InqueryVO> selectNew3(String userid);
	Map<String, Object> selectInqDetail(InqueryVO inqueryVo);
}
