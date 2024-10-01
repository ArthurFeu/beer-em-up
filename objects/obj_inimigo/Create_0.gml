/// @description Insert description here
// You can write your code in this editor

meu_dano = noone;
vida_max = 20;
vida = vida_max;
vida_barra = 5;

cores_vida = [c_aqua, c_green, c_blue, c_yellow, c_fuchsia, c_lime];


velh = 0;
velv = 0;
velz = 0;
vel_max = 1.5;

meu_x = x;
meu_y = y;
alcance_x = 30;
alcance_y = 10;

ponto_x = 0;
ponto_y = 0;
tamanho = 10;

estado = noone;
espera_estado = game_get_speed(gamespeed_fps) * 2;
timer_estado = espera_estado;
area_visao = 80;
_alvo = noone;
timer_ataque = 0;


face = 1;
z = 0;

meu_hurtbox = new hurtbox(-15,0,15,-45);

estado_parado = function() {
	sprite_index = spr_inimigo_idle;
	
	if (timer_ataque > 0) timer_ataque--;
	
	velh = 0;
	velv = 0;
	timer_estado--;
	
	if (timer_estado <= 0){
		var _chance = random(1);
		if (_chance > .5) {
			estado = estado_movement;
		}
		
		timer_estado = espera_estado;
	}
	
	_alvo = estado_checha_area(area_visao, obj_player);
	if (_alvo && timer_ataque <= 0) {
		estado = estado_perseguir;
		timer_ataque = espera_estado;
	}
	
}

estado_movement = function() {
	
	if (timer_ataque > 0) timer_ataque--;
	
	if (sprite_index != spr_inimigo_walk) {
		sprite_index = spr_inimigo_walk;
		image_index = 0;
		
		velh = random_range(-1,1);
		velv = random_range(-1,1);

	}

	timer_estado--;
	
	if(timer_estado <= 0) {
		estado = choose(estado_parado, estado_movement);
		timer_estado = espera_estado;
	}
	
	_alvo = estado_checha_area(area_visao, obj_player);
	if (_alvo) {
		estado = estado_perseguir;
	}
	
}

estado_checha_area = function(_tamanho_area = 0, _alvo = noone) {
	if (_alvo == noone) return false;
	
	return collision_circle(x, y, _tamanho_area, _alvo, 0, 1);	
}

estado_perseguir = function() {
	var _dist = point_distance(meu_x, meu_y, ponto_x, ponto_y);
	
	var _dir = point_direction(meu_x, meu_y, ponto_x, ponto_y);
	
	meu_y = y - sprite_height /2;
	meu_x = x;
	
	ponto_x = _alvo.x;
	ponto_y = _alvo.y - _alvo.sprite_height /2;
	
	var _dist_x = abs(ponto_x - meu_x);
	
	var _dist_y = abs(ponto_y - meu_y);
	

		
	velh = lengthdir_x(_dist_x < 30 ? 0 : .5, _dir);
	velv = lengthdir_y(_dist_y < 5 ? 0 : .5, _dir);
	
	if (sprite_index != spr_inimigo_walk) {
		sprite_index = spr_inimigo_walk;
		image_index = 0;
	}
	
	var _atacar = rectangle_in_rectangle(meu_x, meu_y, meu_x + alcance_x * face, meu_y - alcance_y,
	ponto_x, ponto_y, ponto_x + tamanho * -face, ponto_y - tamanho);
	
	

	if (_atacar) {
		estado = estado_ataque;
	}
}

estado_ataque = function() {
	velh = 0;
	velv = 0;
	if (sprite_index != spr_inimigo_punch){
		sprite_index = spr_inimigo_punch;
		image_index = 0;
	}
	
	if (image_index > image_number - 1) {
		estado = estado_parado;
		delete meu_dano;
	}
}

estado_dano = function(){
	velh = 0;
	velv= 0;
	
	if(sprite_index != spr_inimigo_hurt)
	{
		sprite_index = spr_inimigo_hurt;
		image_index = 0;
	} 
	
	if(image_index > image_number -1)
	{
		
		if(vida <=0){
			estado = estado_morte;
		}
		else{
			estado = estado_parado;	
		}
	}
	

}

estado_morte = function(){
	
	velh = 0;
	velv = 0;
	
	image_speed = 0.1;
	image_alpha -= .02;
	
	if(image_alpha <= 0)
	{
		instance_destroy();
	}
}

estado_espera = function ()
{
	sprite_index = spr_inimigo_idle;
	velh = 0;
	velv = 0;
}

estado_andando = function()
{
	sprint_index = spr_inimigo_walk;
}


estado = estado_parado;