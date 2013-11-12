// Group Teleport (based on F2 - Mission Maker Teleport)
// Modified for Red Snow
// Credits: Please see the F2 online manual (http://www.ferstaberinde.com/f2/en/)
// ====================================================================================

// DECLARE VARIABLES AND FUNCTIONS

private ["_textSelect","_textDone"];

// ====================================================================================

// SET KEY VARIABLES

f_telePositionSelected = false;
_textSelect = "Left-click on map to select group HALO position\nRight-click drag to pan map";
_textDone = "Performing HALO jump";

// ====================================================================================

// TELEPORT FUNCTIONALITY
// When the script is activated the player is asked to click on the map at the desired
// target location for the teleport. On clicking, the player is teleported to that 
// location and given a message to confirm that the teleport has taken place.

titletext [_textSelect,"plain", 1.0];

onMapSingleClick "group player setVariable [""ha_halo_pos"", _pos, true]; f_telePositionSelected = true;";
openMap true;
mapAnimAdd [0, 0.2, markerPos "mkr_ao"];
mapAnimCommit;

waitUntil {f_telePositionSelected};
openMap false;
player removeAction mapClickGroupTeleportAction;
titletext [_textDone,"plain", 0.3];

onMapSingleClick "";

// AI squadmembers won't get HALOed by groupTeleport.sqf, so we do them here
{
	if (!isPlayer _x) then {
		[_x, group player getVariable "ha_halo_pos"] execvm "custom\startposition.sqf";
	};
} forEach units group player;