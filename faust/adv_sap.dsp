declare name       "Schroeder Allpass";
declare version    "1.0";
declare author     "Anders Dahnielson";
declare license    "GPLv2";
declare copyright  "Anders Dahnielson 2008";

import("adverb.lib");

//////////////////////////////////////////////////
// Process

process = vgroup("adv_sap", sap(2048, nentry("M",0,0,2048,1), nentry("G",0.0,0.0,1.0,0.1)));
