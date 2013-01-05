package com.ourguy.view
{
	import com.ourguy.events.TurnEvent;
	import com.ourguy.util.Constants;
	
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	
	public class Line extends Sprite
	{
		
		public var i:Number;
		public var j:Number;
		public var turn:Boolean;
		public var isVertical:Boolean;
		private var _w:Number;
		private var _h:Number;
		private var _color:int;
		public var status:Object;
		
		public function Line(w:Number,h:Number,i:int,j:int,isVertical:Boolean)
		{
			super();
			_w = w;
			_h = h;
			_color = 0x000000;
			alpha = 0.5;
			mouseChildren = false;
			buttonMode = true;
			this.i = i;
			this.j = j;
			this.isVertical = isVertical;
			addEventListener(MouseEvent.CLICK,onClick);
			draw();
		}
		
		protected function onClick(event:MouseEvent):void
		{
			removeEventListener(MouseEvent.CLICK,onClick);
			buttonMode = false;
			graphics.clear();
			_color = Constants.playerColor;
			alpha = 0.8;
			turn = Constants.turn;
			draw();
			dispatchEvent(new TurnEvent(TurnEvent.TURN_FINISHED, this));
		}
		
		protected function draw():void
		{
			graphics.beginFill(_color);
			graphics.drawRect(0, 0, _w, _h);
		}
	}
}