package com.cemaprjl.social.api.vk.services.storage
{
	import com.cemaprjl.social.api.vk.services.ServiceLoader;

	/**
	 * @author nikolaev
	 */
	public class StorageSet extends ServiceLoader
	{
		public var setted : Boolean = false;
		
		public function StorageSet()
		{
			super("storage.set");
			setted = false;
		}
/**
 * 
 * 
 * @param $key - Строковое название переменной длиной не более 100 символов. Может содержать символы латинского алфавита, цифры, знак тире, нижнее подчёркивание [a-zA-Z_\-0-9].
 * @param $value - Строковое значение переменной, ограниченное 4096 байтами.
 * @param $global Указывается 1, если необходимо работать с глобальными переменными, а не с переменными пользователя. По умолчанию 0.
 * 
 * 
 */
		public static function vars($key : String, $value : String = null, $global : Boolean = false):Object {
			 return {key : $key, value : $value, global : int($global)};
		}

		
		
		override protected function onResult($data : Object) : void
		{
			
			setted = Boolean($data.response);
			
		}
		
	}
}
