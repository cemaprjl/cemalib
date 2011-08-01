package com.cemaprjl.utils
{
	import flash.filters.ColorMatrixFilter;

	/**
	 * @author nikolaev
	 */
	public class Filters
	{
		public static function getGrayscale() : ColorMatrixFilter
		{
			var matrix : Array = [0.3, 0.6, 0.1, 0, 0, 0.3, 0.6, 0.1, 0, 0, 0.3, 0.6, 0.1, 0, 0, 0, 0, 0, 1, 0];
			return new ColorMatrixFilter(matrix);
		}
		
		public static function getRed() : ColorMatrixFilter
		{
			var matrix : Array = [
			1, 0, 0, 0, 0, 
			0, 0, 0, 0, 0, 
			0, 0, 0, 0, 0, 
			0, 0, 0, 1, 0];
			return new ColorMatrixFilter(matrix);
		}
		
		public static function getGreen() : ColorMatrixFilter
		{
			var matrix : Array = [
			0, 0, 0, 0, 0, 
			0, 1, 0, 0, 0, 
			0, 0, 0, 0, 0, 
			0, 0, 0, 1, 0];
			return new ColorMatrixFilter(matrix);
		}
		
		public static function getBlue() : ColorMatrixFilter
		{
			var matrix : Array = [
			0, 0, 0, 0, 0, 
			0, 0, 0, 0, 0, 
			0, 0, 1, 0, 0, 
			0, 0, 0, 1, 0];
			return new ColorMatrixFilter(matrix);
		}
		
		public static function getYellow() : ColorMatrixFilter
		{
			var matrix : Array = [
			1, 0, 0, 0, 0, 
			0, 1, 0, 0, 0, 
			0, 0, 0, 0, 0, 
			0, 0, 0, 1, 0];
			return new ColorMatrixFilter(matrix);
		}
		public static function getCyan() : ColorMatrixFilter
		{
			var matrix : Array = [
			0, 0, 0, 0, 0, 
			0, 1, 0, 0, 0, 
			0, 0, 1, 0, 0, 
			0, 0, 0, 1, 0];
			return new ColorMatrixFilter(matrix);
		}
		public static function getMagenta() : ColorMatrixFilter
		{
			var matrix : Array = [
			1, 0, 0, 0, 0, 
			0, 0, 0, 0, 0, 
			0, 0, 1, 0, 0, 
			0, 0, 0, 1, 0];
			return new ColorMatrixFilter(matrix);
		}

		public static function getHighlight($percent : Number = 100) : ColorMatrixFilter
		{
			var val : Number = $percent / 100;
			
			var matrix : Array = [
			1 + val, 0, 0, 0, 0, 
			0, 1 + val, 0, 0, 0, 
			0, 0, 1 + val, 0, 0, 
			0, 0, 0, 1, 0];
			return new ColorMatrixFilter(matrix);
		}
	}
}
