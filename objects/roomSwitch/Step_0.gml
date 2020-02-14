/// @description Insert description here
// You can write your code in this editor

/*if room == level3{
	if global.player1Score > global.player2Score{
		room_goto(win1_final)	
	} else{
		room_goto(win2_final)
	}
}
if global.totalScore > 0{
	room_goto(newRoom);
}
*/

if room == win1_final or room == win2_final{
	if keyboard_check_pressed(vk_enter){
		game_restart();
	}
}

if room == openner{
	if keyboard_check_pressed(vk_enter){
		room_goto_next();
	}	
}

