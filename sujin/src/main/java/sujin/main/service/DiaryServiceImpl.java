package sujin.main.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import sujin.main.dao.DiaryDAO;

@Service("diaryService")
public class DiaryServiceImpl implements DiaryService{
	Logger log = Logger.getLogger(getClass());
	
	@Resource(name="diaryDAO")
	private DiaryDAO diaryDAO;
	
	@Override
	public List<Map<String, Object>> getDiaryList(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return diaryDAO.getDiaryList(map);
	}
	
	@Override
	public void saveDiary(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		diaryDAO.saveDiary(map);
	}
	
	@Override
	public void delDiary(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		diaryDAO.delDiary(map);
	}
}
