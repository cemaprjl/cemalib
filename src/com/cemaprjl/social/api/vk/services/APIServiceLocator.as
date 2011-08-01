package com.cemaprjl.social.api.vk.services
{
	import com.cemaprjl.social.api.vk.ParametersVK;
	import flash.events.EventDispatcher;
	import flash.events.TimerEvent;
	import flash.utils.Timer;


	/**
	 * @author Morgul
	 */
	public class APIServiceLocator extends EventDispatcher {

//		public static const SERVER_URL: String = "http://api.vkontakte.ru/api.php";
		private var _isAvaible : Boolean = true;
		private var _servStack : Array;
		private var _timer : Timer;
		private static var _allowConstruct : Boolean = false;

		public function get isAvaible():Boolean {
			return _isAvaible;
		}

		private static var _instance : APIServiceLocator;
		private var _vars : ParametersVK; 


		public function APIServiceLocator(api_variables:ParametersVK) {
			super();
			if(_allowConstruct) {
				_vars = api_variables;
				_servStack = [];
				_timer = new Timer(400);
				_timer.addEventListener(TimerEvent.TIMER, handleTimerComplete);
			} else {
				throw new Error("Use getInstance() method to get service locator instance");
			}
		}
		
		private function handleTimerComplete(event : TimerEvent) : void {
			_isAvaible = true;
			_timer.reset();
			if(_servStack.length > 0) {
				checkRun();
			}
		}

		public function addService(method:Function, params:Object):void {
			_servStack.push({method:method, params:params});
			checkRun();
		}
		
		private function checkRun() : void {
			if(_isAvaible && _servStack.length > 0) {
				var obj:Object = _servStack.shift();
				var method:Function = obj.method as Function;
				var params:Object = obj.params as Object; 				method(params);
				_isAvaible = false;
				_timer.start();
			}
		}

		public static function getInstance(secret:String = null, api_variables:ParametersVK = null):APIServiceLocator {
			if(!_instance && api_variables && secret.length > 0) {
				if(api_variables) {
					_allowConstruct = true;					_instance = new APIServiceLocator(api_variables);
					_allowConstruct = false;
				} else {
					throw new Error("API variables must be inited");
				}
			}
			return _instance;
		}
		
		public function get api_vars():ParametersVK {
			return _vars;
		}
		
	}
}
