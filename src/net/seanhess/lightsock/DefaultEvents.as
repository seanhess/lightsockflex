package net.seanhess.lightsock
{              
	import flash.events.Event;
	
	public class DefaultEvents
	{       
		public function dataOut(data:String):Event
		{             
			return text(LightSocketEvent.DATA_OUT, data);
		}  
		
		public function dataIn(data:String):Event
		{      
			return text(LightSocketEvent.DATA_IN, data);
		}     
		
		public function error(message:String):Event
		{
			return text(LightSocketEvent.ERROR, message);
		}
		
		public function connected():Event
		{           
			return create(LightSocketEvent.CONNECTED);
		}
		
		public function closed():Event
		{      
			return create(LightSocketEvent.CLOSED);
		} 
		
		public function message(message:ISocketMessage):Event
		{
			var event:LightSocketEvent = create(LightSocketEvent.MESSAGE);
				event.message = message;
				
			return event;
		}
		
		public function text(type:String, text:String):Event
		{
			var event:LightSocketEvent = create(type);
				event.text = text;
			
			return event;
		}
		
		protected function create(type:String):LightSocketEvent
		{
			return new LightSocketEvent(type);
		}
	}
}