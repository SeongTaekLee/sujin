package sujin.main.service;

import java.util.List;
import java.util.Map;

public interface CounselService {

	List<Map<String, Object>> selectCounselList(Map<String, Object> map) throws Exception;

}
