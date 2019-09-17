
//{{BLOCK(startPage)

//======================================================================
//
//	startPage, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 32 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 1024 + 2048 = 3584
//
//	Time-stamp: 2019-03-27, 15:16:53
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_STARTPAGE_H
#define GRIT_STARTPAGE_H

#define startPageTilesLen 1024
extern const unsigned short startPageTiles[512];

#define startPageMapLen 2048
extern const unsigned short startPageMap[1024];

#define startPagePalLen 512
extern const unsigned short startPagePal[256];

#endif // GRIT_STARTPAGE_H

//}}BLOCK(startPage)
