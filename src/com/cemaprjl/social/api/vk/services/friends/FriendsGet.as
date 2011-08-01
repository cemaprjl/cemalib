package com.cemaprjl.social.api.vk.services.friends
{
	import com.cemaprjl.social.api.vk.services.ServiceLoader;

	/**
	 * @author Morgul
	 */
	public class FriendsGet extends ServiceLoader {


		public var friends : Array;

		public function FriendsGet() {
			super("friends.get");
		}
		
		
		override protected function onResult($data : Object) : void
		{
			friends = fillFriends($data.response as Array);
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
