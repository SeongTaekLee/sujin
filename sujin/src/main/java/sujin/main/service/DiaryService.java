package sujin.main.service;

import java.util.List;
import java.util.Map;

public interface DiaryService {

	List<Map<String, Object>> getDiaryList() throws Exception;

	void saveDiary(Map<String, Object> map) throws Exception;
	
}
