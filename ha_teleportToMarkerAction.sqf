// Mercilessly ripped from the F2 debug teleport script

if (!local player || f_var_debugMode == 0 && f_missionMakerTeleport == 0) exitWith {};

// ====================================================================================

while {true} do
{
	tpToMarkerAction = player addaction ["Teleport to next marker" ,"ha_teleportToMarker.sqf"];
	waitUntil {!alive player};
	waitUntil {alive player};
	sleep 0.01;
};