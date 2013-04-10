// ------------------------------------------------------------------------------------
// Alters radio frequencies per side, so that both teams have seperate radio channels.
// ------------------------------------------------------------------------------------


if (!isDedicated) then {

  if (isNull player) then {
  	waitUntil {!isNull player};
  };
  
  frequenciesSet = false;
  
  _longRangeChannels = ["ACRE_PRC148"] call acre_api_fnc_getDefaultChannels;
  _shortRangeChannels = ["ACRE_PRC343"] call acre_api_fnc_getDefaultChannels;
  
  _newShortRangeChannels = [];
  _newLongRangeChannels = [];
  
	_lrBaseFreq = 30;
	_freq = 0;
	switch (side player) do 
	{ 
	  case west: {{ _freq = _lrBaseFreq + 0.2; _lrBaseFreq = _lrBaseFreq + 2; _newLongRangeChannels = _newLongRangeChannels + [_freq];}foreach _longRangeChannels;}; 
	  case east: {{ _freq = _lrBaseFreq + 0.4; _lrBaseFreq = _lrBaseFreq + 2; _newLongRangeChannels = _newLongRangeChannels + [_freq];}foreach _longRangeChannels;}; 
	  case resistance: {{ _freq = _lrBaseFreq + 0.6; _lrBaseFreq = _lrBaseFreq + 2; _newLongRangeChannels = _newLongRangeChannels + [_freq];}foreach _longRangeChannels;}
	};
	
	_srBaseFreq = 2400;
	_freq = 0;
	switch (side player) do 
	{ 
	  case west: {{ _freq = _srBaseFreq + 0.2; _srBaseFreq = _srBaseFreq + 2; _newShortRangeChannels = _newShortRangeChannels + [_freq];}foreach _shortRangeChannels;}; 
	  case east: {{ _freq = _srBaseFreq + 0.4; _srBaseFreq = _srBaseFreq + 2; _newShortRangeChannels = _newShortRangeChannels + [_freq];}foreach _shortRangeChannels;}; 
	  case resistance: {{ _freq = _srBaseFreq + 0.6; _srBaseFreq = _srBaseFreq + 2; _newShortRangeChannels = _newShortRangeChannels + [_freq];}foreach _shortRangeChannels;}
	};
	
	// Set the radio defaults.
	_ret = ["ACRE_PRC148", _newLongRangeChannels ] call acre_api_fnc_setDefaultChannels;
	_ret = ["ACRE_PRC148_UHF", _newLongRangeChannels ] call acre_api_fnc_setDefaultChannels;
	_ret = ["ACRE_PRC119", _newLongRangeChannels ] call acre_api_fnc_setDefaultChannels;
	_ret = ["ACRE_PRC117F", _newLongRangeChannels ] call acre_api_fnc_setDefaultChannels;	
	_ret = ["ACRE_PRC152", _newLongRangeChannels ] call acre_api_fnc_setDefaultChannels;
	
	_ret = ["ACRE_PRC343", _newShortRangeChannels ] call acre_api_fnc_setDefaultChannels;
	
	// Continue onto radio assignation.
	frequenciesSet = true;

 };