/// @description Insert description here
// You can write your code in this editor

if (velh != 0) {
	face = sign(velh);
}


estado();

meu_hurtbox.atualiza_posicao();

if(is_struct(meu_dano)){
	meu_dano.checha_colisao();	
}