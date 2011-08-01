package com.cemaprjl.loaders.classes.vo
{
	/**
	 * @author cemaprjl
	 */
	public class ClassVO
	{
		public var filePath : String;
		public var className : String;
		
		public function toString() : String {
			return filePath+"|"+className;
		}
	}
}
