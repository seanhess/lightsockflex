package net.seanhess.lightsock
{         
	import flash.events.TextEvent;
	
	public class LightSocketEvent extends TextEvent
	{
		public static const DATA_OUT:String = "dataOut";
		public static const DATA_IN:String = "dataIn";
		public static const CONNECTED:String = "connected";
		public static const CLOSED:String = "closed";
		public static const ERROR:String = "error";
		public static const MESSAGE:String = "message";
		
		public var message:ISocketMessage;
		      
		public function LightSocketEvent(type:String)
		{
			super(type);
		}
		
	}
}