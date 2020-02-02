package com.fp.delight.reservation.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fp.delight.common.DateSearchVO;

@Service
public class ReservationServiceImpl implements ReservationService{
	
	@Autowired
	private ReservationDAO reservationDao;

	@Override
	public List<Map<String, Object>> selectReserNew5(String userid) {
		return reservationDao.selectReserNew5(userid);
	}

	@Override
	public List<Map<String, Object>> selectReserList(DateSearchVO dateSearchVo) {
		return reservationDao.selectReserList(dateSearchVo);
	}

	@Override
	public int TotalRecord(DateSearchVO dateSearchVo) {
		return reservationDao.TotalRecord(dateSearchVo);
	}

	@Override
	public List<Map<String, Object>> selectCanNew5(String userid) {
		return reservationDao.selectCanNew5(userid);
	}

	@Override
	public List<Map<String, Object>> selectCanList(DateSearchVO dateSearchVo) {
		return reservationDao.selectCanList(dateSearchVo);
	}

	@Override
	public int canTotalRecord(DateSearchVO dateSearchVo) {
		return reservationDao.canTotalRecord(dateSearchVo);
	}

	@Override
	public Map<String, Object> selectCanDetail(ReservationVO reservationVo) {
		return reservationDao.selectCanDetail(reservationVo);
	}

}
