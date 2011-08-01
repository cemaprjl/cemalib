package com.cemaprjl.p2p
{
	import com.cemaprjl.p2p.events.SenderEvent;
	import flash.events.NetStatusEvent;
	import flash.net.NetStream;
	import flash.net.NetConnection;
	import flash.events.EventDispatcher;
	/**
	 * @author cemaprjl
	 */
	public class PeerSender extends EventDispatcher
	{
		private var _id : String;
		private var _connection : NetConnection;
		private var _stream : NetStream;
		
		public function PeerSender($connection : NetConnection, $fingerprint : String) {
			super(this);
			_connection = $connection;
			_id = $fingerprint;
			_stream = new NetStream(_connection, NetStream.DIRECT_CONNECTIONS);
			_stream.client = {onPeerConnect:onPeerConnect};
			_stream.addEventListener(NetStatusEvent.NET_STATUS, onStreamStatus);
		}

		public function get id() : String
		{
			return _id;
		}
		
		public function onPeerConnect($peerNS : NetStream) : Boolean {
			dispatchEvent(new SenderEvent(SenderEvent.PEER_CONNECTED, $peerNS));
			return true;
		}
		
		private function onStreamStatus(event : NetStatusEvent) : void
		{
			trace('S * onStreamStatus: '+event.info.code);
			switch(event.info.code)
			{
				case "NetConnection.Connect.Success":
					break;
				case "NetConnection.Connect.Failed":
					break;
			}
		}

		public function publish($channelID : String) : void
		{
			_stream.publish($channelID);
		}

		public function send($method : String, $data : Object) : void
		{
			_stream.send($method, $data);
		}
		
	}
}
