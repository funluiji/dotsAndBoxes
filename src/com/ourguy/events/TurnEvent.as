package com.ourguy.events
{
	import com.ourguy.view.Line;
	
	import flash.events.Event;

	public class TurnEvent extends Event
	{
		public static const TURN_FINISHED:String = "TURN_FINISHED";
		public var line:Line;
		public function TurnEvent(type:String, line:Line)
		{
			super(type,true);
			this.line = line;
		}
	}
}