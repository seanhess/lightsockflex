package net.seanhess.lightsock
{
	import flash.net.XMLSocket;
   	import flash.events.*;
	
	public class Client extends EventDispatcher
	{
		protected var socket:XMLSocket;
		public var host:String;
		public var port:int;      
		public var connected:Boolean = false; 
		public var closing:Boolean = false;    
		protected var events:DefaultEvents = new DefaultEvents();
		
		protected var queue:Array;
		
		public function Client(host:String, port:int)
		{
			this.host = host;
			this.port = port;     
			this.queue = new Array();
			socket = new XMLSocket();        
			configureListeners();    
		}                
		
		private function configureListeners():void {
            socket.addEventListener(Event.CLOSE, onClose);
            socket.addEventListener(Event.CONNECT, onConnect);
            socket.addEventListener(DataEvent.DATA, onData);
            socket.addEventListener(IOErrorEvent.IO_ERROR, onError);
            //socket.addEventListener(ProgressEvent.PROGRESS, onProgress);
            socket.addEventListener(SecurityErrorEvent.SECURITY_ERROR, onError);
        }
		
		public function connect():void
		{
			socket.connect(host, port);
		}           
		
		public function close():void
		{                    
			closing = true;
			sendQueue();
		}
		
		private function onError(event:ErrorEvent):void
		{
			dispatchEvent(events.error(event.text));
		}      
		
		public function send(message:ISocketMessage):void
		{                                                                                                              
			sendString(message.encode());
		}
		            
		public function sendString(message:String):void
		{                
			queue.push(message);
			sendQueue();
		}          
		
		private function sendQueue():void
		{
			if (connected)
			{    
				for each (var message:String in queue)
				{
					socket.send(message);
					dispatchEvent(events.dataOut(message));
				}                                     
				
				queue = [];	// reset the array
			}  
			
			if (closing && queue.length < 1)
			{                     
				socket.close();
				connected = false;
			}
		}
		
		private function onConnect(event:Event):void
		{
			connected = true;            
			sendQueue();
			dispatchEvent(events.connected());
		}
		
		private function onClose(event:Event):void
		{
			dispatchEvent(events.closed());
		}
		
		private function onData(event:DataEvent):void
		{            
			dispatchEvent(events.dataIn(event.text));
			var message:ISocketMessage = decodeMessage(event.text);
			dispatchEvent(events.message(message));
		}                      
		
		private function decodeMessage(raw:String):ISocketMessage
		{
			var message:ISocketMessage = new SocketMessage();
				message.decode(raw);
				
			return message;
		}
	}
}