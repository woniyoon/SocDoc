package com.synergy.socdoc.api;


public interface InterApiService {

	String getCovidStats();


	String getCoronaStats(String startCreateDt, String endCreateDt);

}
