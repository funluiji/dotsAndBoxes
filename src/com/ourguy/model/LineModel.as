package com.ourguy.model
{
	public class LineModel
	{
		public var i:int;
		public var j:int;
		public var isVertical:Boolean;
		
		public function LineModel(i:int, j:int, isVert:Boolean)
		{
			this.i = i;
			this.j = j;
			this.isVertical = isVert;
		}
	}
}