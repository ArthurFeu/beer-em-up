// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function dano(_x1, _y1, _x2, _y2) constructor {
	x1 = _x1;
	x2 = _x2;
	y1 = _y1;
	y2 = _y2;
	
	meu_x = other.x;
	meu_y = other.y
	
	static desenha_area = function(){
		draw_rectangle(x1 + meu_x,y1 + meu_y,x2 + meu_x ,y2 +meu_y, true);
	}
}