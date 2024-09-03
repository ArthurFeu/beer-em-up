// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function dano(_x1, _y1, _x2, _y2, _pai = noone) constructor {
	x1 = _x1;
	x2 = _x2;
	y1 = _y1;
	y2 = _y2;
	
	meu_x = other.x;
	meu_y = other.y
	meu_z = other.z;
	cor = c_red
	
	pai = _pai;


	static desenha_area = function(){
		draw_set_color(c_red);
		draw_rectangle(x1 + meu_x, y1 + meu_y + meu_z ,x2 + meu_x , y2 + meu_y + meu_z, true);
		draw_set_color(-1);
	}
	
	static atualiza_posicao = function(){
		meu_x = other.x;
		meu_y = other.y;
		meu_z = other.z
	}
	
	static checha_colisao = function (){
	var _x1, _y1, _x2, _y2;
	_x1 = x1 + meu_x;
	_y1 = y1 * 2 + meu_y + meu_z;
	_x2 = x2 * 2 + meu_x;
	_y2 = y2 * -2 + meu_y + meu_z;
	
	draw_rectangle(_x1,_y1, _x2, _y2,  true)
	
	var _lista = ds_list_create();
	
	var outros = collision_rectangle_list(_x1,_y1, _x2, _y2, obj_entidade, 1, 1, _lista,1);


	var _size = ds_list_size(_lista);
	
	if(_size > 1){
		for(var i = 0; i < _size; i++){
			var _outro = _lista[| i]
			
			if(_outro != pai){
				//var _nome = object_get_name(_outro.object_index);
				
				//show_message(_nome);
				
				var _hurt = _outro.meu_hurtbox;
				
				var _dano = rectangle_in_rectangle(x1 + meu_x, y1 + meu_y + meu_z ,x2 + meu_x , y2 + meu_y + meu_z,
												_hurt.x1 + _hurt.meu_x, _hurt.y1 + _hurt.meu_y + _hurt.meu_z ,_hurt.x2 + _hurt.meu_x , _hurt.y2 + _hurt.meu_y + _hurt.meu_z
				);
				
				if(_dano){
					_outro.vida--;
					_outro.estado = _outro.estado_dano;
				}
			}
		}
	}
	ds_list_destroy(_lista);
}

	
}

function hurtbox(_x1, _y1, _x2, _y2) : dano(_x1, _y1, _x2, _y2) constructor{
	cor = c_white;
}