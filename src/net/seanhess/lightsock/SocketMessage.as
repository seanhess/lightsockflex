package net.seanhess.lightsock
{
	public class SocketMessage implements ISocketMessage
	{                              
		public static const ALL:String = "ALL";
		         
		[Bindable] public var type:String;
		[Bindable] public var to:String = ALL;            
		[Bindable] public var data:*;      
		[Bindable] public var from:int;            
		
		public function encode():String
		{
			return '<message type="' + type + '" to="'+ to +'"><data><![CDATA['+ encodeData() +']]></data></message>'
		}             
		
		public function decode(raw:String):*
		{
			var xml:XML = new XML(raw);
			type = xml.@type;
			to = xml.@to;            
			from = new Number(xml.@from);
			data = decodeData(xml.data);
		}
		
		public function encodeData():String
		{
			return (new JsonEncoder()).encode(data);
		}           
		
		public function decodeData(data:String):*
		{
			return (new JsonEncoder()).decode(data);
		}
		
		public function clone():ISocketMessage
		{
			return new SocketMessage();
		}
	}
}