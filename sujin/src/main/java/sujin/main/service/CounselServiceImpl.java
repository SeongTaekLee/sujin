package sujin.main.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import sujin.main.dao.CounselDAO;

@Service("counselService")
public class CounselServiceImpl implements CounselService{
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="counselDAO")
	private CounselDAO counselDAO;
	
	@Override
	public List<Map<String, Object>> selectCounselList(Map<String, Object> map) throws Exception {
		return counselDAO.selectCounselList(map);
	}
}
