package com.ourguy.view
{
	import com.ourguy.util.Constants;
	
	import flash.display.Shape;
	import flash.display.Sprite;
	
	import mx.charts.renderers.CircleItemRenderer;
	
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
		public function	fillBoxUI(i:int,j:int,player:int):void
		{
			var circle:Shape = new Shape();
			circle.graphics.beginFill(player==1?Constants.player1Color:Constants.player2Color,0.6);
			circle.graphics.drawCircle(((j+0.5)*Constants.lineSize)+Constants.lineWidth*0.5,((i+0.5)*Constants.lineSize)+Constants.lineWidth*0.5,(Constants.lineSize-Constants.lineWidth*3)/2);
			addChild(circle);
		}
	}
}