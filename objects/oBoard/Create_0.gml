//Array contents
enum ar{
    piece,
    team,
	obj
}

//Pieces
enum piece{
    pawn,
    tower,
    horse,
	queen,
	bis,
	king
}

//Board
cellSize = 16;
boardW = 8;
boardH = 9;

board = ds_grid_create(boardW, boardH);
board_sel = ds_grid_create(boardW, boardH)

//Vars
turn = 0;
state = 0;
aPiece = -1

board[# 0, 0] = [piece.tower, 1]
board[# 0, boardH-1] = [piece.tower, 0]
board[# boardW-1, 0] = [piece.tower, 1]
board[# boardW-1, boardH-1] = [piece.tower, 0]

board[# 1, 0] = [piece.horse, 1]
board[# 1, boardH-1] = [piece.horse, 0]
board[# boardW-2, 0] = [piece.horse, 1]
board[# boardW-2, boardH-1] = [piece.horse, 0]

board[# 2, 0] = [piece.bis, 1]
board[# 2, boardH-1] = [piece.bis, 0]
board[# boardW-3, 0] = [piece.bis, 1]
board[# boardW-3, boardH-1] = [piece.bis, 0]

board[# boardW-4, 0] = [piece.king, 1]
board[# boardW-4, boardH-1] = [piece.king, 0]

board[# 3, 0] = [piece.queen, 1]
board[# 3, boardH-1] = [piece.queen, 0]

for(var i = 0; i < boardW; i++){
	board[# i, 1] = [piece.pawn, 1]
	board[# i, boardH-2] = [piece.pawn, 0]
}

ability = 0