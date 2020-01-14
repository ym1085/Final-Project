package com.fp.delight.common.model;

import java.util.List;

import com.fp.delight.excel.model.AreaGugunVO;
import com.fp.delight.excel.model.AreaSidoVO;

public interface AreaService {
	List<AreaSidoVO> selectSido();
	List<AreaGugunVO> gugunSelectBySido(String sido);
}
