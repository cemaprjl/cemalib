package com.cemaprjl.loaders.classes
{
	import com.cemaprjl.loaders.classes.events.AssetsGalleryEvent;
	import com.cemaprjl.loaders.classes.events.SWFLibEvent;
	import com.cemaprjl.loaders.classes.vo.ClassVO;
	import flash.events.EventDispatcher;
	import flash.utils.Dictionary;
	/**
	 * @author cemaprjl
	 */
	public class AssetsGallery extends EventDispatcher
	{
		private var _files : Dictionary;
		public function AssetsGallery() {
			super(this);
			_files = new Dictionary();
		}
		public function getClass($classvo : ClassVO):Class {
			var file : AssetsLibrary = _files[$classvo.filePath];
			if(file) {
				if(file.isLoaded) {
					return (file.getClass($classvo.className));
				}
			} else {
				file = new AssetsLibrary();
				file.addEventListener(SWFLibEvent.FILE_LOADED, onFileLoaded);
				file.loadFile($classvo.filePath);
				_files[$classvo.filePath] = file;
			}
			return null;
		}

		private function onFileLoaded(event : SWFLibEvent) : void
		{
			dispatchEvent(new AssetsGalleryEvent(AssetsGalleryEvent.FILE_LOADED, this, event.library));
		}
	}
}
