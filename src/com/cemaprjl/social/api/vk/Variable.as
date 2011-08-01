package com.cemaprjl.social.api.vk {

	/**
	 * @author Morgul
	 */
	public class Variable {
		
		public var key : Number;
		
		/**
		 * Reserved. Server unixtime. Read only.
		 */
		public static const VAR_0 : Number = 0;
		/**
		 * Not Reserved. Scores lines current. Read/write.
		 */
		/**
		 * Not Reserved. Scores max lines. Read/write.
		 */
		/**
		 * Not Reserved. Scores table start. Read/write.<br>
		 * next variables until VAR_32 + VAR_17 - 1<br>
		 * have [score], [user_id] and [first_name] separated by #31 symbol
		 * 
		 */
		public static const VAR_1024 : Number = 1024;
		
		/**
		 * Reserved. Current user_id. Read only.
		 */
		/**
		 * Reserved. Current first_name. Read only.
		 */
		/**
		 * Reserved. Current session_id. Read only.
		 */
		/**
		 * Reserved. Current session_name. Read/Write.
		 */
		
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
		
		
		public static function isGlobalVar(key:Number):Boolean {
		}
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
//				0-15				
				case VAR_15:
				case VAR_1039:
					break;
				default:
					return false;
					break;
			}
		}
	}
}