//Tank struct
typedef struct {
    int row;
    int col;
    int rdel;
    int cdel;
    int width;
    int height;
    int aniCounter;
    int aniState;
    int prevAniState;
    int curFrame;
    int numFrames;
    int bulletTimer;
} TANK;

//energy struct
typedef struct {
    int row;
    int col;
    int rdel;
    int cdel;
    int width;
    int height;
    int aniCounter;
    int aniState;
    int prevAniState;
    int curFrame;
    int numFrames;
    int active;    
} ENERGY;

//Anisprite struct
typedef struct {
    int row;
    int col;
    int rdel;
    int cdel;
    int width;
    int height;
    int aniCounter;
    int aniState;
    int prevAniState;
    int curFrame;
    int numFrames;
    int active;
} ANISPRITE;

//bullet struct
typedef struct {
    int row;
    int col;
    int rdel;
    int cdel;
    int width;
    int height;
    int aniCounter;
    int aniState;
    int prevAniState;
    int curFrame;
    int numFrames;
    int active;
} BULLET;

//spriteBullet struct
typedef struct {
    int row;
    int col;
    int rdel;
    int cdel;
    int width;
    int height;
    int aniCounter;
    int aniState;
    int prevAniState;
    int curFrame;
    int numFrames;
    int active;
} SPRITEBULLET;


//constants
#define ENEMYCOUNT 30
#define ENERGYCOUNT 2
#define BULLETCOUNT 15
#define ENEMYBULLETCOUNT 10


extern OBJ_ATTR shadowOAM[];

//variable
extern TANK tank;
extern ENERGY energy[ENERGYCOUNT];
extern ANISPRITE enemies[ENEMYCOUNT];
extern BULLET bullet[BULLETCOUNT];
extern SPRITEBULLET enemyBullet[ENEMYBULLETCOUNT];
extern volatile int remaining;
extern volatile int lastCol;
extern volatile int firstCol;
extern volatile int lastColDel;
extern volatile int firstColDel;
extern volatile int lastRow;
extern volatile int lastRowDel;
extern volatile int livesRemaining;


enum {ENEMY_BLUE, ENEMY_GREEN, ENEMY_PURPLE, ENEMY_RED, ENEMY_YELLOW, ENERGYSPRITE, BULLETSPRITE, ENEMY_BULLET, TANK_BROWN};

//methods
void initGame();
void initBullet();
void updateBullet();
void initTank();
void updateTank();
void initEnemies();
void updateEnemies();
/*void lastRowCheck(int);*/

void initEnergy();

void initEnemyBullet();
void fireEnemyBullet();