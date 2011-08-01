package com.cemaprjl.p2p.events
{
	import flash.events.Event;

	/**
	 * @author cemaprjl
	 */
	public class PeerConnectorEvent extends Event
	{
		public static const CONNECTED : String = "CONNECTED";
		public function PeerConnectorEvent(type : String)
		{
			super(type);
		}
		
		
		override public function clone() : Event
		{
			return new PeerConnectorEvent(type);
		}
	}
}
