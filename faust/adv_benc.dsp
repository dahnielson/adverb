declare name       "Adverb B-Format Encoder";
declare version    "1.0";
declare author     "Anders Dahnielson";
declare license    "GPLv2";
declare copyright  "Anders Dahnielson 2008";

import("adverb.lib");

//////////////////////////////////////////////////
// Process

process = vgroup("adv_benc", benc(nentry("Azimuth",0,0,2*PI,0.01)));
