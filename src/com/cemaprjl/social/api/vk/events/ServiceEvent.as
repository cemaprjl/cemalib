package com.cemaprjl.social.api.vk.events
{
	import com.cemaprjl.social.api.vk.services.ServiceLoader;
	import flash.events.Event;

	/**
	 * @author Morgul
	 */
	public class ServiceEvent extends Event {
		public static const COMPLETE:String = "complete_ServiceEvent";
		public static const ERROR : String = "error_ServiceEvent";
		public static const NO_DATA : String = "no_data_ServiceEvent";
		public var service : ServiceLoader;
		public function ServiceEvent($type : String, $service : ServiceLoader):void {
			super($type, true);
			service = $service;
		}

		override public function clone() : Event {
			var sevt : ServiceEvent = new ServiceEvent(type, service);
			return sevt;
		}
	}
}
