#include <stdlib.h>
#include <stdio.h>
#include "myLib.h"
#include "startPage.h"
#include "pausePage.h"
#include "winPage.h"
#include "losePage.h"
#include "gamePage.h"
#include "game.h"
#include "spritesheet.h"


// State Prototypes
void initialize();
void drawGame();
void goToStart();
void start();
void goToGame();
void game();
void goToPause();
void pause();
void goToWin();
void win();
void goToLose();
void lose();


int hOff = 0;
int vOff = 0;
int arr[35];

OBJ_ATTR shadowOAM[128];


// States
enum {START, GAME, PAUSE, WIN, LOSE};
int state;

// Button Variables
unsigned short buttons;
unsigned short oldButtons;

// Random Seed
int seed;



int main() {
    hideSprites();
    initialize();

    while(1) {

        // Update button variables
        oldButtons = buttons;
        buttons = BUTTONS;
                
        // State Machine
        switch(state) {

            case START:
                start();
                break;
            case GAME:
                game();
                break;
            case PAUSE:
                pause();
                break;
            case WIN:
                win();
                break;
            case LOSE:
                lose();
                break;
        }
               
    }
}

// Sets up GBA
void initialize() {

    initGame();

    REG_DISPCTL = MODE0 | BG0_ENABLE | SPRITE_ENABLE;
    REG_BG0CNT = BG_SIZE_SMALL | BG_4BPP | BG_CHARBLOCK(0) | BG_SCREENBLOCK(28);

    //loading start screen
    DMANow(3, startPagePal, PALETTE, startPagePalLen / 2);
    DMANow(3, startPageTiles, &CHARBLOCK[0], (startPageTilesLen / 2));
    DMANow(3, startPageMap, &SCREENBLOCK[28], (startPageMapLen / 2));

    //load sprites
    DMANow(3, spritesheetPal, SPRITEPALETTE, spritesheetPalLen/2 );
    DMANow(3, spritesheetTiles, &CHARBLOCK[4], (spritesheetTilesLen / 2));
    
    hideSprites();


    initBullet();    
    initTank();    
    initEnemies();
    initEnergy();

    initEnemyBullet();


    buttons = BUTTONS;
    // Set up the first state
    goToStart();
}


// Sets up the start state
void goToStart() {

    DMANow(3, startPagePal, PALETTE, startPagePalLen / 2);
    DMANow(3, startPageTiles, &CHARBLOCK[0], (startPageTilesLen / 2));
    DMANow(3, startPageMap, &SCREENBLOCK[28], (startPageMapLen / 2));
    
    REG_DISPCTL = MODE0 | BG0_ENABLE;
    REG_BG0CNT = BG_SIZE_SMALL | BG_4BPP | BG_CHARBLOCK(0) | BG_SCREENBLOCK(28);
 
    waitForVBlank();

    state = START;

    seed = 0;
     
}

// Runs every frame of the start state
void start() {
    
    seed++;

    waitForVBlank();

    if (BUTTON_PRESSED(BUTTON_START)) {
        REG_DISPCTL |= SPRITE_ENABLE;

        srand(seed);

        goToGame();
    }
}

// Sets up the game state
void goToGame() {
    DMANow(3, gamePagePal, PALETTE, gamePagePalLen / 2);
    DMANow(3, gamePageTiles, &CHARBLOCK[0], (gamePageTilesLen / 2));
    DMANow(3, gamePageMap, &SCREENBLOCK[28], (gamePageMapLen / 2));
    

    // REG_DISPCTL = MODE0 | BG0_ENABLE | SPRITE_ENABLE;
    REG_BG0CNT = BG_SIZE_LARGE | BG_4BPP | BG_CHARBLOCK(0) | BG_SCREENBLOCK(28);

    waitForVBlank();
    state = GAME;
}

// Runs every frame of the game state
void game() {
    drawGame();

    DMANow(3, shadowOAM, OAM, 128 * 4);

    REG_BG0HOFF = hOff;
    REG_BG0VOFF = vOff;

    if (lastRow - 5 >= tank.row) {
        goToLose();
    }

    if(livesRemaining == 0) {
        goToLose();
    }

    if (remaining == 0) {
        goToWin();
    }

    if (BUTTON_PRESSED(BUTTON_START)) {
        goToPause();
    }

   
}

// Sets up the pause state
void goToPause() {

    DMANow(3, pausePagePal, PALETTE, pausePagePalLen / 2);
    DMANow(3, pausePageTiles, &CHARBLOCK[0], (pausePageTilesLen / 2));
    DMANow(3, pausePageMap, &SCREENBLOCK[28], (pausePageMapLen / 2));
    
    REG_DISPCTL = MODE0 | BG0_ENABLE;
    REG_BG0CNT = BG_SIZE_SMALL | BG_4BPP | BG_CHARBLOCK(0) | BG_SCREENBLOCK(28);
    
    waitForVBlank();
    state = PAUSE;
    
}

// Runs every frame of the pause state
void pause() {
    hideSprites();
    
    waitForVBlank(); 

    if (BUTTON_PRESSED(BUTTON_START)) {
        REG_DISPCTL |= SPRITE_ENABLE;
        goToGame();
    }

    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        goToStart();
    }
}

// Sets up the win state
void goToWin() {

    DMANow(3, winpagePal, PALETTE, winpagePalLen / 2);
    DMANow(3, winpageTiles, &CHARBLOCK[0], (winpageTilesLen / 2));
    DMANow(3, winpageMap, &SCREENBLOCK[28], (winpageMapLen / 2));
    
    REG_DISPCTL = MODE0 | BG0_ENABLE;
    REG_BG0CNT = BG_SIZE_SMALL | BG_4BPP | BG_CHARBLOCK(0) | BG_SCREENBLOCK(28);

    waitForVBlank();
    state = WIN;

}

// Runs every frame of the win state
void win() {
    hideSprites();
    
    waitForVBlank(); 

    if (BUTTON_PRESSED(BUTTON_START)) {
        main();
    }

}

// Sets up the lose state
void goToLose() {

    DMANow(3, losePagePal, PALETTE, losePagePalLen / 2);
    DMANow(3, losePageTiles, &CHARBLOCK[0], (losePageTilesLen / 2));
    DMANow(3, losePageMap, &SCREENBLOCK[28], (losePageMapLen / 2));
    
    REG_DISPCTL = MODE0 | BG0_ENABLE;
    REG_BG0CNT = BG_SIZE_SMALL | BG_4BPP | BG_CHARBLOCK(0) | BG_SCREENBLOCK(28); 

    waitForVBlank();

    state = LOSE;
}

// Runs every frame of the lose state
void lose() {
   hideSprites();

    
    
    waitForVBlank(); 

    if (BUTTON_PRESSED(BUTTON_START)) {
        main();
    }
}

void drawGame() {
    

    updateTank();    
    updateBullet();

    fireEnemyBullet();

    updateEnemies();

    tank.aniCounter++;
    //tank.bulletTimer++;

    shadowOAM[0].attr0 = tank.row | ATTR0_4BPP | ATTR0_SQUARE;
    shadowOAM[0].attr1 = tank.col | ATTR1_SMALL;
    shadowOAM[0].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(tank.curFrame, tank.aniState);

    //showing bullets from tank
    for (int i = 0; i < BULLETCOUNT; i++) {
        if (bullet[i].active) {
            shadowOAM[1 + i].attr0 = bullet[i].row | ATTR0_4BPP | ATTR0_SQUARE;
            shadowOAM[1 + i].attr1 = bullet[i].col | ATTR1_TINY;            
            shadowOAM[1 + i].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(bullet[i].curFrame, bullet[i].aniState);

        }
    }

    //showing enemies
    for (int i = 0; i < ENEMYCOUNT; i++) {
        if (enemies[i].active) {
            shadowOAM[i + 1 + BULLETCOUNT].attr0 = enemies[i].row | ATTR0_4BPP | ATTR0_SQUARE;
            shadowOAM[i + 1 + BULLETCOUNT].attr1 = enemies[i].col | ATTR1_TINY;            
            shadowOAM[i + 1 + BULLETCOUNT].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(enemies[i].curFrame, enemies[i].aniState);
        }
    }

    //showing energy
    for (int i = 0; i < ENERGYCOUNT; i++) {
        if (energy[i].active) {
            shadowOAM[i + ENEMYCOUNT + 1 + BULLETCOUNT].attr0 = energy[i].row | ATTR0_4BPP | ATTR0_SQUARE;
            shadowOAM[i + 1 + ENEMYCOUNT + BULLETCOUNT].attr1 = energy[i].col | ATTR1_TINY;
            shadowOAM[i + 1 + ENEMYCOUNT + BULLETCOUNT].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(energy[i].curFrame, energy[i].aniState);
        }
    }

    //showing bullets from enemy
    for (int i = 0; i < ENEMYBULLETCOUNT; i++) {
        if (enemyBullet[i].active) {
            shadowOAM[i + ENEMYCOUNT + 1 + BULLETCOUNT + ENERGYCOUNT].attr0 = enemyBullet[i].row | ATTR0_4BPP | ATTR0_SQUARE;
            shadowOAM[i + ENEMYCOUNT + 1 + BULLETCOUNT + ENERGYCOUNT].attr1 = enemyBullet[i].col | ATTR1_TINY;            
            shadowOAM[i + ENEMYCOUNT + 1 + BULLETCOUNT + ENERGYCOUNT].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(enemyBullet[i].curFrame, enemyBullet[i].aniState);

        }
    }

    waitForVBlank();

}



