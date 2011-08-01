package com.cemaprjl.social.api.vk.interfaces {

	/**
	 * @author Morgul
	 */
	public class IMessageRecieved extends Object {
		
		public function IMessageRecieved($obj:Object) {
			user_id = $obj.user_id;			time = $obj.time;			user_name = $obj.user_name;			message = $obj.message;
		}

		public var user_id : Number;		public var time : Number;		public var user_name : String;		public var message : String;
		
		public function toString() : String {
			return "("+time + ") " + user_name + " (id:" + user_id + "): " + message;
		}
		
	}
}
