package com.cemaprjl.loaders.classes.events
{
	import com.cemaprjl.loaders.classes.AssetsLibrary;
	import flash.events.Event;

	/**
	 * @author cemaprjl
	 */
	public class SWFLibEvent extends Event
	{
		
		public static const FILE_LOADED : String = "FILE_LOADED";
		
		public var library : AssetsLibrary;
		
		public function SWFLibEvent(type : String, $lib : AssetsLibrary)
		{
			super(type, false, false);
			library = $lib;
			
		}

		override public function clone() : Event
		{
			return new SWFLibEvent(type, library);
		}
		
	}
}
