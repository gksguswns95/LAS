package com.evolve.util;

public class IpChangeDecimal {
	
	public Long convertStringToHex(String ip) {
		String hexString = "";
		//ip = "54.211.120.28";
		String[] strArr = ip.split("\\.");
		for(String s : strArr) {
			if((Integer.toHexString(Integer.parseInt(s))).length() == 1) {
				hexString += "0"+Integer.toHexString(Integer.parseInt(s));
			} else {
				hexString += Integer.toHexString(Integer.parseInt(s));
			}
		}
		return Long.parseLong(hexString,16);
	}
}
