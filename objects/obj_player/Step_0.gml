/// @description Insert description here
// You can write your code in this editor

if (velh != 0) {
	face = sign(velh);
}

estado();

if(is_struct(meu_dano)){
	meu_dano.atualiza_posicao();
	meu_dano.checha_colisao();
}

meu_hurtbox.atualiza_posicao();