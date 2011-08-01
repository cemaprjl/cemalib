package com.cemaprjl.social.api.vk {

	/**
	 * @author Morgul
	 */
	public class Variable {
		
		public var key : Number;		public var value : Object;
		
		/**
		 * Reserved. Server unixtime. Read only.
		 */
		public static const VAR_0 : Number = 0;		public static const VAR_1 : Number = 1;		public static const VAR_2 : Number = 2;		public static const VAR_3 : Number = 3;		public static const VAR_4 : Number = 4;		public static const VAR_5 : Number = 5;		public static const VAR_6 : Number = 6;		public static const VAR_7 : Number = 7;		public static const VAR_8 : Number = 8;		public static const VAR_9 : Number = 9;		public static const VAR_10 : Number = 10;		public static const VAR_11 : Number = 11;		public static const VAR_12 : Number = 12;		public static const VAR_13 : Number = 13;		public static const VAR_14 : Number = 14;		public static const VAR_15 : Number = 15;
		/**
		 * Not Reserved. Scores lines current. Read/write.
		 */		public static const VAR_16 : Number = 16;
		/**
		 * Not Reserved. Scores max lines. Read/write.
		 */		public static const VAR_17 : Number = 17;
		/**
		 * Not Reserved. Scores table start. Read/write.<br>
		 * next variables until VAR_32 + VAR_17 - 1<br>
		 * have [score], [user_id] and [first_name] separated by #31 symbol
		 * 
		 */		public static const VAR_32 : Number = 32;		
		public static const VAR_1024 : Number = 1024;		public static const VAR_1025 : Number = 1025;		public static const VAR_1026 : Number = 1026;		public static const VAR_1027 : Number = 1027;		public static const VAR_1028 : Number = 1028;		public static const VAR_1029 : Number = 1029;		public static const VAR_1030 : Number = 1030;		public static const VAR_1031 : Number = 1031;		public static const VAR_1032 : Number = 1032;		public static const VAR_1033 : Number = 1033;		public static const VAR_1034 : Number = 1034;		public static const VAR_1035 : Number = 1035;		public static const VAR_1036 : Number = 1036;		public static const VAR_1037 : Number = 1037;		public static const VAR_1038 : Number = 1038;		public static const VAR_1039 : Number = 1039;
		
		/**
		 * Reserved. Current user_id. Read only.
		 */		public static const VAR_1280 : Number = 1280;
		/**
		 * Reserved. Current first_name. Read only.
		 */		public static const VAR_1281 : Number = 1281;		public static const VAR_1282 : Number = 1282;		public static const VAR_1283 : Number = 1283;		public static const VAR_1284 : Number = 1284;		public static const VAR_1285 : Number = 1285;		public static const VAR_1286 : Number = 1286;		public static const VAR_1287 : Number = 1287;		public static const VAR_1288 : Number = 1288;		public static const VAR_1289 : Number = 1289;		public static const VAR_1290 : Number = 1290;		public static const VAR_1291 : Number = 1291;		public static const VAR_1292 : Number = 1292;		public static const VAR_1293 : Number = 1293;		public static const VAR_1294 : Number = 1294;		public static const VAR_1295 : Number = 1295;
		/**
		 * Reserved. Current session_id. Read only.
		 */		public static const VAR_2048 : Number = 2048;
		/**
		 * Reserved. Current session_name. Read/Write.
		 */		public static const VAR_2049 : Number = 2049;		public static const VAR_2050 : Number = 2050;		public static const VAR_2051 : Number = 2051;		public static const VAR_2052 : Number = 2052;		public static const VAR_2053 : Number = 2053;		public static const VAR_2054 : Number = 2054;		public static const VAR_2055 : Number = 2055;		public static const VAR_2056 : Number = 2056;		public static const VAR_2057 : Number = 2057;		public static const VAR_2058 : Number = 2058;		public static const VAR_2059 : Number = 2059;		public static const VAR_2060 : Number = 2060;		public static const VAR_2061 : Number = 2061;		public static const VAR_2062 : Number = 2062;		public static const VAR_2063 : Number = 2063;
		
		/**
		 * Not Reserved. Total messages in stack. Read/write.
		 */
		public static const VAR_2064: Number = 2064;
		/**
		 * Not Reserved. Have message 2080+(i mod 128), i >= 0. Read/write.<br>
		 * stores user_id and message text, separated by #31
		 * 
		 */
		public static const VAR_2080: Number = 2080;

		/**
		 * Not Reserved. Readed messages by user. Read/write.
		 */
		public static const VAR_3072: Number = 3072;
		
		
		public static function isGlobalVar(key:Number):Boolean {			return (0 <= key) && (key <= 1023);
		}		public static function isUserVar(key:Number):Boolean {			return (1024 <= key) && (key <= 2047);
		}
		public static function isSessionVar(key:Number):Boolean {
			return (2048 <= key) && (key <= 3071);	
		}
		public static function isInstanceVar(key:Number):Boolean {
			return (3072 <= key) && (key <= 4095);	
		}
		public static function isPermanentVar(key:Number):Boolean {
			return (0 <= key) && (key <= 1535);	
		}	
		public static function isTemporaryVar(key:Number):Boolean {
			return (1534 <= key) && (key <= 4095);	
		}			
		public static function isReserved(key:Number):Boolean {
			switch (key) {
//				0-15								case VAR_0:				case VAR_1:				case VAR_2:				case VAR_3:				case VAR_4:				case VAR_5:				case VAR_6:				case VAR_7:				case VAR_8:				case VAR_9:				case VAR_10:				case VAR_11:				case VAR_12:				case VAR_13:				case VAR_14:
				case VAR_15://				1024-1039								case VAR_1024:				case VAR_1025:				case VAR_1026:				case VAR_1027:				case VAR_1028:				case VAR_1029:				case VAR_1030:				case VAR_1031:				case VAR_1032:				case VAR_1033:				case VAR_1034:				case VAR_1035:				case VAR_1036:				case VAR_1037:				case VAR_1038:
				case VAR_1039://				1280-1295								case VAR_1280:				case VAR_1281:				case VAR_1282:				case VAR_1283:				case VAR_1284:				case VAR_1285:				case VAR_1286:				case VAR_1287:				case VAR_1288:				case VAR_1289:				case VAR_1290:				case VAR_1291:				case VAR_1292:				case VAR_1293:				case VAR_1294:				case VAR_1295://				2048-2063								case VAR_2048:				case VAR_2049:				case VAR_2050:				case VAR_2051:				case VAR_2052:				case VAR_2053:				case VAR_2054:				case VAR_2055:				case VAR_2056:				case VAR_2057:				case VAR_2058:				case VAR_2059:				case VAR_2060:				case VAR_2061:				case VAR_2062:				case VAR_2063:					return true;
					break;
				default:
					return false;
					break;
			}
		}
	}
}
