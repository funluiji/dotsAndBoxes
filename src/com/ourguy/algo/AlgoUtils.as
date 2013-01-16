package com.ourguy.algo
{
	import com.ourguy.model.FieldModel;
	import com.ourguy.model.LineModel;
	import com.ourguy.util.Constants;

	public class AlgoUtils
	{
		public function AlgoUtils()
		{
		}
		
		public static function checkForEmptyLines(fieldModel:FieldModel):Array
		{
			var emptyLines:Array = new Array();
			for(var i:int = 0;i<Constants.fieldRows-1;i++)
			{
				for(var j:int = 0;j<Constants.fieldCols-1;j++)
				{
					if(fieldModel.field[i][j] >= 0)
					{
						emptyLines.push.apply( null, checkBoxForEmptyLines(i, j,fieldModel));		
					}
				}
			}
			return emptyLines;
		}
		
		public static function checkBoxForEmptyLines(i:int, j:int,fieldModel:FieldModel):Array
		{
			var result:Array = new Array();
			var tempLine:LineModel;
			var box:int = fieldModel.field[i][j];
			if(box<Constants.BOX_LEFT)
			{
				tempLine = new LineModel(i, j, true);
				result.push(tempLine);
			}
			if((box %= Constants.BOX_LEFT)<Constants.BOX_UP)
			{
				tempLine = new LineModel(i, j, false);
				result.push(tempLine);
			}
			
			if(j == Constants.fieldCols-2 && ((box %= Constants.BOX_UP)<Constants.BOX_RIGHT))
			{
				tempLine = new LineModel(i,j+1,true);
				result.push(tempLine);
				
			}
			if(i == Constants.fieldRows-2 && ((box %= Constants.BOX_RIGHT)<Constants.BOX_DOWN))
			{
				tempLine = new LineModel(i+1,j,false);
				result.push(tempLine);
			}
			
			return result;
		}
		public static function countBoxFilledLines(i:int, j:int, fieldModel:FieldModel):int
		{
			if(i>=0 && i<=Constants.fieldRows && j>=0 && j<=Constants.fieldCols)
			{
				var linesCount:int = 0;
				var box:String = fieldModel.field[i][j].toString();
				for(var i:int = 0; i<box.length; i++)
				{
					if(box.charAt(i) != "0")
					{
						linesCount++;		
					}
				}
				return linesCount;
			}
			return -1;
		}
	
	}
}