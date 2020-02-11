package com.fp.delight.admin.perfom;

public class AdminCommon {

	public int getDayofWeek(String dow) {
		int res=-1;
		if(dow.equals("일요일")) {
			res=0;
		}else if(dow.equals("월요일")) {
			res=1;
		}else if(dow.equals("화요일")) {
			res=2;
		}else if(dow.equals("수요일")) {
			res=3;
		}else if(dow.equals("목요일")) {
			res=4;
		}else if(dow.equals("금요일")) {
			res=5;
		}else if(dow.equals("토요일")) {
			res=6;
		}
		
		return res;
	}
	
	public int[] getdoubledow(String[] dowArr) {
		int[] res=new int[2];
		for(int i=0;i<dowArr.length;i++) {
			if(dowArr[i].equals("일요일")) {
				res[i]=0;
			}else if(dowArr[i].equals("월요일")) {
				res[i]=1;
			}else if(dowArr[i].equals("화요일")) {
				res[i]=2;
			}else if(dowArr[i].equals("수요일")) {
				res[i]=3;
			}else if(dowArr[i].equals("목요일")) {
				res[i]=4;
			}else if(dowArr[i].equals("금요일")) {
				res[i]=5;
			}else if(dowArr[i].equals("토요일")) {
				res[i]=6;
			}else if(dowArr[i].equals("HOL")) {
				res[i]=-1;
			}
			
		}
		return res;
	}
}
