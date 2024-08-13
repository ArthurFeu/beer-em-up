/// @description Insert description here
// You can write your code in this editor


velh = 0;
velv = 0;
velz = 0;
vel_max = 1.5;

estado = noone;
espera_estado = game_get_speed(gamespeed_fps) * 2;
timer_estado = espera_estado;
area_visao = 80;
_alvo = noone;
timer_ataque = 0;

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
	var _dist = point_distance(x, y, _alvo.x, _alvo.y);
	
	var _dir = point_direction(x, y, _alvo.x, _alvo.y);
		
	velh = lengthdir_x(.5, _dir);
	velv = lengthdir_y(.5, _dir);
	
	if (sprite_index != spr_inimigo_walk) {
		sprite_index = spr_inimigo_walk;
		image_index = 0;
	}
	
	if (_dist <= 25) {
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
	}
}

estado = estado_parado;