package com.cemaprjl.p2p
{
	import flash.events.Event;

	/**
	 * @author cemaprjl
	 */
	public class ReceiverEvent extends Event
	{
		public static const DATA_RECEIVED : String = "DATA_RECEIVED";
		public var data : Object;
		public function ReceiverEvent($type : String, $data : Object)
		{
			super($type);
			data = $data;
		}
		
		
		override public function clone() : Event
		{
			
			return new ReceiverEvent(type, data);
			
		}
		
	}
}
