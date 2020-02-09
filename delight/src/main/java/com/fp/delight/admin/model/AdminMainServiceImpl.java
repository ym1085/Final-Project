package com.fp.delight.admin.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminMainServiceImpl implements AdminMainService{
	@Autowired
	private AdminMainDAO adminMainDao;

	@Override
	public int todayInquery() {
		return adminMainDao.todayInquery();
	}

	@Override
	public int tomorInquery() {
		return adminMainDao.tomorInquery();
	}

	@Override
	public int todayRegister() {
		return adminMainDao.todayRegister();
	}

	@Override
	public int tomorRegister() {
		return adminMainDao.tomorRegister();
	}

	@Override
	public int tomorVisitor() {
		return adminMainDao.tomorVisitor();
	}

	@Override
	public int todayVisitor() {
		return adminMainDao.todayVisitor();
	}
	
	
}
