package com.fp.delight.email;

import java.util.Random;

public class RandomKey {
	//저장되어있는거중 랜덤값 6자리
	public String getRandomInt( int length ){
		
		String[] charaters = {"a","b","v","w"
				,"0","1","2","3","4","5","9","!","@","#","$","%","^","&"};
		
		StringBuffer sb = new StringBuffer();
		
		Random rn = new Random();
		
		for( int i = 0 ; i < 6 ; i++ ){
			
			sb.append( charaters[ rn.nextInt( 6 ) ] );
			
		}
		
		return sb.toString();
		
	}
	
    //저장되어있는거중 랜덤값 6자리
    public String excuteGenerate() {
        int certCharLength = 6;
        String[] characterTable = {"1", "2", "3", "4", "5", "6", "7", "8", "9", "0" };
    	
        Random random = new Random(System.currentTimeMillis());
        int tablelength = characterTable.length;
        StringBuffer buf = new StringBuffer();
        
        for(int i = 0; i < certCharLength; i++) {
            buf.append(characterTable[random.nextInt(tablelength)]);
        }
        
        return buf.toString();
    }


  //저장되어있는거중 랜덤값 8자리
    public String excuteGenerate1() {
       int pwdLength = 8;
       char[] passwordTable =  { 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 
                                                'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X',
                                                'Y', 'Z', 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j',
                                                'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 
                                                'w', 'x', 'y', 'z', '!', '@', '#', '$', '%', '^', '&', '*',
                                                '(', ')', '1', '2', '3', '4', '5', '6', '7', '8', '9', '0' };
    	
        Random random = new Random(System.currentTimeMillis());
        int tablelength = passwordTable.length;
        StringBuffer buf = new StringBuffer();
        
        for(int i = 0; i < pwdLength; i++) {
            buf.append(passwordTable[random.nextInt(tablelength)]);
        }
        
        return buf.toString();
    }
    
    //저장되어있는거중 랜덤값 10자리
    public String randomKey1() {
        StringBuffer key = new StringBuffer();
        Random rnd = new Random();

        for (int i = 0; i < 6; i += 1) {
            int rIndex = rnd.nextInt(2);

            switch (rIndex) {
            case 0:
                key.append((char) ((int) (rnd.nextInt(26)) + 65));
                break; // A-Z
            case 1:
                key.append(rnd.nextInt(10));
                break; // 0-9
            }
        }
        return key.toString(); // StringBuffer -> String
    }
    
    
}
