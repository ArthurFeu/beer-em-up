/// @description Insert description here
// You can write your code in this editor

estado = noone;
alvo = noone;

trava_inst = function(_inst = obj_player)
{
	var _x1 = camera_get_view_x(view_camera[0]);
	var _y1 = camera_get_view_y(view_camera[0]);
	
	var _x2 = _x1 + camera_get_view_width(view_camera[0]);
	var _y2 = _y1 + camera_get_view_height(view_camera[0]);
	
	with(_inst)
	{
		//var _marg = sprite_width / 2
		x = clamp(x, _x1 , _x2);
		y = clamp(y, _y1, _y2);
	}
}

estado_parado = function()
{
	
	trava_inst();
	
}


estado_player = function()
{
	if (instance_exists(obj_player)){
		alvo = obj_player;
	} else{
		estado = estado_parado;
		exit
	}
	//x = alvo.x;
	//y = alvo.y
	
	x = lerp(x, alvo.x, .05);
	y = lerp(y, alvo.y, .05);
	


}

estado = estado_player;