package com.ourguy.model
{
	import com.ourguy.util.Constants;

	public class FieldModel extends Object
	{
		public var field:Array;
		public function FieldModel()
		{
			super();
			field = new Array();
			for(var i:int = 0;i<Constants.fieldRows;i++)
			{
				field.push(new Array());
				for(var j:int = 0;j<Constants.fieldCols;j++)
				{
					field[i].push(0);
				}
			}
		}
	}
}