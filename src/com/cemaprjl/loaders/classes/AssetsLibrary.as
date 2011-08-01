package com.cemaprjl.loaders.classes
{
	import flash.display.Loader;
	import flash.net.URLRequest;
	import flash.system.ApplicationDomain;
	import flash.system.LoaderContext;
	import flash.utils.Dictionary;

	/**
	 * @author cemaprjl
	 */
	public class AssetsLibrary extends Loader
	{
		
		private var _fileLoaded : Boolean = false;
		private var _cachedClasses : Dictionary;
		private var _url : String;
		
		public function AssetsLibrary()
		{
			_cachedClasses = new Dictionary();
			_fileLoaded = false;
		}
		public function loadFile($url: String) : void
		{
			_url = $url;
			load(new URLRequest(_url), new LoaderContext(false, new ApplicationDomain(ApplicationDomain.currentDomain)));
		}
		
		public function getClass($className : String): Class {
			if(_fileLoaded) {
				if(_cachedClasses[$className] != null) {
					return _cachedClasses[$className];
				} else {
					return retrieveClass($className);
				}
			}
			return null;
		}

		private function retrieveClass($className : String) : Class
		{
			try {
				var classReference:Class = loaderInfo.applicationDomain.getDefinition($className) as Class;
				if(classReference) {
					_cachedClasses[$className] = classReference;
					return classReference;
				}
			} catch (e : Error) {
			}
			return null;
		}

		public function get isLoaded() : Boolean
		{
			return _fileLoaded;
		}


		public function get url() : String
		{
			return _url;
		}

	}
}
