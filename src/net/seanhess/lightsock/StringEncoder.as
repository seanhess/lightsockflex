package net.seanhess.lightsock
{
	public class StringEncoder implements IDataEncoder
	{
		public function encode(data:*):String
		{
			return data.toString();
		}   
		
		public function decode(data:String):*
		{
			return data;
		}
	}
}