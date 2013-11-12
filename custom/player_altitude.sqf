if (isDedicated) exitWith{};

// Wait until player HALO jumps (is no longer on the ground), then show an
// altimeter and when a safe but low enough height is achieved, auto open chute
// We need to maintain a decent safety margin because sqf execution isn't
// time-guaranteed.
sleep 0.1;
private ["_ha_chuteopen", "_ha_chute_height", "_ha_chute_immortal"];
_ha_chute_immortal = false;
_ha_chuteopen = false;
_ha_chute_height = 200 + (random 30) - 30;

waituntil {((getposATL player)select 2) > 35};

while {((getposATL player)select 2) > 35} do
{
	hintsilent format ["Altitude: %1m\nYour parachute will\nautomatically open\nat about 200m\n\nRight Ctrl+M: GPS map", round (getPosATL player select 2)];
	
	// Auto-open the chute when the correct height is reached and player hasn't opened the chute manually
	if (!_ha_chuteopen && {((getposATL player)select 2) <= _ha_chute_height && vehicle player == player}) then
	{
		[player] spawn BIS_fnc_halo;
		_ha_chuteopen = true;
	};
	
	// Detect chute opening and add a damage-negating damage handler to the chute
	if (!_ha_chute_immortal && {vehicle player != player}) then {
		(vehicle player) addEventHandler ["HandleDamage", {}];
		_ha_chute_immortal = true;
	};

};
hintsilent "";