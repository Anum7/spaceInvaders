
//{{BLOCK(pausePage)

//======================================================================
//
//	pausePage, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 14 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 448 + 2048 = 3008
//
//	Time-stamp: 2019-03-27, 12:43:44
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_PAUSEPAGE_H
#define GRIT_PAUSEPAGE_H

#define pausePageTilesLen 448
extern const unsigned short pausePageTiles[224];

#define pausePageMapLen 2048
extern const unsigned short pausePageMap[1024];

#define pausePagePalLen 512
extern const unsigned short pausePagePal[256];

#endif // GRIT_PAUSEPAGE_H

//}}BLOCK(pausePage)
