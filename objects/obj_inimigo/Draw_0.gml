/// @description Insert description here
// You can write your code in this editor



//draw_self();
//draw_text(x, y - 30, timer_estado);
//draw_circle(x, y, area_visao, true);
draw_sprite_ext(sprite_index, image_index, x, y + z, image_xscale *face, image_yscale, image_angle, image_blend, image_alpha)

//hitbox

//if(is_struct(meu_dano)){
//	//meu_dano.desenha_area();	
	
//	meu_dano.checha_colisao();
//}



var _vida = (vida / vida_max) *100;

var _qtd = vida div vida_barra;



if(vida >0){
	for(var i = 0; i <= _qtd; i++)
	{
		var _cor = cores_vida[i];
	
		var _valor_atual = ((vida % vida_barra)/vida_barra) * 100;
	
		_valor_atual = _valor_atual == 0 ? 100 : _valor_atual;
	
		var _mostra_fundo 
	
		//var _valor = i == _qtd ? _valor_atual : 100;
		
		var _valor;
		if(i == _qtd)
		{
			_valor = _valor_atual;
			
			_mostra_fundo = false;
			
			if(_valor == 100)
			{
				_cor = cores_vida[i - 1]
			}
		} else{
			_valor = 100;
			
			_mostra_fundo = true
		}
	
		draw_healthbar(x- 20, y - 50, x + 20, y - 55, _valor, c_black, _cor, _cor, 0, _mostra_fundo, 1);
	}
}

//meu_hurtbox.desenha_area();