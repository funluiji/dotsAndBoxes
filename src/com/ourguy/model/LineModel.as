package com.ourguy.model
{
	import com.ourguy.util.Constants;

	public class LineModel
	{
		public var i:int;
		public var j:int;
		public var isVertical:Boolean;
		public var turn:Boolean;
		
		public function LineModel(i:int, j:int, isVert:Boolean,turn:Boolean = false)
		{
			this.i = i;
			this.j = j;
			this.isVertical = isVert;
			this.turn = turn;
		}
	}
}