declare name       "Feed-Forward Comb Filter";
declare version    "1.0";
declare author     "Anders Dahnielson";
declare license    "GPLv2";
declare copyright  "Anders Dahnielson 2008";

import("adverb.lib");

//////////////////////////////////////////////////
// Process

process = vgroup("adv_ffcf", ffcf(32768,
			     nentry("d",0,0,32768,1),
	  		     nentry("g",0,0,1.0,0.1))
			     );
