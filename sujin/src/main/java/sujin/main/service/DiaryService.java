package sujin.main.service;

import java.util.List;
import java.util.Map;

public interface DiaryService {

	List<Map<String, Object>> getDiaryList(Map<String, Object> map) throws Exception;

	void saveDiary(Map<String, Object> map) throws Exception;

	void delDiary(Map<String, Object> map) throws Exception;
	
}
