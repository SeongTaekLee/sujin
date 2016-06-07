package sujin.main.service;

import java.util.List;
import java.util.Map;

public interface SujinMainService {


	List<Map<String, Object>> getChartData(Map<String, Object> map) throws Exception;

	String getMainBodySummary() throws Exception;

	Map<String, Object> getMainFoodSummary() throws Exception;

	Map<String, Object> getMainCoffeeSummary() throws Exception;

	String getMainDiarySummary() throws Exception;

	Map<String, Object> getMainCounselSummary() throws Exception;

}
