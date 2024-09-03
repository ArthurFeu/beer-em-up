/// @description Insert description here
// You can write your code in this editor

meu_dano = noone;
vida = 100;

velh = 0;
velv = 0;
velz = 0;

face = 1;
vel_max = 1.5;
estado = noone;
z=0;

meu_hurtbox = new hurtbox(-8,0,8,-40);

controla_player = function() {
	var _up, _down, _left, _right, _jump, _kick,_punch;

	_up = keyboard_check(ord("W"));
	_down = keyboard_check(ord("S"));
	_left = keyboard_check(ord("A"));
	_right = keyboard_check(ord("D"));
	
	_kick = keyboard_check_pressed(ord("J"));
	_punch = keyboard_check_pressed(ord("K"));

	velh = (_right - _left) * vel_max;
	velv = (_down - _up) * vel_max;
	
	if (_kick) {
		estado = estado_chute;
	}
	
	if (_punch) {
		estado = estado_soco;
	}
}



estado_idle = function(){
	sprite_index = spr_player_idle;	
	controla_player();
	
	if (velh != 0 or velv != 0) {
		estado = estado_walk;	
	}
}

estado_walk = function() {
	sprite_index = spr_player_walk;
	controla_player();
	
	if (velh == 0 && velv == 0) {
		estado = estado_idle;	
	}
}

estado_chute = function () {
	
	velh = face * vel_max *4;
	velh = 0;

	
	if (sprite_index != spr_player_kick) {
		image_index = 0;
		sprite_index = spr_player_kick;
	}
	sprite_index = spr_player_kick;
	
	if (image_index >= image_number -1) {
		estado = estado_idle;
		
		delete meu_dano;
	}
}

estado_soco = function () {
	if (sprite_index != spr_player_punch) {
		image_index = 0;
		sprite_index = spr_player_punch;
	}
	sprite_index = spr_player_punch;
	
	if (image_index >= image_number -1) {
		estado = estado_idle;
		delete meu_dano;
	}
}

estado_dano = function(){
	image_blend = c_red;
}


estado = estado_idle;