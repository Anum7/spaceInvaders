
//{{BLOCK(winpage)

//======================================================================
//
//	winpage, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 15 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 480 + 2048 = 3040
//
//	Time-stamp: 2019-03-27, 15:14:01
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_WINPAGE_H
#define GRIT_WINPAGE_H

#define winpageTilesLen 480
extern const unsigned short winpageTiles[240];

#define winpageMapLen 2048
extern const unsigned short winpageMap[1024];

#define winpagePalLen 512
extern const unsigned short winpagePal[256];

#endif // GRIT_WINPAGE_H

//}}BLOCK(winpage)
