package com.cemaprjl.loaders.classes.events
{
	import com.cemaprjl.loaders.classes.AssetsGallery;
	import com.cemaprjl.loaders.classes.AssetsLibrary;
	import flash.events.Event;

	/**
	 * @author cemaprjl
	 */
	public class AssetsGalleryEvent extends Event
	{
		public static const FILE_LOADED : String = "FILE_LOADED";
		public var gallery : AssetsGallery;
		public var library : AssetsLibrary;
		public function AssetsGalleryEvent(type : String, $gallery: AssetsGallery, $library : AssetsLibrary = null)
		{
			super(type, false, false);
			gallery = $gallery;
			library = $library;
		}
		
		
		override public function clone() : Event
		{
			return new AssetsGalleryEvent(type, gallery, library);
		}
		
	}
}
