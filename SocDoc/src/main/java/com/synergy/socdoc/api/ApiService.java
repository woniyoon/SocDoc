package com.synergy.socdoc.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ApiService implements InterApiService {

	@Autowired
	private InterApiDAO dao;
	
	@Override
	public String getCovidStats() {
		return dao.getCovidStats();
	}
	
	@Override
	public String getCoronaStats(String startCreateDt, String endCreateDt) {
		return dao.getCoronaStats(startCreateDt, endCreateDt);
	}
	

}
