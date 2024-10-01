/// @description Insert description here
// You can write your code in this editor


//draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, true)

draw_sprite_ext(sprite_index, image_index, x, y + z, face, image_yscale, image_angle, image_blend, image_alpha)

if(is_struct(meu_dano)){
	//meu_dano.desenha_area();	
}

var _qtd = vida div vida_barra;



if(vida >0){
	for(var i = 0; i <= _qtd; i++)
	{
		var _cor = cores_vida[i];
	
		var _valor_atual = ((vida % vida_barra)/vida_barra) * 100;
	
		_valor_atual = _valor_atual == 0 ? 100 : _valor_atual;
	
		var _mostra_fundo = !(i == _qtd);
	
		var _valor = i == _qtd ? _valor_atual : 100;
	
		draw_healthbar(x- 20, y - 50, x + 20, y - 55, _valor, c_black, _cor, _cor, 0, _mostra_fundo, 1);
	}
}

if (estado == estado_game_over)
{
    draw_text(room_width / 2 - 50, room_height / 2, "GAME OVER");
}

//meu_hurtbox.desenha_area();