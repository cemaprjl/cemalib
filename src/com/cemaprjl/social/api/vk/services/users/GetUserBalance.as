package com.cemaprjl.social.api.vk.services.users
{
	import com.cemaprjl.social.api.vk.services.ServiceLoader;

	/**
	 * @author Morgul
	 */
	public class GetUserBalance extends ServiceLoader {

		public var balance : Number = -1;

		public function GetUserBalance() {
			super("getUserBalance");
		}
		
		override protected function onResult($data : Object) : void
		{
			balance = $data.response as Number;
		}

	}
}
