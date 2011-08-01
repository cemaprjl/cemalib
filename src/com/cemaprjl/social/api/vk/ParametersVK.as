package com.cemaprjl.social.api.vk
{
	/**
	 * @author nikolaev
	 */
	public class ParametersVK {
		
		public function ParametersVK($obj : Object) {
			api_id = $obj.api_id;
			user_id = $obj.user_id;
			group_id = $obj.group_id;
			viewer_id = $obj.viewer_id;
			is_app_user = $obj.is_app_user;
			viewer_type = $obj.viewer_type;
			auth_key = $obj.auth_key;
			language = $obj.language;
			api_url = $obj.api_url;
			sid = $obj.sid;
			secret = $obj.secret;
			api_result = $obj.api_result;
			api_settings = $obj.api_settings;
		}
		
		
		public var api_id : Number;
		public var user_id : Number;
		public var group_id : Number;
		public var viewer_id : Number;
		public var is_app_user : Number;
		public var viewer_type : Number;
		public var auth_key : String;				public var language : Number;	
					public var api_url : String;				public var sid : String;				public var secret : String;	
					public var api_result : Object;				public var api_settings : Number;		
		
	}
}
