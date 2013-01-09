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
		public function copy():FieldModel
		{
			var tempField:FieldModel = new FieldModel;
			tempField.field = new Array();
			for each(var item:Array in this.field)
			{
				tempField.field.push(item.concat());
			}
			return tempField;
			
		}
	}
}