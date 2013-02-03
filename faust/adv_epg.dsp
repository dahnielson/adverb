declare name       "Early Pattern Generator";
declare version    "1.0";
declare author     "Anders Dahnielson";
declare license    "GPLv2";
declare copyright  "Anders Dahnielson 2008";

import("adverb.lib");

//////////////////////////////////////////////////
// Early Pattern Generator (EPG)
//
//  O  order of reflection
//  C  coloration
//  T  time delay of arrival
//  L  level of sound
//  D  direction of arrival

// Diffusion Filter
ap = sap(2048, nentry("M",0,0,2048,1), nentry("g",0,0,1,0.01));

df1 = hgroup("DF1", vgroup("AP1",ap) : vgroup("AP2",ap));
df2 = hgroup("DF2", vgroup("AP3",ap) : vgroup("AP4",ap));
df3 = hgroup("DF3", vgroup("AP5",ap) : vgroup("AP6",ap));

// Room Coloration
eq = vgroup("Lo", pareq(nentry("Q",50,0.1,100,0.1), nentry("f",100,20,20000,1), 0 - nentry("g",0,-50,50,0.1))) : 
     vgroup("Mid", pareq(nentry("Q",50,0.1,100,0.1), nentry("f",1000,20,20000,1), 0 - nentry("g",0,-50,50,0.1))) : 
     vgroup("Hi", pareq(nentry("Q",50,0.1,100,0.1), nentry("f",10000,20,20000,1), 0 - nentry("g",0,-50,50,0.1)));

eq1 = hgroup("EQ1", eq);
eq2 = hgroup("EQ2", eq);

// Time Delay
maxdel = 32768;
tdl1 = _ <: delay(maxdel,nentry("M1",0,0,maxdel,1)), delay(maxdel,nentry("M2",0,0,maxdel,1));
tdl2 = _ <: delay(maxdel,nentry("M1",0,0,maxdel,1)), delay(maxdel,nentry("M2",0,0,maxdel,1)), 
       	    delay(maxdel,nentry("M3",0,0,maxdel,1)), delay(maxdel,nentry("M4",0,0,maxdel,1)), 
	    delay(maxdel,nentry("M5",0,0,maxdel,1)), delay(maxdel,nentry("M6",0,0,maxdel,1));
tdl3 = _ <: delay(maxdel,nentry("M1",0,0,maxdel,1)), delay(maxdel,nentry("M2",0,0,maxdel,1)), 
       	    delay(maxdel,nentry("M3",0,0,maxdel,1)), delay(maxdel,nentry("M4",0,0,maxdel,1)), 
	    delay(maxdel,nentry("M5",0,0,maxdel,1)), delay(maxdel,nentry("M6",0,0,maxdel,1)), 
	    delay(maxdel,nentry("M7",0,0,maxdel,1)), delay(maxdel,nentry("M8",0,0,maxdel,1)), 
	    delay(maxdel,nentry("M9",0,0,maxdel,1)), delay(maxdel,nentry("M10",0,0,maxdel,1)), 
	    delay(maxdel,nentry("M11",0,0,maxdel,1)), delay(maxdel,nentry("M12",0,0,maxdel,1));

tdl11 = hgroup("TDL11",tdl1);
tdl12 = hgroup("TDL12",tdl1);
tdl21 = hgroup("TDL21",tdl2);
tdl22 = hgroup("TDL22",tdl2);
tdl31 = hgroup("TDL31",tdl3);
tdl32 = hgroup("TDL32",tdl3);

// Level & Direction
dru0 = (*(nentry("G1",1,0,1,0.01)) : benc(nentry("A1",0,0,2*PI,0.01)));
dru1 = (*(nentry("G1",1,0,1,0.01)) : benc(nentry("A1",0,0,2*PI,0.01))), 
       (*(nentry("G2",1,0,1,0.01)) : benc(nentry("A2",0,0,2*PI,0.01)));
dru2 = (*(nentry("G1",1,0,1,0.01)) : benc(nentry("A1",0,0,2*PI,0.01))), 
       (*(nentry("G2",1,0,1,0.01)) : benc(nentry("A2",0,0,2*PI,0.01))), 
       (*(nentry("G3",1,0,1,0.01)) : benc(nentry("A3",0,0,2*PI,0.01))), 
       (*(nentry("G4",1,0,1,0.01)) : benc(nentry("A4",0,0,2*PI,0.01))), 
       (*(nentry("G5",1,0,1,0.01)) : benc(nentry("A5",0,0,2*PI,0.01))), 
       (*(nentry("G6",1,0,1,0.01)) : benc(nentry("A6",0,0,2*PI,0.01)));
dru3 = (*(nentry("G1",1,0,1,0.01)) : benc(nentry("A1",0,0,2*PI,0.01))), 
       (*(nentry("G2",1,0,1,0.01)) : benc(nentry("A2",0,0,2*PI,0.01))), 
       (*(nentry("G3",1,0,1,0.01)) : benc(nentry("A3",0,0,2*PI,0.01))), 
       (*(nentry("G4",1,0,1,0.01)) : benc(nentry("A4",0,0,2*PI,0.01))), 
       (*(nentry("G5",1,0,1,0.01)) : benc(nentry("A5",0,0,2*PI,0.01))), 
       (*(nentry("G6",1,0,1,0.01)) : benc(nentry("A6",0,0,2*PI,0.01))), 
       (*(nentry("G7",1,0,1,0.01)) : benc(nentry("A7",0,0,2*PI,0.01))), 
       (*(nentry("G8",1,0,1,0.01)) : benc(nentry("A8",0,0,2*PI,0.01))), 
       (*(nentry("G9",1,0,1,0.01)) : benc(nentry("A9",0,0,2*PI,0.01))), 
       (*(nentry("G10",1,0,1,0.01)) : benc(nentry("A10",0,0,2*PI,0.01))), 
       (*(nentry("G11",1,0,1,0.01)) : benc(nentry("A11",0,0,2*PI,0.01))), 
       (*(nentry("G12",1,0,1,0.01)) : benc(nentry("A12",0,0,2*PI,0.01)));

dru01 = hgroup("DRU01",dru0);
dru11 = hgroup("DRU11",dru1);
dru12 = hgroup("DRU12",dru1);
dru21 = hgroup("DRU21",dru2);
dru22 = hgroup("DRU22",dru2);
dru31 = hgroup("DRU31",dru3);
dru32 = hgroup("DRU32",dru3);

// Matrix
order0 = _ <: _, dru01;
order1 = df1 <: _, (eq1 : tdl11 : dru11), (eq2 : tdl12 : dru12);
order2 = df2 <: _, (eq1 : tdl21 : dru21), (eq2 : tdl22 : dru22);
order3 = df3 <: (eq1 : tdl31 : dru31), (eq2 : tdl32 : dru32);

process = order0 : order1 : order2 : order3 :> _, _, _;
