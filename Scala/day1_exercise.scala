/*******************************************
**
** Language Scala.
** - Day 1
**      Seven Languages in seven weeks
**
******************************************/

/*
** Write a game that will take a tic-tac-toe board with X, O, and blank
** characters and detect the winner or whether there is a tie or no
** winner yet. Use classes where appropriate.
**
** Bonus problem: Let two players play tic-tac-toe.
*/
class Cell {
 
	var player = " ";
	val playerList = List("X", "O");
 
	def == (target: Cell):Boolean = {
		return(this.getPlayer() == target.getPlayer());
	}

	def getPlayer():String = this.player;
 
	def isFull() = {
		(this.getPlayer() != " ");
	}
 
	def isValidPlayer(player: String) = {
		this.playerList.contains(player);
	}
 
	def setPlayer(newPlayer: String):Unit = {

		if (this.isFull()) {
			throw new IllegalStateException("The cell is occupied by " + this.player);
		}
 
		this.player = newPlayer;
	}
 
	override def toString():String = {

		if (this.isFull()) {
			return(this.getPlayer());
		} else {
			return(".");
		}
	}
}
 
 
class Board {
 
	val board = List(
		new Cell(),
		new Cell(),
		new Cell(),
		new Cell(),
		new Cell(),
		new Cell(),
		new Cell(),
		new Cell(),
		new Cell()
	);
 
	val winningPaths = List(
		List(0, 1, 2),
		List(3, 4, 5),
		List(6, 7, 8),
		List(0, 3, 6),
		List(1, 4, 7),
		List(2, 5, 8),
		List(0, 4, 8),
		List(2, 4, 6)
	);
 
 
	def getWinner():String = {
		
		if (!this.hasWinner) {
			throw new IllegalStateException("There are not winner.");
		}
 
		this.winningPaths.foreach( path =>
 
			if (this.pathContainsWinner(path)) {
				return(this.board(path(0)).getPlayer());
			}
		);
 
		return("");
	}
 
 
	def hasFreeCells():Boolean = {
	
		this.board.foreach( cell =>
			if (!cell.isFull()) {
				return(true);
			}
		);
 
		return(false);
	}
 
 
	def hasNextMove() = {
		(this.hasFreeCells() && !this.hasWinner);
	};
 
	def hasWinner:Boolean = {

		this.winningPaths.foreach( path =>
 
			if (this.pathContainsWinner(path)) {
				return(true);
			}
		);
 
		return(false);
	}
 
 
	def isDrawBoard() = {
		(!this.hasFreeCells() && !this.hasWinner);
	}
 
 
	def pathContainsWinner(path: List[Int]) = {
		val cell1 = this.board(path(0));
		val cell2 = this.board(path(1));
		val cell3 = this.board(path(2));
 
		cell1.isFull() && (cell1 == cell2) && (cell1 == cell3);
	}
 
 
	def setPlayer(cellIndex: Int, player: String) = {
		this.board(cellIndex).setPlayer(player);
	};
 
 
	override def toString():String = {
		return(
			this.board(0) + " | " +
			this.board(1) + " | " +
			this.board(2) + "\n" +
			"---------\n" +
			this.board(3) + " | " +
			this.board(4) + " | " +
			this.board(5) + "\n" +
			"---------\n" +
			this.board(6) + " | " +
			this.board(7) + " | " +
			this.board(8) + "\n"
		);
	};
}
 

class Game {
 
	this.play();

	def getNextPlayer(player: String):String = {

		if (player == "X") {
			return("O");
		} else {
			return("X");
		}
	}
 
 
	def play():Unit = {
 
		var board = new Board();
		var currentPlayer = "X";
		
		println("");
 
		while (board.hasNextMove()) {
 
			println(board);
 
			print("\n" + currentPlayer + ": ");
 
			try {
				var cellIndex = Console.readInt();
 
				board.setPlayer(cellIndex, currentPlayer);
 
				currentPlayer = this.getNextPlayer(currentPlayer);
 
			} catch {
 
				case e:Exception => println("Index not valid.");
			}
 
			println("");
		}
 
		println(board);
 
		if (board.isDrawBoard()) {
			println("Draw!");
		} else {
			
			var win = board.getWinner();
			println(win + " Win!");
		}
 
		print("\nDo you want to play again? ([Y]/N) ");
 
		var play = Console.readLine().toLowerCase();
 
		if ((play == "") || (play == "y")){
 
			this.play();
		}
	}
}
 
var game = new Game();
