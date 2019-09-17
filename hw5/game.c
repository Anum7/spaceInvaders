#include <stdlib.h>
#include "myLib.h"
#include "game.h"
#include "startPage.h"
#include "pausePage.h"
#include "winPage.h"
#include "losePage.h"
#include "gamePage.h"


TANK tank;
ENERGY energy[ENERGYCOUNT];
ANISPRITE enemies[ENEMYCOUNT];
BULLET bullet[BULLETCOUNT];
SPRITEBULLET enemyBullet[ENEMYBULLETCOUNT];

//variables
volatile int remaining;
volatile int lastCol;
volatile int firstCol;
volatile int lastColDel;
volatile int firstColDel;
volatile int lastRow;
volatile int lastRowDel;
volatile int livesRemaining;
 
//initializing game elements
void initGame() {
	remaining = 30;
    lastCol = 89;
    firstCol = 5;
    lastColDel = 10;
    firstColDel = 10;
    lastRow = 65;
    lastRowDel = 10;
    livesRemaining = 2;
}

//initialize Tank
void initTank() {
    tank.width = 20;
    tank.height = 20;
    tank.cdel = 2;
    tank.row = 130;
    tank.col = 120;
    tank.bulletTimer = 0;
    tank.aniCounter = 0;
    tank.curFrame = 0;
    tank.numFrames = 1;
    tank.aniState = TANK_BROWN;
}

//initialize Bullet
void initBullet() {
	for (int i = 0; i < BULLETCOUNT; i++) {
    	bullet[i].width = 10;
    	bullet[i].height = 10;
    	bullet[i].cdel = 2;
    	bullet[i].rdel = 1;
    	bullet[i].row = tank.row;
    	bullet[i].col = tank.col + tank.width/2 - bullet[i].width / 2;
    	bullet[i].active = 0;
    	bullet[i].curFrame = 0;
    	bullet[i].numFrames = 1;
    	bullet[i].aniState = BULLETSPRITE;
	}
}

//initialize enemyBullet
void initEnemyBullet() {
	for (int i = 0; i < ENEMYBULLETCOUNT; i++) {
    	enemyBullet[i].width = 5;
    	enemyBullet[i].height = 5;
    	enemyBullet[i].cdel = 1;
    	enemyBullet[i].rdel = 1;
    	enemyBullet[i].row = enemies[5].row;
    	enemyBullet[i].col = enemies[5].col + enemies[5].width/2 - enemyBullet[i].width / 2;
    	enemyBullet[i].active = 0;
    	enemyBullet[i].curFrame = 0;
    	enemyBullet[i].numFrames = 1;
    	enemyBullet[i].aniState = ENEMY_BULLET;
	}
}

//initialize energy
void initEnergy() {
	int colFirst = 200;
	for (int i = 0; i < ENERGYCOUNT; i++) {
		energy[i].row = 140;
		energy[i].col = colFirst;
		energy[i].width = 6;
		energy[i].height = 6;
		energy[i].active = 1;
		energy[i].aniState = ENERGYSPRITE;
		energy[i].curFrame = 0;
		energy[i].numFrames = 1;
		energy[i].active = 1;
		colFirst += 10;
	}
}

//initialize enemies
void initEnemies() {
	//initial locations of enemies
	int colFirst = -8;
	// int colFirst = 5;
	int rowFirst = 5;

	for (int i = 0; i < ENEMYCOUNT; i++) {

		//setting first row of blue enemies
		if (i < 6) {
			colFirst = colFirst + 13;
			enemies[i].aniState = ENEMY_BLUE;
			enemies[i].curFrame = 0;
			enemies[i].numFrames = 2;
			

		} else if (i >= 6 && i < 12) {       //setting second row of green enemies
			//moving to second row
			if (i == 6) {  
				rowFirst = rowFirst + 13;    
				colFirst = 5;
			} else {
				colFirst = colFirst + 13;
			}
			enemies[i].aniState = ENEMY_GREEN;
			enemies[i].curFrame = 0;
			enemies[i].numFrames = 2;

		} else if (i >= 12 && i < 18) {  	//setting third row of purple enemies
			//movig to third row.
			if (i == 12) {
				rowFirst = rowFirst + 13;
				colFirst = 5;
			} else {
				colFirst = colFirst + 13;
			}
			enemies[i].aniState = ENEMY_PURPLE;
			enemies[i].curFrame = 0;
			enemies[i].numFrames = 1;

		} else if (i >= 18 && i < 24) {     //setting red enemies
			//moving to fourth row
			if (i == 18) {
				rowFirst = rowFirst + 13;
				colFirst = 5;
			} else {
				colFirst = colFirst + 13;
			}			
			enemies[i].aniState = ENEMY_RED;
			enemies[i].curFrame = 0;
			enemies[i].numFrames = 2;

		} else { 							//setting last row of yellow enemies
			//moving to fifth row
			if (i == 24) {
				rowFirst = rowFirst + 13;
				colFirst = 5;
			} else {
				colFirst = colFirst + 13;
			}
			enemies[i].aniState = ENEMY_YELLOW;
			enemies[i].curFrame = 0;
			enemies[i].numFrames = 2;
		}

		//location of each enemies
		enemies[i].row = rowFirst;
		enemies[i].col = colFirst;
		enemies[i].rdel = 10;
		enemies[i].cdel = 10;
		enemies[i].width = 8;
		enemies[i].height = 8;
		enemies[i].active = 1;
		enemies[i].aniCounter = 0;			
	}
}

//update tank
void updateTank() {
	//handling movement of tank
	if (BUTTON_HELD(BUTTON_RIGHT) && (tank.col + tank.width - 1) < SCREENWIDTH - tank.cdel) {
		tank.col = tank.col + tank.cdel;
	} else if (BUTTON_HELD(BUTTON_LEFT) && tank.col >= tank.cdel) {
		tank.col = tank.col - tank.cdel;
	}

	//tank shooting bullets
	for (int i =0; i < BULLETCOUNT; i++) {
		if (BUTTON_PRESSED(BUTTON_A) && !bullet[i].active) {
			//location of bullets		
			bullet[i].row = tank.row;
			bullet[i].col = tank.col + tank.width / 2 - bullet[i].width / 2;

			bullet[i].active = 1;

			break;
		}
	}


	//EnemyBullet collision with TANK
		for (int i = 0; i < ENERGYCOUNT; i++) {
			for(int j = 0; j < ENEMYBULLETCOUNT; j++) {
			if ((enemyBullet[j].active) 
				&& collision(tank.row, tank.col, tank.height, tank.width, enemyBullet[j].row, enemyBullet[j].col, enemyBullet[j].height-2, enemyBullet[j].width-3)) {
				livesRemaining--;				
				energy[i].active = 0;
				enemyBullet[j].active = 0;
				enemyBullet[j].curFrame = 0;

				shadowOAM[i + 1 + ENEMYCOUNT + BULLETCOUNT].attr0 |= ATTR0_HIDE; //energy DISAPPAER
				shadowOAM[j + ENEMYCOUNT + 1 + BULLETCOUNT + ENERGYCOUNT].attr0 |= ATTR0_HIDE; //DISAPPEAR BULLETS

			}

			//disappearing enemyBullets when Enemybullet didn't collide with tank
			if (enemyBullet[j].row == 131) {
				enemyBullet[j].active = 0;
				enemyBullet[j].curFrame = 0;
				shadowOAM[j + ENEMYCOUNT + 1 + BULLETCOUNT + ENERGYCOUNT].attr0 |= ATTR0_HIDE; //DISAPPEAR ENEMY_BULLETS
			}
		}
	}
	
}

//update bullets from tank
void updateBullet() {
	for (int i = 0; i < BULLETCOUNT; i++) {
		bullet[i].row = bullet[i].row - bullet[i].rdel;
	}
	
}

//update bullets from enemy
void fireEnemyBullet() {
	for (int i = 0; i < ENEMYBULLETCOUNT; i++) {
		enemyBullet[i].row = enemyBullet[i].row + enemyBullet[i].rdel;
	}
}

//update enemies
void updateEnemies() {
	//enemy movement
	if (tank.aniCounter % 40 == 0) {
		if ((lastCol + 1 > SCREENWIDTH)) {
			for (int i = 0; i < ENEMYCOUNT; i++) {
				if(enemies[i].active) {
					enemies[i].row += enemies[i].rdel;  //move enemies one row down
					enemies[i].cdel *= -1;
				}
			}

			lastColDel = lastColDel * -1;
			firstColDel = firstColDel * -1;
			lastRow += lastRowDel;
		
		} else if (enemies[0].row > 5 && (firstCol - 2) < 1 ) {
			for (int i = 0; i < ENEMYCOUNT; i++) {
				if(enemies[i].active) {
					enemies[i].row += enemies[i].rdel;	//moving enemies one row down
					enemies[i].cdel *= -1;
				}
			}

			lastColDel = lastColDel * -1;              //move enemies opposite direction
			firstColDel = firstColDel * -1;
			lastRow += lastRowDel;

		} else{    
			for (int i = 0; i < ENEMYCOUNT; i++) {
				if (enemies[i].active) {
					enemies[i].col += enemies[i].cdel;
					if (tank.aniCounter % 20 == 0) {					
						if(enemies[i].aniCounter % 20 == 0) {			
							enemies[i].curFrame = (enemies[i].curFrame + 1) % enemies[i].numFrames;
						}
					}
				}
			}
		}
		lastCol += (lastColDel);
		firstCol += (firstColDel);
	}

	//handling enemies and bullet from tank collision
	for (int i = 0; i < ENEMYCOUNT; i++) {
		if (enemies[i].active) {
			for(int j = 0; j < BULLETCOUNT; j++) {
			if(( bullet[j].active) 
				&& collision(enemies[i].row, enemies[i].col, enemies[i].height, enemies[i].width, bullet[j].row, bullet[j].col, bullet[j].height-2, bullet[j].width-3)) {
												
				remaining--;
				bullet[j].active = 0;
				bullet[j].curFrame = 0;
				enemies[i].active = 0;
				shadowOAM[i + 1 + BULLETCOUNT].attr0 |= ATTR0_HIDE; //ENEMIES DISAPPAER
				shadowOAM[j + 1].attr0 |= ATTR0_HIDE; //DISAPPEAR BULLETS

			}

			//disappearing bullets from tank if not collide with enemies.
			if(bullet[j].row == 0) {
				bullet[j].active = 0;
				bullet[j].curFrame = 0;
				shadowOAM[j + 1].attr0 |= ATTR0_HIDE;
			}
		}
		}
	}


	//enemies Bullet

	for (int i =0; i < ENEMYBULLETCOUNT; i++) {
		if (remaining == 25 || remaining == 20 || remaining == 15 || remaining == 5 || remaining == 3) {
			if ((BUTTON_PRESSED(BUTTON_A)) && enemies[5].active && !enemyBullet[i].active) {
				enemyBullet[i].row = enemies[5].row;
				enemyBullet[i].col = enemies[5].col + enemies[5].width / 2 - enemyBullet[i].width / 2;

				enemyBullet[i].active = 1;

				break;
		}
	}
	}
}

