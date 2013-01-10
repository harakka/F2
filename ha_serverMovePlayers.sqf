/* 
 * 
 * by: harakka
 */
if (!isServer) exitWith {};
_checkpoints = _this select 0;
_westMissionStartCp = _this select 1;
_eastMissionStartCp = _this select 2;

_trivia1 = 0;
_trivia2 = 0;

waitUntil {scriptDone f_script_setLocalVars};
_posMod = 0;
{
	{
		//Tentative position is squad leader pos + increasing offset
		_tentativePos = [(((_checkpoints select _westMissionStartCp) select 1) select 0) + _posMod, (((_checkpoints select _westMissionStartCp) select 1) select 1) + _posMod, (((_checkpoints select _westMissionStartCp) select 1) select 2)];
		// Try to find an safe position near the tentative position
		_suitableEmptyPos = _tentativePos findEmptyPosition [0, 25, "CDF_Soldier"];
		if (count _suitableEmptyPos > 0) then {_tentativePos = _suitableEmptyPos;};
		
		_x setPos _tentativePos;
		// Old version of move
		//_x setPos [(((_checkpoints select _westMissionStartCp) select 1) select 0) + _posMod, (((_checkpoints select _westMissionStartCp) select 1) select 1) + _posMod, (((_checkpoints select _westMissionStartCp) select 1) select 2)];
		_posMod = _posMod + 2;
        _trivia1 = _trivia1 + 1;
	} forEach units _x;
} forEach f_var_groups_BLU;

_posMod = 0;
{
	{
		//Tentative position is squad leader pos + increasing offset
		_tentativePos = [(((_checkpoints select _eastMissionStartCp) select 1) select 0) + _posMod, (((_checkpoints select _eastMissionStartCp) select 1) select 1) + _posMod, (((_checkpoints select _eastMissionStartCp) select 1) select 2)];
		// Try to find an safe position near the tentative position
		_suitableEmptyPos = _tentativePos findEmptyPosition [0, 25, "CDF_Soldier"];
		if (count _suitableEmptyPos > 0) then {_tentativePos = _suitableEmptyPos;};
		
		_x setPos _tentativePos;
		//_x setPos [(((_checkpoints select _eastMissionStartCp) select 1) select 0) + _posMod, (((_checkpoints select _eastMissionStartCp) select 1) select 1) + _posMod, (((_checkpoints select _eastMissionStartCp) select 1) select 2)];
		_posMod = _posMod + 2;
        _trivia2 = _trivia2 + 1;
	} forEach units _x;
} forEach f_var_groups_RES;

/* Hopefully this sleep gives the server enough time to finish moving players
 * so that no-one finds himself inside a truck. */
sleep 0.2;
_blu_vehicle = "Ural_CDF" createVehicle ((_checkpoints select _westMissionStartCp) select 1 findEmptyPosition [8, 400, "Ural_CDF"]);
_gue_vehicle = "V3S_Gue" createVehicle ((_checkpoints select _eastMissionStartCp) select 1 findEmptyPosition [8, 400, "V3S_Gue"]);

_blu_vehicle2 = _blu_vehicle;
_gue_vehicle2 = _gue_vehicle;
{_blu_vehicle2 = "Ural_CDF" createVehicle ((position _blu_vehicle2) findEmptyPosition [8, 400, "Ural_CDF"]);} foreach [1,2];
{_gue_vehicle2 = "V3S_Gue" createVehicle ((position _gue_vehicle2) findEmptyPosition [8, 400, "V3S_Gue"]);} foreach [1,2];

ha_bluVehiclePos = position _blu_vehicle;
ha_gueVehiclePos = position _gue_vehicle;
publicVariable "ha_bluVehiclePos";
publicVariable "ha_gueVehiclePos";

ha_initMovePlayers = true;
publicVariable "ha_initMovePlayers";

