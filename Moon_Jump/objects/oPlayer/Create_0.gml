/// @description Insert description here
// You can write your code in this editor

accel = 0.2;
decel = 0.2;
spd = 2;
grav = .3;
moveX = 0;
moveY = 0;
last_move = 0;
onGround = false;
jumpforce = 5;
precisionStep = 60;
slideCooldown = 15;
slidePower = 3;

move_r = 0;
move_l = 0;
move_j = 0;
move_s = 0;



playerCanMove = true;
playerCanSlide = true;
playerCanJump = true;
movementEnabled = true;
applyFriction = true;
limitSpd = true;


collisionDir = 0;

//state = stateFree;