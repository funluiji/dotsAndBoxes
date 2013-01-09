package com.ourguy.algo
{
	import com.ourguy.model.FieldModel;
	import com.ourguy.model.LineModel;
	import com.ourguy.util.Constants;


	public class AlphaBetaAlgorithm
	{
		private var checkedBox:Boolean = false;
		public var rightMove:LineModel;

		public function AlphaBetaAlgorithm()
		{
			
		}
//		function alphabeta(node, depth, α, β, Player)         
//			if  depth = 0 or node is a terminal node
//			return the heuristic value of node
//			if  Player = MaxPlayer
//			for each child of node
//			α := max(α, alphabeta(child, depth-1, α, β, not(Player) ))     
//			if β ≤ α
//			break                             (* Beta cut-off *)
//			return α
//			else
//			for each child of node
//			β := min(β, alphabeta(child, depth-1, α, β, not(Player) ))     
//			if β ≤ α
//			break                             (* Alpha cut-off *)
//			return β
//			(* Initial call *)
//			alphabeta(origin, -1, -infinity, +infinity, MaxPlayer)
		
		public function algorithm(fieldModel:FieldModel,depth:int,alpha:int,beta:int,turn:Boolean,moves:Array = null):int
		{
			//get all moves
			var move:LineModel;
			var algoField:FieldModel;
			var i:int;
			var forLenght:int = moves.length;
//			if(depth == -1)
//			{
//				moves = AlgoUtils.checkForEmptyLines(fieldModel);
//				depth = moves.length;
//			}else 
			if(depth == 0)
			{
//				/trace("Evaluate:",evaluate(fieldModel), moves.length)
				return evaluate(fieldModel);
			}
			if(turn)
			{
				for(i=0;i<forLenght; i++)
				{
					move = moves.shift();//TBD: MAKE MOVE
					algoField = lineAdded(move,fieldModel.copy());
					if(checkedBox)
					{
						checkedBox = false;
					}else
					{
						turn = !turn;
					}
					alpha = Math.max(alpha,algorithm(algoField,int(depth-1),alpha,beta,turn,moves));
					moves.push(move);
					if(beta<=alpha) break;
				}
				rightMove = move;
				return alpha;
				
			}else
			{
				for(i=0;i<forLenght ; i++)
				{
					move = moves.shift();//TBD: MAKE MOVE
					algoField = lineAdded(move,fieldModel.copy())
					if(checkedBox)
					{
						checkedBox = false;
					}else
					{
						turn = !turn;
					}
					beta = Math.min(beta,algorithm(algoField,depth-1,alpha,beta,turn,moves));//TODO: change turn if nesesary
					moves.push(move);
					if(beta<=alpha) break;
				}
				return beta;
			}
		}
		
		public function algorithm2(fieldModel:FieldModel,depth:int,alpha:int,beta:int,turn:Boolean,moves:Array = null):int
		{
			var move:LineModel;
			var algoField:FieldModel;
			var i:int;
			var forLenght:int = moves.length;
			var eval:int;
			if(depth == 0)
			{
				return evaluate(fieldModel);
			}
			var oldTurn:Boolean = turn;
			for(i=0;i<forLenght; i++)
			{
				move = moves.shift();//TBD: MAKE MOVE
				algoField = lineAdded(move,fieldModel.copy());
				if(checkedBox)
				{
					checkedBox = false;
				}else
				{
					turn = !turn;
				}
				eval = algorithm2(algoField, depth-1,alpha,beta,turn,moves);
				if(oldTurn)
				{
					if(eval>alpha)
					{
						alpha = eval
						rightMove=move;
						trace("BEST MOVE",turn,move.i,move.j,move.isVertical,alpha);
					}
				}else
				{
					if(eval<beta)
					{
						beta = eval
					}
				}
				//trace("evaluating",depth,alpha,beta,turn,oldTurn)
				if(beta<=alpha)
				{
					moves.push(move);
					break;
				}
				moves.push(move);
			}
			if(oldTurn) return alpha;
			else return beta;
			
		}
		public  function lineAdded(line:LineModel,fieldModel:FieldModel):FieldModel
		{
			if(line.j+1<Constants.fieldCols&&line.i+1<Constants.fieldRows)
			{
				if(line.isVertical)
				{
					fieldModel.field[line.i][line.j] += Constants.BOX_LEFT*(line.turn?2:1);
					
				}else
				{
					fieldModel.field[line.i][line.j] += Constants.BOX_UP*(line.turn?2:1);
				}
				if(isBoxFull(fieldModel.field[line.i][line.j]))
				{
					fieldModel.field[line.i][line.j] = -1*(line.turn?2:1);
				}
			}
			fieldModel = setSecondFlag(line,fieldModel);
			return fieldModel;
		}
		
		public function setSecondFlag(line:LineModel,fieldModel:FieldModel):FieldModel
		{
			if(line.isVertical)
			{
				if(line.j>0)
				{
					fieldModel.field[line.i][line.j-1] += Constants.BOX_RIGHT*(line.turn?2:1);			
					if(isBoxFull(fieldModel.field[line.i][line.j-1]))
					{
						fieldModel.field[line.i][line.j-1] = -1*(line.turn?2:1);
					}
				}
			}else
			{
				if(line.i>0)
				{
					fieldModel.field[line.i-1][line.j] += Constants.BOX_DOWN*(line.turn?2:1);
					if(isBoxFull(fieldModel.field[line.i-1][line.j]))
					{
						fieldModel.field[line.i-1][line.j] = -1*(line.turn?2:1);
					}
				}
			}
			return fieldModel;
		}
		
		public function isBoxFull(box:int):Boolean
		{
			if(box>Constants.BOX_LEFT&&(box=box%Constants.BOX_LEFT)>Constants.BOX_UP&&(box=box%Constants.BOX_UP)>Constants.BOX_RIGHT&&(box=box%Constants.BOX_RIGHT)>=1)
			{
				checkedBox = true;
				return true;
			}
			return false;
		}
		
		public function evaluate(fieldModel:FieldModel):int
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
					if(fieldModel.field[i][j]==-1)
					{
						computer++;
					}else if(fieldModel.field[i][j]==-2)
					{
						player++;
					}else
					{
						temp = AlgoUtils.countBoxFilledLines(i,j,fieldModel);
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
			//trace((computer*8 - player*8 -(3*s3+2*s2)));
			return computer*8 - player*8-(3*s3)//+2*s2);
		}
		
	}
}