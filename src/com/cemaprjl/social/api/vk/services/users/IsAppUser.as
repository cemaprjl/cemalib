package com.cemaprjl.social.api.vk.services.users
{
	import com.cemaprjl.social.api.vk.services.ServiceLoader;

	public class IsAppUser extends ServiceLoader {
		
		public var is_app_user : Boolean = false;
		
		public function IsAppUser() {
			super("isAppUser");
		}
		
		override protected function onResult($data : Object) : void
		{
			is_app_user = Boolean($data.response);
		}
		
	}
}
