package com.cemaprjl.social.api.vk.services.friends
{
	import com.cemaprjl.social.api.vk.services.ServiceLoader;

	/**
	 * @author nikolaev
	 */
	public class FriendsGetOnline extends ServiceLoader
	{
		public var friends : Array;
		public function FriendsGetOnline()
		{
			super("friends.getOnline");
		}
		
		
		override protected function onResult($data : Object) : void
		{
			
			friends = $data.response as Array;
			
		}
		
	}
}
