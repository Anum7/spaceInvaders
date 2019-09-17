
//{{BLOCK(gamePage)

//======================================================================
//
//	gamePage, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 119 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 3808 + 2048 = 6368
//
//	Time-stamp: 2019-03-26, 22:45:24
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_GAMEPAGE_H
#define GRIT_GAMEPAGE_H

#define gamePageTilesLen 3808
extern const unsigned short gamePageTiles[1904];

#define gamePageMapLen 2048
extern const unsigned short gamePageMap[1024];

#define gamePagePalLen 512
extern const unsigned short gamePagePal[256];

#endif // GRIT_GAMEPAGE_H

//}}BLOCK(gamePage)
