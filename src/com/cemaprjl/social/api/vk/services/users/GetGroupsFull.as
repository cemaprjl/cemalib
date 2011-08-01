package com.cemaprjl.social.api.vk.services.users
{
	import com.cemaprjl.social.api.vk.services.ServiceLoader;

	/**
	 * @author nikolaev
	 */
	public class GetGroupsFull extends ServiceLoader
	{
		public var groups : Array;
		public function GetGroupsFull()
		{
			super("getGroupsFull");
		}
		
		
		override protected function onResult($data : Object) : void
		{
			
			groups = fillGroups($data.response as Array);
			
		}

		private function fillGroups(array : Array) : Array
		{
			/*
			 * 
			 * {"response":[
{"gid":1,"name":"FLASH API",
"photo":"http:\/\/cs1202.vkontakte.ru\/g00001\/b_7cc2919b.jpg","is_closed":"0"},
{"gid":55,"name":"Вики ВКонтакте",
"photo":"http:\/\/vkontakte.ru\/images\/question_100.gif","is_closed":"0"},
{"gid":103,"name":"East",
"photo":"http:\/\/vkontakte.ru\/images\/question_100.gif","is_closed":"0"},
{"gid":354,"name":"ВК",
"photo":"http:\/\/cs80.vkontakte.ru\/g00354\/b_a2b5680.jpg","is_closed":"1"},
{"gid":400,"name":"VKontakte Coders",
"photo":"http:\/\/vkontakte.ru\/images\/question_100.gif","is_closed":"1"}
]}
			 * 
			 * 
			 */
			trace("write group filling");
			
			
			return [];
		}
	}
}
