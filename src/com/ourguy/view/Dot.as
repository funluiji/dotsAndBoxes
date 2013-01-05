package com.ourguy.view
{
	import flash.display.Sprite;
	
	public class Dot extends Sprite
	{
		private var _rad:Number;
		private var _color:int;
		public var status:Object;
		
		public function Dot(rad:Number = 5.0, color:int = 0xEEEEEE)
		{
			super();
			_rad = rad;
			_color = color;
			draw();
		}
		
		protected function draw():void
		{
			graphics.beginFill(_color);
			graphics.drawRect(0, 0, _rad,_rad);
		}
	}
}