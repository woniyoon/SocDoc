package com.synergy.socdoc.reservation.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.synergy.socdoc.reservation.model.InterReserveDAO;

@Service
public class ReserveService implements InterReserveService {
	
	@Autowired
	private InterReserveDAO dao;

	@Override
	public String getContent() {
		String content = dao.getContent();
		return content;
	}

}
