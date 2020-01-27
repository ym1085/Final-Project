package com.fp.delight.admin.userManagemet.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fp.delight.mypage.model.GradeVO;

@Service
public class GradeManagerServiceImpl implements GradeManagerService{
	
	@Autowired
	private GradeManagerDAO gradeManagerDao;

	@Override
	public List<GradeVO> gradeList() {
		return gradeManagerDao.gradeList();
	}

	@Override
	public GradeVO gradeBySeqSel(int gradeSeq) {
		return gradeManagerDao.gradeBySeqSel(gradeSeq);
	}

	@Override
	public int gradeEdit(GradeVO gradeVo) {
		return gradeManagerDao.gradeEdit(gradeVo);
	}
	
	
}
