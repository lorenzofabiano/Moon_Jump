// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
stateFree = function(){
	if (movementEnabled) {

		if (playerCanMove) {
		
			move_r = keyboard_check(vk_right);
			move_l = keyboard_check(vk_left);
		}

		if (playerCanSlide) {
	
			move_s = keyboard_check_pressed(vk_down);
		}

		if (playerCanJump) {
	
			move_j = keyboard_check_pressed(vk_up);
		}


	}
	//many thanks to https://www.reddit.com/r/gamemaker/comments/5my5jr/deductadd_onto_the_value_until_the_value_is_zero/
	if (applyFriction) {
	 if move == 0 {
		 var ht = moveX;
		 if moveX != 0 {
		     moveX -= sign(moveX) * decel;
		     if sign(ht) != sign(moveX) moveX = 0;
		 }
	 }
	}

	if (limitSpd) {
		moveX = clamp(moveX + accel * move, -spd, spd);
	}

	if (move_j && onGround) {
	    moveY -= jumpforce
		onGround = false;
	
		if (alarm[0] > 0) {
			//moveX = 0;
			alarm[0] = 1;
		}
	}
}