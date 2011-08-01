package com.cemaprjl.social.api.vk.services.users
{
	import com.cemaprjl.social.api.vk.services.ServiceLoader;

	public class GetGroups extends ServiceLoader
	{
		public var groups : Array = [];
		
		public function GetGroups()
		{
			super("getGroups");
		}
		
		
		override protected function onResult($data : Object) : void
		{
			
			groups = $data.response as Array;
			
		}
	}
}
