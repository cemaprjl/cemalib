package com.cemaprjl.social.api.vk {

	/**
	 * @author Morgul
	 */
	public class ProfileVO {

		public static const VAL_UID : String = "uid";
		public static const VAL_FIRST_NAME : String = "first_name";		public static const VAL_LAST_NAME : String = "last_name";		public static const VAL_NICKNAME : String = "nickname";		public static const VAL_SEX : String = "sex";		public static const VAL_BDATE : String = "bdate";		public static const VAL_CITY : String = "city";		public static const VAL_COUNTRY : String = "country";		public static const VAL_TIMEZONE : String = "timezone";		public static const VAL_PHOTO : String = "photo";		public static const VAL_PHOTO_MEDIUM : String = "photo_medium";		public static const VAL_PHOTO_BIG : String = "photo_big";
		public static const N_UID : Number = 1; //numeric		public static const N_FIRST_NAME : Number = 2;
		public static const N_LAST_NAME : Number = 4; 
		public static const N_NICKNAME : Number = 8; 
		public static const N_SEX : Number  = 16;
		public static const N_BDATE : Number = 32;
		public static const N_CITY : Number = 64;
		public static const N_COUNTRY : Number = 128;
		public static const N_TIMEZONE : Number = 256;
		public static const N_PHOTO : Number = 512;
		public static const N_PHOTO_MEDIUM : Number = 1024; 
		public static const N_PHOTO_BIG : Number = 2048;		
		public static const NS_ALL : Number = 4095; //numeric set		public static const NS_NAMES : Number = 15; //numeric set		public static const NS_PHOTOS : Number = 3584; //numeric set		public static const NS_USERDATA : Number = 496; //numeric set		public static const NS_SET_0 : Number = 639; //numeric set 1 + 2 + 4 + 8 + 16 + 32 + 64 + 512 
				public var uid : String = "";		public var first_name : String = "";		public var last_name : String = ""; 		public var nickname : String = ""; 		public var sex : String  = "";		public var bdate : String = "";		public var city : String = "";		public var country : String = "";		public var timezone : String = "";		public var photo : String = "";		public var photo_medium : String = ""; 		public var photo_big : String = "";
		
		private static function getVariable(n:Number):String {
			switch(n) {
				case N_UID: return VAL_UID; break;
				case N_FIRST_NAME: return VAL_FIRST_NAME; break;
				case N_LAST_NAME: return VAL_LAST_NAME; break;
				case N_NICKNAME: return VAL_NICKNAME; break;
				case N_SEX: return VAL_SEX; break;
				case N_BDATE: return VAL_BDATE; break;
				case N_CITY: return VAL_CITY; break;
				case N_COUNTRY: return VAL_COUNTRY; break;
				case N_TIMEZONE: return VAL_TIMEZONE; break;
				case N_PHOTO: return VAL_PHOTO; break;
				case N_PHOTO_MEDIUM: return VAL_PHOTO_MEDIUM; break;
				case N_PHOTO_BIG: return VAL_PHOTO_BIG; break;
			}
			return "";
		}
		public static function getFields(n:Number = 0):String {
			var s:String = "";
			var values : String = n.toString(2);
			trace('values: ' + (values));
			for (var i : int = 0;i < values.length; i++) {
				if(values.charAt(values.length - 1 - i) == "1") {
					if(s.length > 0) s+=",";
					s+= getVariable(1 << (i));
				}
			}
			trace(s);
			return s;
		}
	}
}
