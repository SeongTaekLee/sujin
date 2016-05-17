package sujin.main.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import sujin.main.dao.BodyCheckDetailDAO;

@Service("bodyCheckDetailService")
public class BodyCheckDetailServiceImpl implements BodyCheckDetailService{
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="bodyCheckDetailDAO")
	private BodyCheckDetailDAO bodyCheckDetailDAO;
	
	@Override
	public List<Map<String, Object>> selectBodyCheckDetail() throws Exception {
		// TODO Auto-generated method stub
		return bodyCheckDetailDAO.selectBodyCheckDetail();
	}
	
	@Override
	public List<Map<String, Object>> getThList() throws Exception {
		// TODO Auto-generated method stub
		return bodyCheckDetailDAO.getThList();
	}
	
}
