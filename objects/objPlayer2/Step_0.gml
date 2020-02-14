/// @description Insert description here
/// @description Insert description here
///Get the Player's Input
keyRight = keyboard_check(vk_right);
keyLeft = -keyboard_check(vk_left);
keyJump = keyboard_check_pressed(vk_up);


//React to the player's inputs
move = keyLeft + keyRight;
if (keyLeft = -1) previous_dir = -1;
if (keyRight = 1) previous_dir = 1;

//Acceleration
if (hsp < max_hsp) && (hsp > -max_hsp)
{
    hsp += move * movespeed;
}
else if (hsp = max_hsp)
{
    if (keyRight)
    {
        hsp = max_hsp;
    }
    else
    {
        hsp -= 1
    }
}
else if (hsp = -max_hsp)
{
    if (keyLeft)
    {
        hsp = -max_hsp;
    }
    else
    {
        hsp += 1;
    }
}
if (hsp > 0) && (keyLeft = 0) && (keyRight = 0) && (place_meeting(x,y+1,boundary)){
	hsp -= .5
}

if (hsp < 0) && (keyLeft = 0) && (keyRight = 0) && (place_meeting(x,y+1,boundary)) {
	hsp += .5
}

//Gravity
if (vsp < 10) vsp += grav;

if (place_meeting(x,y+1,boundary))
{
    vsp = keyJump * -jumpspeed * 1.5
}
//Wall Jumps
if (place_meeting(x+1,y,boundary)) && (!place_meeting(x-1,y,boundary))
{
    if (keyJump) && (!place_meeting(x,y+1,boundary))
    {
        vsp -= 15;
        hsp -= 5;
    }
}

if (place_meeting(x-1,y,boundary)) && (!place_meeting(x+1,y,boundary))
{
    if (keyJump) && (!place_meeting(x,y+1,boundary))
    {
        grav = normal_grav;;
        vsp -= 15;
        hsp += 5;
    }
}

//Wall Slides Left
    if (keyLeft = -1) && (vsp > 0) && (place_meeting(x-1,y,boundary)) && (!place_meeting(x,y+1,boundary))
    {
        if (vsp <= 11) && (vsp > 1.5) vsp -= 1;
        if (vsp <= 11)  && (vsp > 0) grav = .05;
  
    }
    if (keyLeft = -1 && (place_meeting(x-1,y,boundary)) && (!place_meeting(x,y+1,boundary)))
    {
        grav = normal_grav;
    }
    if (keyLeft = 0)
    {
        grav = normal_grav;
    }
//Wall Slides Right
    if (keyRight = 1) && (vsp > 0) && (place_meeting(x+1,y,boundary)) && (!place_meeting(x,y+1,boundary))
    {
        if (vsp <= 16) && (vsp > 1.5) vsp -= 1;
        if (vsp < 10)  && (vsp > 0) grav = .05;
  
    }
    if (keyRight = 1 && (place_meeting(x+1,y,boundary)) && (!place_meeting(x,y+1,boundary)))
    {
        grav = normal_grav;
    }
    if (keyRight = 0)
    {
        grav = normal_grav;
    }

//Horizontal Collision
if (place_meeting(x+hsp,y,boundary))
{
while(!place_meeting(x+sign(hsp),y,boundary))
{
 x += sign(hsp);
}
hsp = 0;
}
x += hsp;

//Vertical Collision
if (place_meeting(x,y+vsp,boundary))
{
while(!place_meeting(x,y+sign(vsp),boundary))
{
 y += sign(vsp);
}
vsp = 0;
}

y += vsp;


if place_meeting(x,y,objPlayer1){
	if objPlayer1.y < y-20{
		with(objPlayer1) jumpspeed = -7;
		global.player1Score += 1;
		global.totalScore += 1;
		if global.player1Score > global.player2Score and global.totalScore == 3{
			room_goto(win1_final);
		} else if global.player1Score < global.player2Score and global.totalScore == 3{
			room_goto(win2_final);
		}else{
			room_goto_next();	
		}
	}
}
