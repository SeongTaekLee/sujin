package sujin.main.service;

import java.util.List;
import java.util.Map;

public interface BodyCheckService {

	List<Map<String, Object>> getBodyCheckList() throws Exception;

	void inputBodyCheck(Map<String, Object> map) throws Exception;

	List<Map<String, Object>> getCdList() throws Exception;

	List<Map<String, Object>> getTodayValue() throws Exception;

	List<Map<String, Object>> getChartData(Map<String, Object> map) throws Exception;

}
