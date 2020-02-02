package com.fp.delight.admin.userManagemet.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fp.delight.mypage.model.GradeVO;

@Repository
public class GradeManagerDAOMybatis implements GradeManagerDAO{
	private String namespace="com.mybatis.mapper.usermanagement.";
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<GradeVO> gradeList() {
		return sqlSession.selectList(namespace+"gradeList");
	}

	@Override
	public GradeVO gradeBySeqSel(int gradeSeq) {
		return sqlSession.selectOne(namespace+"gradeBySeqSel", gradeSeq);
	}

	@Override
	public int gradeEdit(GradeVO gradeVo) {
		return sqlSession.update(namespace+"gradeEdit", gradeVo);
	}

	@Override
	public List<GradeVO> gradeListforPayment() {
		return sqlSession.selectList(namespace+"gradeListforPayment");
	}
	
	
}
