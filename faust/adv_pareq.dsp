declare name       "Adverb Parametric EQ";
declare version    "1.0";
declare author     "Anders Dahnielson";
declare license    "GPLv2";
declare copyright  "Anders Dahnielson 2008";

import("adverb.lib");

//////////////////////////////////////////////////
// Process

process = vgroup("adv_pareq", pareq(nentry("Q",50,1,100,0.1), 
	  		      nentry("f",1000,20,20000,1), 
			      0 - vslider("g", 0, -50, 50, 0.1))
			      );
