// REQUIRES : Adobe's corelib
package net.seanhess.lightsock
{
	import net.seanhess.json.JSON;
	
	public class JsonEncoder implements IDataEncoder
	{
		public function encode(data:*):String
		{                 
			return JSON.encode(data);
		}   
		
		public function decode(data:String):*
		{
			trace("DATA " + data);
			try {
				return JSON.decode(data);
			}
			catch (e:*)
			{
				return null;
			}
		}
	}
}