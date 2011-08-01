package com.cemaprjl.social.api.vk.services
{
	import com.adobe.crypto.MD5;
	import com.adobe.serialization.json.JSON;
	import com.cemaprjl.social.api.vk.events.ServiceEvent;
	import flash.events.Event;
	import flash.events.HTTPStatusEvent;
	import flash.events.IOErrorEvent;
	import flash.events.ProgressEvent;
	import flash.events.SecurityErrorEvent;
	import flash.net.URLLoader;
	import flash.net.URLLoaderDataFormat;
	import flash.net.URLRequest;
	import flash.net.URLRequestMethod;
	import flash.net.URLVariables;


	public class ServiceLoader extends URLLoader {

		protected var _serviceLocator : APIServiceLocator;
		protected var _urlVariables : URLVariables;		protected var _request : URLRequest;
		private var _response : Object;
		protected var _defaultVars : Object;
		protected var _serviceName : String = "";
		private var _vars : Object;

		public function ServiceLoader($serviceName : String) {
			super();
			_serviceName = $serviceName;
			_defaultVars = {};
			_serviceLocator = APIServiceLocator.getInstance();
			dataFormat = URLLoaderDataFormat.TEXT;
			
			configureListeners();
		}
		public function get response():Object {			return _response;
		}

		private function configureListeners():void {
            addEventListener(Event.COMPLETE, handleResponseComplete);
            addEventListener(Event.OPEN, handleOpenConnection);
            addEventListener(ProgressEvent.PROGRESS, handleProgress);
            addEventListener(SecurityErrorEvent.SECURITY_ERROR, handleSecurityError);
            addEventListener(HTTPStatusEvent.HTTP_STATUS, handleHTTPStatus);
            addEventListener(IOErrorEvent.IO_ERROR, handleIOError);
		}	
			
		protected function handleResponseComplete(event : Event = null) : void {
			if(this.data) {
				 _response = JSON.decode(this.data as String);
			} else {
				_response = {};
			}
			
			if(_response.error) {
				onResponseError(_response);
			} else {
				onResult(_response);
				dispatchEvent(new ServiceEvent(ServiceEvent.COMPLETE, this));
			}
			
			
		}

		private function onResponseError($data : Object) : void
		{
			/*
			 * TODO handle all response errors here 
			 */
			
			/**
				 * 
				 * 1 Unknown error occured.
				 * 2 Application is disabled. Enable your application or use test mode.
				 * 
				 * 4 Incorrect signature.
				 * 5 User authorization failed.
				 * 6 Too many requests per second.
				 * 7 Permission to perform this action is denied by user.
				 * 
				 * 10 Ошибка сервера
				 * 
				 * 15 Access denied: groups list of this user are under privacy.
				 * 
				 * 100 Неправильно задан один из параметров
				 *  
				 * 103 Израсходовано ограничение на количество переменных
				 * 
				 * 113 Invalid user ids.
				 * 
				 * 170 Access to user's friends list denied.
				 * 
				 * 500 Permission denied. You must enable votes processing in application settings.
				 * 
				 * 
				 * 
				 * 
				 */
			
			
			onFault($data);
			
			dispatchEvent(new ServiceEvent(ServiceEvent.ERROR, this));
		}

		protected function onFault($data : Object) : void
		{
			/**
			 * XXX override me
			 */
		}
		
		protected function onResult($data : Object) : void
		{
			/**
			 * XXX override me
			 */
		}

		protected function handleIOError(event : IOErrorEvent = null) : void {
//			trace('[handleIOError]');
			/**
			 * to override in children
			 */
		}

		protected function handleHTTPStatus(event : HTTPStatusEvent = null) : void {
//			trace('[handleHTTPStatus]');
			/**
			 * to override in children
			 */
		}

		protected function handleSecurityError(event : SecurityErrorEvent = null) : void {
//			trace('[handleSecurityError]');
			/**
			 * to override in children
			 */
		}

		protected function handleProgress(event : ProgressEvent = null) : void {
//			trace('[handleProgress]');
			/**
			 * to override in children
			 */
		}

		protected function handleOpenConnection(event : Event = null) : void {
//			trace('[handleOpenConnection]');
			/**
			 * to override in children
			 */
		}	
		protected function generateRequest(variables:Object):URLRequest {
			var request:URLRequest = new URLRequest();
			request.method = URLRequestMethod.POST;
			request.url = _serviceLocator.api_vars.api_url;
			request.data = variables;
			return request;
		}
		protected function generateVariables(method:String, variables:Object):URLVariables {
			var request_params :Object  = {method:method};
			request_params.api_id = _serviceLocator.api_vars.api_id;
			request_params.v = "3.0";			request_params.format = "JSON";
			request_params.sid = _serviceLocator.api_vars.sid;
			
			for (var val : String in variables) {
				request_params[val] = variables[val];
			}
			
			var urlvars:URLVariables = new URLVariables();
			for (var i : String in request_params) {
				urlvars[i] = request_params[i];
			}
			urlvars['sig'] = generateSignature(request_params);
			
			return urlvars;
		}
		private function generateSignature(request_params:Object): String {
			var signature : String = "";
			var sorted_array: Array = new Array();
			for (var key:String in request_params) {
				if(key != "sid") {
					sorted_array.push(key + "=" + request_params[key]);
				}
			}
			sorted_array.sort();
			
			for (key in sorted_array) {
					signature += sorted_array[key];
			}
			signature = _serviceLocator.api_vars.viewer_id + signature + _serviceLocator.api_vars.secret;
			return MD5.hash(signature);
		}				
		public function call(variables:Object):void {
			if(variables) {
				_vars = variables;
			} else {
				_vars = _defaultVars;
			}
			_urlVariables = generateVariables(getCommandName(), _vars);
			_request = generateRequest(_urlVariables);
			_serviceLocator.addService(this.load, _request);			 
		}

		public function getCommandName() : String
		{
			return _serviceName;
		}

		public function get vars() : Object
		{
			return _vars;
		}
	}
}
