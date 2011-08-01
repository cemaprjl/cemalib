package com.cemaprjl.social.api.vk.services.users
{
	import com.cemaprjl.social.api.vk.ProfileVO;
	import com.cemaprjl.social.api.vk.services.ServiceLoader;

	public class GetProfiles extends ServiceLoader {
		
		public var profiles : Array;

		public function GetProfiles() {
			
			super("getProfiles");
			
			profiles = [];
			_defaultVars = {
								uids:String(_serviceLocator.api_vars.viewer_id),
								fields:ProfileVO.getFields(ProfileVO.NS_ALL)
							};
		}
		
		override protected function onResult($data : Object) : void
		{
			profiles = fillProfiles($data.response as Array);
		}
		
		private function fillProfiles(array:Array):Array {
			var arr:Array = [];
			for (var i : int = 0; i < array.length; i++) {
				var pvo:ProfileVO = new ProfileVO();
				for (var j : String in array[i]) {
					pvo[j] = array[i][j];
				}
				arr.push(pvo);
			}
			return arr;
		}
	}
}
