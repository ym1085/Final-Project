package com.fp.delight.admin.userManagemet.model;

import java.util.List;

import com.fp.delight.mypage.model.GradeVO;

public interface GradeManagerService {
	List<GradeVO> gradeList();
	GradeVO gradeBySeqSel(int gradeSeq);
	int gradeEdit(GradeVO gradeVo);
}
