package com.cemaprjl.mvc.controller
{
	import flash.utils.Dictionary;
	import com.cemaprjl.mvc.controller.event.Notification;
	import flash.events.EventDispatcher;

	/**
	 * @author cemaprjl
	 */
	public class Core extends EventDispatcher
	{
		
		private static var __controller : Controller;
		
		private var _callbacksNum : Number = 0; 
		private var _listenersDictionary : Dictionary;
		
		internal static function setController($controller : Controller):void {
			__controller = $controller;
		}
		
		public function Core()
		{
			super(this);
			_listenersDictionary = new Dictionary();
		}
		
		public function sendNotification($note : Notification):void {
			__controller.dispatchEvent($note);
		}

		private function onNotification($event : Notification) : void
		{
//			trace('onNotification: ' + this);
			var callback : Function = _listenersDictionary[$event.name];
			if(callback != null) {
				if($event.data != null) {
					callback($event.data);
				} else {
					callback();
				}
			}
		}

		protected function addListener($name:String, $callback : Function):void {
			if(_listenersDictionary[$name] != null) {
				_callbacksNum++;
			}
			_listenersDictionary[$name] = $callback;
//			if(!__controller.willTrigger(Notification.EVENT)) {
			__controller.addEventListener(Notification.EVENT, onNotification);
//			}
			
			
		}
		protected function removeListener($name:String):void {
			if(_listenersDictionary[$name] != null) {
				delete _listenersDictionary[$name];
				_callbacksNum--;
			}
			
			if(_callbacksNum <= 0) {
				_callbacksNum = 0;
				if(__controller.willTrigger(Notification.EVENT)) {
					__controller.removeEventListener(Notification.EVENT, onNotification);
				}
			}
		}

		public function runCommand($class : Class, $data : Object):void {
			__controller.runCommand($class, $data);
		}

		
	}
}
