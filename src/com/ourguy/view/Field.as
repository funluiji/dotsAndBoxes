package com.ourguy.view
{
	import com.ourguy.util.Constants;
	
	import flash.display.Sprite;
	
	public class Field extends Sprite
	{
		public function Field()
		{
			super();
			var dot:Dot;
			var line:Line;
			for(var i:int = 0;i<Constants.fieldRows;i++)
			{
				for(var j:int = 0;j<Constants.fieldCols;j++)
				{
					dot = new Dot(Constants.dotSize);
					dot.x = j*Constants.lineSize;
					dot.y = i*Constants.lineSize;
					addChild(dot);
					if(j<(Constants.fieldCols-1))//horizontal lines
					{
						line = new Line(Constants.lineSize - Constants.lineWidth ,Constants.lineWidth,i,j,false);
						line.x = dot.x +Constants.lineWidth;
						line.y = dot.y;
						addChild(line);		
					}
					if(i<(Constants.fieldRows-1))//vertical lines
					{
						line = new Line(Constants.lineWidth,Constants.lineSize - Constants.lineWidth,i,j,true);
						line.x = dot.x;
						line.y = dot.y +Constants.lineWidth;
						addChild(line);
					}
					
				}
			}
			
		}
	}
}