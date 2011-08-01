package com.cemaprjl.mvc.controller.event
{
	import flash.events.Event;

	/**
	 * @author cemaprjl
	 */
	public class Notification extends Event
	{
		public static const EVENT : String = "Notification.Event";
		public var name : String;
		public var data : Object;

		public function Notification($name : String, $data : Object = null)
		{
			super(EVENT);
			name = $name;
			data = $data;
		}

		override public function clone() : Event
		{
			return new Notification(name, data);
		}
	}
}
