package sujin.main.dao;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Repository;

import sujin.common.dao.AbstractDAO;

@Repository("diaryDAO")
public class DiaryDAO extends AbstractDAO{
	Logger log = Logger.getLogger(getClass());

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> getDiaryList() throws Exception{
		// TODO Auto-generated method stub
		return selectList("diary.getDiaryList");
	}


	public void saveDiary(Map<String, Object> map) throws Exception{
		// TODO Auto-generated method stub
		selectList("diary.saveDiary", map);
	}
	
	
}
