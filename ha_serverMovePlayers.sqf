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

_bluMove = [markerPos "ha_blu_start", (_checkpoints select _westMissionStartCp) select 1, 200, ["Man","Car"]] execVM "shk_moveobjects.sqf";
_resMove = [markerPos "ha_res_start", (_checkpoints select _eastMissionStartCp) select 1, 200, ["Man","Car"]] execVM "shk_moveobjects.sqf";

waitUntil {scriptDone _bluMove};
waitUntil {scriptDone _resMove};

sleep 0.2;
ha_initMovePlayers = true;
publicVariable "ha_initMovePlayers";

