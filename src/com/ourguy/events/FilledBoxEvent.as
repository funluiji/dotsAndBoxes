package com.ourguy.events
{
	import flash.events.Event;
	
	public class FilledBoxEvent extends Event
	{
		public static const BOX_FILLED:String = "BOX_FILLED";
		public var i:int;
		public var j:int;
		public var player:int;
		public function FilledBoxEvent(type:String, i:int,j:int,player:int)
		{
			super(type,true);
			this.i = i;
			this.j = j;
			this.player = player;
		}
	}
}