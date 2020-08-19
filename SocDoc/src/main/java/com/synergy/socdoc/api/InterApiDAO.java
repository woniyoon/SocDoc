package com.synergy.socdoc.api;


public interface InterApiDAO {

	String getCovidStats();


	String getCoronaStats(String startCreateDt, String endCreateDt);	
}
