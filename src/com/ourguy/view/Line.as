package com.ourguy.view
{
	import com.ourguy.events.TurnEvent;
	import com.ourguy.model.LineModel;
	import com.ourguy.util.Constants;
	
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	
	public class Line extends Sprite
	{
		public var turn:Boolean;
		public var model:LineModel;		
		
		private var _w:Number;
		private var _h:Number;
		private var _color:int;
		
		public function Line(w:Number,h:Number,i:int,j:int,isVertical:Boolean)
		{
			super();
			model = new LineModel(i, j, isVertical);
			_w = w;
			_h = h;
			_color = 0x000000;
			alpha = 0.5;
			mouseChildren = false;
			buttonMode = true;
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