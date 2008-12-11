package net.seanhess.lightsock
{
	public interface ISocketMessage
	{
		function encode():String;
		function decode(raw:String):*;
		function clone():ISocketMessage;
		function get type():String;
		function get from():int;
		function get data():*;
	}
}