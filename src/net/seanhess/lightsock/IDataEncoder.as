package net.seanhess.lightsock
{
	public interface IDataEncoder
	{
		function encode(data:*):String;
		function decode(data:String):*;
	}
}