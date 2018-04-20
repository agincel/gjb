instance_create_layer(112, 206 + 128, layer_get_id("PlayerLayer"), obj_player);
obj_game_manager.maxJumps = 2;
obj_game_manager.canProject = true;
audio_stop_all();
obj_audio_manager.bgm = audio_play_sound(snd_bgm_laboratory, 0, true);