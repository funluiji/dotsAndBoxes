package com.ourguy.util
{
	public class Constants
	{
		public static var dotSize:Number = 5;
		public static var fieldRows:int = 4;
		public static var fieldCols:int = 4;
		public static var lineSize:int = 50;
		public static var lineWidth:int = 5;
		public static var player1Color:int = 0xD14153;
		public static var player2Color:int = 0x4452FB;
		public static var turn:Boolean = false;
		
		public static const	BOX_RIGHT:int = 10;
		public static const	BOX_DOWN:int = 1;
		public static const	BOX_UP:int = 100;
		public static const	BOX_LEFT:int = 1000;
		
		public static const	ALGO_DEPTH:int = 9;
		
		public function Constants()
		{
		}
		
		public static function get playerColor():int
		{
			return turn?player2Color:player1Color;
		}
	}
}