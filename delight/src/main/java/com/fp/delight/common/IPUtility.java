package com.fp.delight.common;

import java.net.InetAddress;
import java.net.UnknownHostException;

public class IPUtility {
	  
	   public String Url(){
	          String localip="";
	           try {
	               InetAddress localInet=InetAddress.getLocalHost();
	               localip=localInet.getHostAddress();
	           } catch (UnknownHostException ex) {
	              ex.printStackTrace();
	           }
	               return localip;
	           
	       }

}
