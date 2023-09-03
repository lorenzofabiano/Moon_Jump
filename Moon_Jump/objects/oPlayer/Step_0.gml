/// @description Insert description here
// You can write your code in this editor

//acquire input

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


var move_right = move_r;
var move_left = move_l;
var move = move_right - move_left;

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

moveY += grav;

if (move_s) && (moveX != 0) && (onGround) && (alarm_get(0) = -1) {
	playerCanMove = false;
	applyFriction = false;
	limitSpd = false;
	sprite_index = sCrouch;
	moveX = sign(moveX) * slidePower;
	alarm_set(0, slideCooldown);
}


if (place_meeting(x,y+1,oWall)) && (place_meeting(x,y-1,oWall)) {
	sprite_index = sCrouch;
} else {
	if (moveX == 0) sprite_index = sPlayer_idle;
}

repeat(precisionStep) {
    var xStep = moveX / precisionStep;
    var yStep = moveY / precisionStep;
	collisionDir = 0;
	//show_debug_message(xStep);

    if (place_meeting(x + xStep, y, oWall)) {
        moveX = 0;
    } else {
        x += xStep;
    }


    if (moveY > 0) {

        if (place_meeting(x, y + yStep, oWall)) {
            onGround = true;
            moveY = 0;
			collisionDir = 1;
        } else {
            y += yStep;
        }
    } else {
		if (place_meeting(x, y + yStep, oWall)) {
            moveY = 0;
			collisionDir = 2;
        } else {
            y += yStep;
        }

      }

}


if collisionDir != 0 {
   // Move the player away from the wall
    switch (collisionDir) {
        case 1: // Down
            while place_meeting(x, y + 1, oWall) {
                y -= 1;
            }
            break;
        case 2: // Up
            while place_meeting(x, y - 1, oWall) {
                y += 1;
            }
            break;
    }
}
/*if (!place_meeting(x,y+1,oWall)) {
	// draw his airborne sprite
	if (moveY < 0) sprite_index = sPlayer_jup; else sprite_index = sPlayer_jdown;
	//audio_play_sound(snGoatLand,1,false);
	// don't animate it
	//image_index = 1;
}
else {
	if (moveX == 0)  {
		 sprite_index = sPlayer_idle;
	}

	else {
		 sprite_index = sPlayer_run;
	}
}
if (moveX !=0) {
	image_xscale = sign(moveX);
	
}*/






