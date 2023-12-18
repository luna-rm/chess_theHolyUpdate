event_inherited()

if(!team){
	draw_sprite(w_tower, 0, x, y)
	depth = 1
} else {
	draw_sprite(b_tower, 0, x, y)
	depth = 9
}