package com.ourguy.model
{
	import com.ourguy.util.Constants;
	import com.ourguy.view.Line;
	
	import mx.collections.ArrayCollection;

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
		
		public function lineAdded(line:Line):void
		{
			if(line.j+1<Constants.fieldCols&&line.i+1<Constants.fieldRows)
			{
				if(line.isVertical)
				{
					field[line.i][line.j] += Constants.BOX_LEFT*(line.turn?2:1);
					trace("addded",line.i,line.j,field[line.i][line.j]);
				}else
				{
					field[line.i][line.j] += Constants.BOX_UP*(line.turn?2:1);
					trace("addded",line.i,line.j,field[line.i][line.j]);
				}
			}
			setSecondFlag(line);
		}
		public function setSecondFlag(line:Line):void
		{
			if(line.isVertical)
			{
				if(line.j>0)
				{
					field[line.i][line.j-1] += Constants.BOX_RIGHT*(line.turn?2:1);
					trace("add j-1",field[line.i][line.j-1]);
					
				}
			}else
			{
				if(line.i>0)
				{
					field[line.i-1][line.j] += Constants.BOX_DOWN*(line.turn?2:1);
					trace("add i-1",field[line.i-1][line.j]);
				}
			}
		}
	}
}