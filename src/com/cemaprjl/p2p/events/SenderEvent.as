package com.cemaprjl.p2p.events
{
	import flash.net.NetStream;
	import flash.events.Event;

	/**
	 * @author cemaprjl
	 */
	public class SenderEvent extends Event
	{
		public static const PEER_CONNECTED : String = "PEER_CONNECTED";
		
		public var stream : NetStream;
		public function SenderEvent($type : String, $stream : NetStream)
		{
			super($type, false, false);
			stream = $stream;
		}
		
		
		override public function clone() : Event
		{
			
			return new SenderEvent(type, stream);
			
		}
	}
}
