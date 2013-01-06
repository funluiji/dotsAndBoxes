package com.ourguy.algo
{
	import com.ourguy.model.FieldModel;
	import com.ourguy.util.Constants;


	public class AlphaBetaAlgorithm
	{
		public function AlphaBetaAlgorithm()
		{
			
		}
		
		public static function evaluate(fieldModel:FieldModel):int
		{
			var player:int = 0;
			var computer:int = 0;
			var s3:int = 0;
			var s2:int = 0;
			var temp:int = 0;
			for(var i:int = 0;i<Constants.fieldRows-1;i++)
			{
				for(var j:int = 0;j<Constants.fieldCols-1;j++)
				{
					if(fieldModel.field[i][j]<0)
					{
						fieldModel.field[i][j]==-1?player++:computer++;
					}else
					{
						temp = countBoxFilledLines(i,j,fieldModel);
						if (temp==3)
						{
							s3++;
						}else if (temp==2)
						{
							s2++;
						}
					}
				}
			}
			trace((161 + computer*8 - player*8 -(3*s3+2*s2)));
			return 161 + computer*8 - player*8 -(3*s3+2*s2);
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