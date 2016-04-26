package sujin.main.service;

import java.util.Map;

public interface LoginService {
	Map<String, Object> checkUser(Map<String, Object> map) throws Exception;
}
