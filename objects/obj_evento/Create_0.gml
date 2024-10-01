/// @description Insert description here
// You can write your code in this editor
fazer = true;

action = function()
{
	
}

cria_inimigos = function(_qtd)
{
	for(var i =0; i< _qtd; i++)
	{
		instance_create_layer(x + random_range(150, 200), y + random_range(-50,50), "colisores", obj_inimigo);
	}
}