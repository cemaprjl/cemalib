package com.cemaprjl.social.api.vk.services.users
{
	import com.cemaprjl.social.api.vk.services.ServiceLoader;

	/**
	 * @author nikolaev
	 */
	public class GetUserSettings extends ServiceLoader
	{
		public var settings : int = 0;
		
		public function GetUserSettings()
		{
			super("getUserSettings");
		}
		
		
		override protected function onResult($data : Object) : void
		{
			
			settings = $data.response as int;
			
		}
	}
}
