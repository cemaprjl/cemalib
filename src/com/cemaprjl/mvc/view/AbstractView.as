package com.cemaprjl.mvc.view
{
	import flash.display.Sprite;
	import com.cemaprjl.mvc.controller.Core;

	/**
	 * @author cemaprjl
	 */
	public class AbstractView extends Core
	{
		
		private var _asset : Sprite;
		
		public function get asset() : Sprite
		{
			return _asset;
		}
		
		public function AbstractView($asset : Sprite) {
			super();
			_asset = $asset;
		}
		
		final public function initialize():void {
			initializeContent();
		}

		protected function initializeContent() : void
		{
		}

		
		
		
		
		
	}
}
