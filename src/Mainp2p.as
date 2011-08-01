package 
{
	import com.cemaprjl.p2p.ReceiverEvent;
	import com.cemaprjl.p2p.events.PeerConnectorEvent;
	import com.cemaprjl.p2p.PeerConnector;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.MouseEvent;
	import flash.text.TextFieldType;
	import flash.text.TextField;
	import flash.net.NetStream;
	import flash.events.NetStatusEvent;
	import flash.net.NetConnection;
	import flash.display.Sprite;

	public class Mainp2p extends Sprite
	{
		
		public static const ___url : String = "rtmfp://p2p.rtmfp.net/77cd5e3e46c2c4bd070c8312-9a2b69da06bd/";
		public static const TOKEN : String = "cemaprjl";
		private static const OLOLOLOLO : String = "OLOLOLOLO";
		private var _clientConnection : NetConnection;
		private var _myID : String = "*";
		private var _farID : String;

		private var _sendStream : NetStream;
		private var _receiveStream : NetStream;
		
		
		private var _myFingerprint : TextField;
		private var _farFingerprint : TextField;
		private var _connect : Sprite;
		private var _sendData : TextField;
		private var _recvData : TextField;
		private var _sendButton : Sprite;
		private var _connector : PeerConnector;
		
		public function Mainp2p()
		{
			
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;
			
			
			_myFingerprint = new TextField();
//			_myFingerprint.type = TextFieldType.INPUT;
			_myFingerprint.width = 500;
			_myFingerprint.height = 28;
			addChild(_myFingerprint);
			_myFingerprint.border = true;
			
			_farFingerprint = new TextField();
			_farFingerprint.type = TextFieldType.INPUT;
			_farFingerprint.width = 500;
			_farFingerprint.height = 28;
			addChild(_farFingerprint);
			_farFingerprint.y = 30;
			_farFingerprint.border = true;
			
			_connect = new Sprite();
			_connect.graphics.beginFill(0xDDDDDD);
			_connect.graphics.drawRect(0, 0, 80, 28);
			_connect.addEventListener(MouseEvent.CLICK, onConnectClick);
			addChild(_connect);
			_connect.x = 510;
			_connect.y = 30;
			
			_sendData = new TextField();
			_sendData.width = 500;
			_sendData.height = 100;
			_sendData.type = TextFieldType.INPUT;
			addChild(_sendData);
			_sendData.y = 60;
			_sendData.border = true;
			
			_sendButton = new Sprite();
			_sendButton.graphics.beginFill(0xDDDDDD);
			_sendButton.graphics.drawRect(0, 0, 80, 28);
			_sendButton.addEventListener(MouseEvent.CLICK, onSendClick);
			addChild(_sendButton);
			_sendButton.x = 510;
			_sendButton.y = 60;
			
			_recvData = new TextField();
			_recvData.width = 500;
			_recvData.height = 100;
			_recvData.type = TextFieldType.INPUT;
			addChild(_recvData);
			_recvData.y = 165;
			_recvData.border = true;
			
			initClient();
		}

		private function onSendClick(event : MouseEvent) : void
		{
			_connector.sendData("setText",{text : _sendData.text});
		}

		private function onConnectClick(event : MouseEvent) : void
		{
			_connector.addReceiver(_farFingerprint.text);
		}

		private function initClient() : void {
//			trace('initClient: ' + (_myID));
//			_clientConnection = new NetConnection();
//			_clientConnection.addEventListener(NetStatusEvent.NET_STATUS, onNetStatus);
//			_clientConnection.connect(___url); 
			
			_connector = new PeerConnector();
			_connector.addEventListener(PeerConnectorEvent.CONNECTED, onConnected);
			_connector.addEventListener(ReceiverEvent.DATA_RECEIVED, onData);
			_connector.connect();
			
		}

		private function onData(event : ReceiverEvent) : void
		{
			_recvData.text = event.data.text;
		}

		private function onConnected(event : PeerConnectorEvent) : void
		{
			_myFingerprint.text = _connector.connectionID;
		}
//		private function onNetStatus(event : NetStatusEvent) : void
//		{
////			trace('** onNetStatus: ' + (_myID));
////			trace("** "+event.info.code);
//			switch(event.info.code)
//			{
//				case "NetConnection.Connect.Success":
//					_myID = _clientConnection.nearID;
//					_myFingerprint.text = _myID;
//					initSend();
//					break;
//				case "NetConnection.Connect.Failed":
//					break;
//			}
//		}
//
//		private function initSend() : void
//		{
//			if (!_sendStream)
//			{
////				trace('initSend: ' + (_myID));
//				_sendStream = new NetStream(_clientConnection, NetStream.DIRECT_CONNECTIONS );
//				_sendStream.addEventListener(NetStatusEvent.NET_STATUS, onStreamStatus);
//				_sendStream.publish(OLOLOLOLO);
//				var clientObj : Object = new Object();
//				clientObj.onPeerConnect = onPeerConnect;
//				_sendStream.client = clientObj;
//			}
//		}
//
//		private function onPeerConnect($farNS : NetStream) : Boolean {
////			trace('onPeerConnect: ' + (_myID));
//			_farID = $farNS.farID;
//			_farFingerprint.text = _farID;
//			initRecieve();
//			return true;
//		}
//
//		private function initRecieve() : void
//		{
//			if (!_receiveStream)
//			{
//				trace('initRecieve: ' + (_myID));
//				_receiveStream = new NetStream(_clientConnection, _farID );
//				_receiveStream.addEventListener(NetStatusEvent.NET_STATUS, onStreamStatus);
//				_receiveStream.client = this;
//				_receiveStream.play(OLOLOLOLO);
//			}
//		}
//
//
//
//
//
//
//
//
//
//
//		private function onSendClick(event : MouseEvent) : void
//		{
////			trace('onSendClick: ' + (_myID));
//			_sendStream.send("onSomeDataReceive", {text1:_sendData.text, text2:_sendData.text + "666", boolaenVal:false, intval:42});
//		}
//
//		public function onSomeDataReceive($data : Object): void {
//			
////			trace('onSomeDataReceive: ' + (_myID));
//			for (var i : String in $data) {
//				_recvData.appendText(i + " " + $data[i]);
//			}
//		}
//
//		private function onConnectClick(event : MouseEvent) : void
//		{
////			trace('onConnectClick: ' + (_myID));
//			if (_farFingerprint.text.length)
//			{
//				_farID = _farFingerprint.text;
//				initRecieve();
//			}
//			
//		}
//
//		
//		
//		
//		
//
//		
//
//		private function onStreamStatus(event : NetStatusEvent) : void
//		{
//			trace('** onStreamStatus: ' + (_myID));
//			trace("** "+event.info.code);
//			
//			for (var i : String in event.info) {
//				trace(i + " " + event.info[i]);
//			}
//			
//			switch(event.info.code)
//			{
//				case "NetConnection.Connect.Success":
//					_myID = _clientConnection.nearID;
//					_myFingerprint.text = _myID;
//					initSend();
//					break;
//				case "NetConnection.Connect.Failed":
//					break;
//			}
//		}

	}
}
