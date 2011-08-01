package com.cemaprjl.utils
{
	import flash.display.DisplayObject;
	import flash.geom.Matrix;
	import flash.geom.Rectangle;
	/**
	 * @author nikolaev
	 */
	public class Calc
	{


		/**
		 * fits $displayObject into $fitRect rectangle
		 * @param $displayObject 
		 * @param $fitRect 
		 * @return matrix for transformation
		 */		
		public static function getFitInMatrix($displayObject : DisplayObject, $fitRect : Rectangle):Matrix {
			var rect : Rectangle = $displayObject.getBounds($displayObject);
			var scaleFactor : Number = Math.min($fitRect.width / rect.width, $fitRect.height / rect.height);
			var mx : Matrix = new Matrix();
			mx.translate(-rect.left, -rect.top);
			mx.scale(scaleFactor, scaleFactor);
			mx.translate($fitRect.x, $fitRect.y);
			return mx;
		}
		
		public static function getFitOutMatrix($displayObject : DisplayObject, $fitRect : Rectangle):Matrix {
			var rect : Rectangle = $displayObject.getBounds($displayObject);
			var scaleFactor : Number = Math.max($fitRect.width / rect.width, $fitRect.height / rect.height);
			var mx : Matrix = new Matrix();
			mx.translate(-rect.left, -rect.top);
			mx.scale(scaleFactor, scaleFactor);
			mx.translate($fitRect.x, $fitRect.y);
			return mx;
		}
		
		
		public static function getFitCenterInMatrix($displayObject : DisplayObject, $fitRect : Rectangle):Matrix {
			var rect : Rectangle = $displayObject.getBounds($displayObject);
			var scaleFactor : Number = Math.min($fitRect.width / rect.width, $fitRect.height / rect.height);
			var mx : Matrix = new Matrix();
			mx.translate(-rect.left, -rect.top);
			mx.scale(scaleFactor, scaleFactor);
			mx.translate($fitRect.x, $fitRect.y);
			mx.translate(($fitRect.width - rect.width * scaleFactor)/2, ($fitRect.height - rect.height * scaleFactor)/2);
			return mx;
		}
		
		public static function getFitCenterOutMatrix($displayObject : DisplayObject, $fitRect : Rectangle):Matrix {
			var rect : Rectangle = $displayObject.getBounds($displayObject);
			var scaleFactor : Number = Math.max($fitRect.width / rect.width, $fitRect.height / rect.height);
			var mx : Matrix = new Matrix();
			mx.translate(-rect.left, -rect.top);
			mx.scale(scaleFactor, scaleFactor);
			mx.translate($fitRect.x, $fitRect.y);
			mx.translate(($fitRect.width - rect.width * scaleFactor)/2, ($fitRect.height - rect.height * scaleFactor)/2);
			return mx;
		}
		
	}
}
