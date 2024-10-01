//Evento 1 da cena 1


action = function()
{
	with(obj_camera)
	{
		
		espera_player = function()
		{
			trava_inst();
			
			var _qtd = 0;
			
			for(var i =0; i < array_length(lista);i++)
			{
				if(instance_exists(lista[i]))
				{
					_qtd++
				}
			}
			if(_qtd <= 0)
			{
				estado = estado_player;
			}
		}
		
		espera_inimigo = function()
		{
			if(alarm[0] == -1)
			{
				alarm[0] = room_speed *2;
			}
			if(alarm[0] == 0)
			{
				
				for(var i = 0; i< array_length(lista); i++)
				{
				with(lista[i])
				{
					estado = estado_perseguir;
					_alvo = obj_player;
					
					obj_player.estado = obj_player.estado_idle;
				}
				}
				
				estado = espera_player;
				
			}
			
			show_debug_message(alarm[0])
		}
		
		cria_inimigos = function(){
			
			lista = [];
			
			lista[0] = instance_create_layer(896, 172, "colisores", obj_inimigo);				
			lista[1] = instance_create_layer(704, 160, "colisores", obj_inimigo);				
			lista[2] = instance_create_layer(768, 224, "colisores", obj_inimigo);				

			for(var i =0; i <3; i++)
			{
				with(lista[i])
				{
					estado = estado_andando;
					velh = -1;
				}
			}
			
			estado = espera_inimigo;
		}
		
		
		move_direita = function()
		{
			if(x < 574)
			{
				x +=1;
			}else
			{
				
				estado = cria_inimigos;
			}
			
			trava_inst();
		}
		
		estado = move_direita;
	}
	
	with(obj_player)
	{
		estado = estado_espera
	}
	
}