package com.cemaprjl.utils
{
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.geom.Point;
	/**
	 * @author nikolaev
	 */
	public class Coords
	{
		public static function getGlobalPoint($obj : DisplayObject, $delta : Point = null) : Point
		{
			var parent : DisplayObjectContainer = $obj.parent;
			var point : Point = parent.localToGlobal(new Point($obj.x, $obj.y));
			if ($delta)
			{
				point = point.add($delta);
			}
			return point;
		}
	}
}
