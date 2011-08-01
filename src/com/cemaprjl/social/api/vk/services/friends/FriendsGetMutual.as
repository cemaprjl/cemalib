package com.cemaprjl.social.api.vk.services.friends
{
	import com.cemaprjl.social.api.vk.services.ServiceLoader;

	/**
	 * @author nikolaev
	 */
	public class FriendsGetMutual extends ServiceLoader
	{
		public var friends : Array;
		
		public function FriendsGetMutual()
		{
			super("friends.getMutual");
		}
		
		
		override protected function onResult($data : Object) : void
		{
			friends = $data.response as Array;
		}
		
	}
}
