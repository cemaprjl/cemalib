package com.cemaprjl.p2p
{
	import com.cemaprjl.p2p.events.PeerConnectorEvent;
	import com.cemaprjl.p2p.events.SenderEvent;
	import flash.events.NetStatusEvent;
	import flash.net.NetConnection;
	import flash.events.EventDispatcher;
	/**
	 * @author cemaprjl
	 */
	public class PeerConnector extends EventDispatcher
	{
		
		public static const URL : String = "rtmfp://p2p.rtmfp.net/";
		public static const DEV_ID : String = "77cd5e3e46c2c4bd070c8312-9a2b69da06bd/";
		
		private var _connection : NetConnection;
		private var _sender : PeerSender;
		private var _receivers : Vector.<PeerReceiver>;
		private var _channelID : String;
		
		
		public function PeerConnector() {
			super(this);
			
			_connection = new NetConnection();
			_connection.addEventListener(NetStatusEvent.NET_STATUS, onNetConnectionStatus);
			_receivers = new Vector.<PeerReceiver>(); 
			setChannel("qwerty");
		}

		public function connect():void {
			_connection.connect(URL + DEV_ID);
		}

		
		public function setChannel($id : String):void {
			_channelID = $id;
		}


		private function onNetConnectionStatus($event : NetStatusEvent) : void
		{
			trace('C = onNetConnectionStatus: ' + ($event.info.code));
			switch($event.info.code)
			{
				case "NetConnection.Connect.Success":
					_sender = new PeerSender(_connection, _connection.nearID);
					_sender.addEventListener(SenderEvent.PEER_CONNECTED, onPeerConnected);
					_sender.publish(_channelID);
					dispatchEvent(new PeerConnectorEvent(PeerConnectorEvent.CONNECTED));
					break;
				case "NetConnection.Connect.Failed":
					break;
			}
		}

		private function onPeerConnected($event : SenderEvent) : void
		{
			trace('C = onPeerConnected: ' + ($event.stream.farID));
			addReceiver($event.stream.farID);
		}
		
		public function addReceiver($id : String):void {
			for (var i : int = 0; i < _receivers.length; i++) {
				if(_receivers[i].id == $id) {
					return;
				}
			}
			
			
			
			var receiver : PeerReceiver = new PeerReceiver(_connection, $id);
			_receivers.push(receiver);
			receiver.addEventListener(ReceiverEvent.DATA_RECEIVED, onDataReceived);
			receiver.play(_channelID);
		}

		private function onDataReceived(event : ReceiverEvent) : void
		{
			
			dispatchEvent(event);
			
		}

		public function get connectionID() : String
		{
			return _connection.nearID;
		}

		public function sendData($method : String, $data : Object) : void
		{
			_sender.send($method, $data);
		}
		
	}
}
