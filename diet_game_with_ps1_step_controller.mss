#include "lambda.h"

#define	SPR_W	640
#define	SPR_H	480
#define	ADD_X	1
#define	ADD_Y	2

/*
@‰æ–Ê“à‚ð”½ŽË‚µ‚È‚ª‚ç“®‚­ƒTƒ“ƒvƒ‹
*/
main()
{
	var back, move, sz[2], x, y, x1, y1, a1, addx, addy, txt;
	var flag1, c1, c2, c3, x2, y2, x3, y3, score1;

	sprSetLevel(66);
	timeSetFPS(30);
	txt = imgCreate(640,16,4,0);
	back = imgLoad("bg.png", 1, 0);
	imgSetCurrent(back);
	x1=0;y1=100.2;
	x2=620;y2=sysRandom(100, 300);
	x3=620;y3=sysRandom(100, 300);
	score1=0;
	c1 = imgLoad("chara.png", 2, 0);
	c2 = imgLoad("arei.png", 3, 0);
	c3 = imgLoad("soft.png", 3, 0);
	imgSetCurrent(c1);
	imgSetTrans(true, 31, 0, 31);
	imgSetPos(x1, y1);
	imgSetCurrent(c2);
	imgSetTrans(true, 31, 0, 31);
	imgSetCurrent(c3);
	imgSetTrans(true, 31, 0, 31);
		imgSetCurrent(txt);
		txtSetColor(255, 255, 255);
		txtSetPos(300, 0);
		txtOut("SCORE:"+score1);

	inpSetCurrent(inpGetDevice(1));
	sprRenderScreen();

	while(true)
	{
		imgSetCurrent(c1);
		inpClear();
		if(inpGetState(INP_RIGHT) == INP_PUSH)
		{
				if(flag1==0){
				y1 -= 20;
				imgSetPos(x1, y1);
				flag1=1;
				}
		}
		if(inpGetState(INP_LEFT) == INP_PUSH)
		{
				if(flag1==1){
				y1 -= 20;
				imgSetPos(x1, y1);
				flag1=0;
				}
		}
				y1 += 0.6;
				imgSetPos(x1, y1);
				imgSetCurrent(c2);
				if(x2 > 0){
				x2-=2;
				if((x1 < (x2 + 32)) && (x2 < (x1 + 64)) && (y1 < (y2 + 32)) && (y2 < (y1 + 64))){
				score1+=100;
				x2=620;
				y2=sysRandom(100, 300);
				}
				}else{
				x2=620;
				y2=sysRandom(100, 300);
				}
				imgSetPos(x2, y2);
				imgSetCurrent(c3);
				if(x3 > 0){
				x3-=2;
				if((x1 < (x3 + 32)) && (x3 < (x1 + 64)) && (y1 < (y3 + 32)) && (y3 < (y1 + 64))){
				score1-=100;
				x3=620;
				y3=sysRandom(100, 300);
				}
				}else{
				x3=620;
				y3=sysRandom(100, 300);
				}
				imgSetPos(x3, y3);
		imgSetCurrent(txt);
		imgFill(0, 0, 0);
		txtSetPos(0, 0);
		txtOut("You play with Step controller.");
		txtSetPos(300, 0);
		txtOut("SCORE:"+score1);
		sprRenderWait();
	}
}
