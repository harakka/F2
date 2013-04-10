/* 

  ACRE Dead Channel - v1
  
  Split in order to use .sqf syntax.
  
 */
 
 _ret = [true] call acre_api_fnc_setSpectator;
 
 player spawn {
 
	 waitUntil{ // Runs a loop to check if player has re-JIP'd, and turns off spec chat if they do.
	 
	 if(alive _this) then {
	 
		_ret = [false] call acre_api_fnc_setSpectator;
	 
	 } else {
	 
		_ret = [true] call acre_api_fnc_setSpectator;
	 
	 };
	 
	 sleep 1;
	 
	 };
	 
 };