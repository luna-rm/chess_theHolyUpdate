function movePawn(){	
	which = keyboard_check(vk_anykey)
	if(which){
		ability = 0
	}
	
	if(keyboard_lastchar == "1" && !ability){
		ability = 1
		for(var yy=0; yy<boardH; yy++){
		      for(var xx=0; xx<boardW; xx++){
				if(!turn){
					if yy == selectedY-1 && xx == selectedX {
						board_sel[# xx, yy] = 1
					}
				} else {
					if yy == selectedY+1 && xx == selectedX {
						board_sel[# xx, yy] = 1
					}
				}
				
				
			}
		}
		state = 1
	} else if(keyboard_lastchar == "2" && !ability){
		ability = 1
		for(var yy=0; yy<boardH; yy++){
		      for(var xx=0; xx<boardW; xx++){
				if yy == selectedY-1 && xx == selectedX {
					board_sel[# xx, yy] = 1
				}
				if yy == selectedY-2 && xx == selectedX {
					board_sel[# xx, yy] = 1
				}
			}
		}
		state = 1
	}
}

function moveBis(){
	which = keyboard_lastchar
	
	if(which == "1"){
		state = 1
	}
}

function moveHorse(){
	which = keyboard_lastchar
	
	if(which == "1"){
		
	}
}

function moveKing(){
	which = keyboard_lastchar
	
	if(which == "1"){
		
	}
}

function moveQueen(){
	which = keyboard_lastchar
	
	if(which == "1"){
		
	}
}

function moveTower(){
	which = keyboard_lastchar
	
	if(which == "1"){
		
	}
}

mouseX = mouse_x - x
mouseY = mouse_y - y

mouseCellX = mouseX div cellSize
mouseCellY = mouseY div cellSize

var mousePress = mouse_check_button_pressed(mb_left)
var mouseRight = mouse_check_button_pressed(mb_right)

if(mouseRight){
	if ability {
		ability = 0
		for(var yy=0; yy<boardH; yy++){
		      for(var xx=0; xx<boardW; xx++){
				if board_sel[# xx, yy] == 1 {
					board_sel[# xx, yy] = 0
					var auxCircle = instance_nearest(x + xx*16, y + yy*cellSize, oCircle)
					instance_destroy(auxCircle)
				}
			}
		}
	} else if state {
		state = 0
		selectedPiece = -1
		selectedX = -1
		selectedY = -1
		instance_destroy(oSelect)
	}
}


if (state == 1){	
	if selectedPiece == 0 {
		movePawn()
	} else if selectedPiece == 1 {
		moveTower()
	} else if selectedPiece == 2 {
		moveHorse()
	} else if selectedPiece == 3 {
		moveQueen()
	} else if selectedPiece == 4 {
		moveBis()
	} else if selectedPiece == 5{
		moveKing()
	}
	
	for(var yy=0; yy<boardH; yy++){
	      for(var xx=0; xx<boardW; xx++){
			if board_sel[# xx, yy] == 1 {
				instance_create_layer(x + (xx)*cellSize, y + (yy)*cellSize, 10, oCircle)
			}
		}
	}
}


if(mousePress){
	if(!state){
		var arr = board[# mouseCellX, mouseCellY]
		
		if(is_array(arr)){
			aPiece = arr[ar.piece]
			var aTeam = arr[ar.team]
			
			if(aTeam == turn){
				selectedPiece = aPiece
				auxPiece = NaN
				if selectedPiece == 0 {
					auxPiece = oPawn
				} else if selectedPiece == 1 {
					auxPiece = oTower
				} else if selectedPiece == 2 {
					auxPiece = oHorse
				} else if selectedPiece == 3 {
					auxPiece = oQueen
				} else if selectedPiece == 4 {
					auxPiece = oBis
				} else if selectedPiece == 5{
					auxPiece = oKing
				}
			
				aPieceObj = instance_nearest(x + mouseCellX*16, y + (mouseCellY-1)*16, auxPiece)
				
				if(aPieceObj.team == turn){
					selectedX = mouseCellX
					selectedY = mouseCellY
					oSelect = instance_create_layer(x + mouseCellX*16, y + mouseCellY*16, 0, oSelection)
			
					state = 1
				} 
			} else {
				instance_create_layer((mouseCellX+1)*16, (mouseCellY+3)*16, 0, oWrong)
			}
		}
	} else if (state == 1 && ability == 1){
		var arr = board[# mouseCellX, mouseCellY]
		
		//if empty
		if(arr == 0 && board_sel[# mouseCellX, mouseCellY] == 1){
			board[# selectedX, selectedY] = 0
			
			board[# mouseCellX, mouseCellY] = [selectedPiece, turn]
			
			state = 0
			
			turn = !turn
			
			selectedX = -1;
            selectedY = -1;
            selectedPiece = -1;
			
			aPieceObj.x = x + mouseCellX*16
			aPieceObj.y = y + (mouseCellY-1)*16
			aPieceObj.control_depth = 9-mouseCellY
			
			for(var yy=0; yy<boardH; yy++){
				for(var xx=0; xx<boardW; xx++){
					if board_sel[# xx, yy] == 1 {
						board_sel[# xx, yy] = 0
						var auxCircle = instance_nearest(x + xx*16, y + yy*cellSize, oCircle)
						instance_destroy(auxCircle)
					}
				}
			}
			
			instance_destroy(oSelect)
		} else {
			instance_create_layer(x + mouseCellX*16, y + mouseCellY*16, 0, oWrong)
		}
	}
}