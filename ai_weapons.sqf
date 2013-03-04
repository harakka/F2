// Set up AI weapons so that VSS guys are left untouched and everyone else gets an AK-74SU
if (!isServer) exitWith {};

waitUntil {scriptDone f_script_setLocalVars};
{
	if (!(_x hasWeapon "VSS_Vintorez")) then {
		_unit = _x;
		removeAllWeapons _unit ;
		{if (_x != "PipeBomb") then {_unit removeMagazine _x}} forEach magazines _unit;
		_unit addWeapon "AKS_74_U";
		{_unit addMagazine "30Rnd_545x39_AK"} forEach [1,2,3,4,5];
	};
} forEach f_var_men_OPF;