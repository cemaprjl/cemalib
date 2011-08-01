package com.cemaprjl.utils
{

	import flash.display.DisplayObjectContainer;
	import flash.geom.Point;
	import flash.display.DisplayObject;
	import flash.geom.Matrix;
	import flash.geom.Rectangle;
	/**
	 * @author nikolaev
	 */
	public class Transform
	{


		public function fitMatrix($source: Rectangle, $target : Rectangle, $center : Boolean = false, $inner : Boolean = true ) : Matrix {
			var scaleFactor : Number = 1;
			if($inner) {
				scaleFactor = Math.min($target.width / $source.width, $target.height / $source.height);
			} else {
				scaleFactor = Math.max($target.width / $source.width, $target.height / $source.height);
			}
			var mx : Matrix = new Matrix();
			
			mx.translate(-$source.left, -$source.top);
			mx.scale(scaleFactor, scaleFactor);
			mx.translate($target.x, $target.y);
			
			if ($center) {
				mx.translate(($target.width - $source.width * scaleFactor)/2, ($target.height - $source.height * scaleFactor)/2);
			}
			
			return mx;
		}
		
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
