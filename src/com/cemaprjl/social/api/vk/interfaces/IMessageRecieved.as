package com.cemaprjl.social.api.vk.interfaces {

	/**
	 * @author Morgul
	 */
	public class IMessageRecieved extends Object {
		
		public function IMessageRecieved($obj:Object) {
			user_id = $obj.user_id;
		}

		public var user_id : Number;
		
		public function toString() : String {
			return "("+time + ") " + user_name + " (id:" + user_id + "): " + message;
		}
		
	}
}