package com.cemaprjl.social.api.vk.services.friends
{
	import com.cemaprjl.social.api.vk.services.ServiceLoader;

	/**
	 * @author Morgul
	 */
	public class FriendsGetAppUsers extends ServiceLoader {

		public var friends : Array;

		public function FriendsGetAppUsers() {
			super("friends.getAppUsers");
		}
		
		
		override protected function onResult($data : Object) : void
		{
			friends = $data.response as Array;
		}
		
		private function fillFriends(array : Array) : Array
		{
			/*
			 * TODO handle friendslist
			 */
			return array;
		}
		
	}
}
