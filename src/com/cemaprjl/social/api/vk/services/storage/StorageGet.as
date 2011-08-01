package com.cemaprjl.social.api.vk.services.storage
{
	import com.cemaprjl.social.api.vk.services.ServiceLoader;
	import flash.utils.Dictionary;

	/**
	 * @author nikolaev
	 */
	public class StorageGet extends ServiceLoader
	{
		public var variables : Dictionary;
		public function StorageGet()
		{
			super("storage.get");
			variables = new Dictionary();
		}
		
		public static function vars($keys : Array, $global : Boolean = false):Object {
			if($keys.length > 1) {
				return {keys : $keys, global : int($global)};
			}
			return {key : $keys[0], global : int($global)};
			
		}
		
		override protected function onResult($data : Object) : void
		{
			variables = parseVariables($data.response);
		}

		private function parseVariables($data : Object) : Dictionary
		{
			var dict : Dictionary = new Dictionary();
			if ($data is String)
			{
				dict[String(vars["key"])] = $data as String;
			} else {
				for (var i : String in $data) {
					trace(i + " = " + $data[i]);
					dict[i] = $data[i];
				}
			}
			return dict;
		}
	}
}
