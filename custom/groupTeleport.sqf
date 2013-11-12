// Group Teleport (based on F2 - Mission Maker Teleport)
// Modified for Red Snow
// Credits: Please see the F2 online manual (http://www.ferstaberinde.com/f2/en/)
// ====================================================================================

if (isDedicated) exitWith {};
// JIP script will handle JIP teleports separately
if (!isNil "GrpRU_JIP" && {(group player) == GrpRU_JIP}) exitWith {};
// DECLARE VARIABLES AND FUNCTIONS

private ["_textAction"];

// ====================================================================================

// SET KEY VARIABLES

_textAction = "Group HALO Jump (Single Use)";
//_faction = toLower (faction player);

// ====================================================================================

// ADD TELEPORT ACTION TO PLAYER ACTION MENU
// If the player is a group leader we add the teleport action to the player's action menu.
if (player == leader group player) then
{
	mapClickGroupTeleportAction = player addAction [_textAction,"custom\mapClickGroupTeleport.sqf","", 6, false,true,"","_target == player"];
};

waitUntil {!isNil {group player getVariable "ha_halo_pos"}};
[player, group player getVariable "ha_halo_pos"] execvm "custom\startposition.sqf";
