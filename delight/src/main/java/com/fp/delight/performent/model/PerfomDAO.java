package com.fp.delight.performent.model;

import java.util.List;
import java.util.Map;

public interface PerfomDAO {
	List<Map<String, Object>> selectreserList(String perfomid);
}
