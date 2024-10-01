/// @description Insert description here
// You can write your code in this editor

restart = false

meu_dano = noone;
vida_max = 20;
vida = vida_max;
vida_barra = 5;

cores_vida = [c_aqua, c_green, c_blue, c_yellow, c_fuchsia, c_lime];

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
	
	_kick = keyboard_check_pressed(ord("K"));
	_punch = keyboard_check_pressed(ord("J"));

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
	velh = 0;
	velv = 0;
	
	if(sprite_index != spr_player_hurt)
	{
		sprite_index = spr_player_hurt;
		image_index = 0;
	}
	
	if(image_index >= image_number -1)
	{
		
		if(vida<=0)
		{
			estado = estado_morte;
			restart = true;
			if (keyboard_check_pressed(vk_space))
		    {
		        room_restart()
		    }
		}else{
		estado = estado_idle;
		}
	}
}

estado_espera = function ()
{
	sprite_index = spr_player_idle;
	velh = 0;
	velv = 0;
}

estado_andando = function()
{
	sprint_index = spr_player_walk;
}

estado_morte = function()
{
	velh = 0;
	velv = 0;
	
	image_speed = 0.1;
	image_alpha -= .02;
	
	if(image_alpha <= 0)
	{
		estado = estado_game_over;
	}
}

estado_game_over = function()
{
    velh = 0;
    velv = 0;
    
    
  
    
    
    if (keyboard_check_pressed(vk_anykey) || mouse_check_button_pressed(mb_left))
    {
        
        room_restart(); 
    }
}

estado = estado_idle;