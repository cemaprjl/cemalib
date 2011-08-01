package com.cemaprjl.p2p
{
	import flash.events.NetStatusEvent;
	import flash.net.NetStream;
	import flash.net.NetConnection;
	import flash.events.EventDispatcher;

	/**
	 * @author cemaprjl
	 */
	public dynamic class PeerReceiver extends EventDispatcher
	{
		private var _connection : NetConnection;
		private var _id : String;
		private var _stream : NetStream;
		public function PeerReceiver($connection : NetConnection, $fingerprint : String)
		{
			super(this);
			_connection = $connection;
			_id = $fingerprint;
			_stream = new NetStream(_connection, _id);
			_stream.addEventListener(NetStatusEvent.NET_STATUS, onStreamStatus);
			_stream.client = this;
		}

		private function onStreamStatus(event : NetStatusEvent) : void
		{
			switch(event.info.code)
			{
				case "NetConnection.Connect.Success":
					break;
				case "NetConnection.Connect.Failed":
					break;
			}
		}

		public function play($id : String) : void
		{
			_stream.play($id);
		}

		public function get id() : String
		{
			return _id;
		}
	}
}
