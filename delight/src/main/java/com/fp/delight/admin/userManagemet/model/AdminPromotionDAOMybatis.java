package com.fp.delight.admin.userManagemet.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fp.delight.promotion.model.PromotionVO;

@Repository
public class AdminPromotionDAOMybatis implements AdminPromotionDAO{
	private String namespace="com.mybatis.mapper.admin.promotion.";
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<PromotionVO> promotionList(PromotionVO promotionVo) {
		return sqlSession.selectList(namespace+"promotionList", promotionVo);
	}

	@Override
	public int promotiontotal(PromotionVO promotionVo) {
		return sqlSession.selectOne(namespace+"promotiontotal", promotionVo);
	}

	@Override
	public PromotionVO promotionDetail(int proseq) {
		return sqlSession.selectOne(namespace+"promotionDetail", proseq);
	}

	@Override
	public int promoDel(int proseq) {
		return sqlSession.delete(namespace+"promoDel", proseq);
	}
	
}
