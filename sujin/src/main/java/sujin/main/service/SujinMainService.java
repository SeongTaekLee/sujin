package sujin.main.service;

import java.util.List;
import java.util.Map;

public interface SujinMainService {

	void mainDummy(Map<String, Object> map) throws Exception;

	List<Map<String, Object>> getChartData(Map<String, Object> map) throws Exception;

}
