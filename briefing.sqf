// F2 - OA Briefing
// Credits: Please see the F2 online manual (http://www.ferstaberinde.com/f2/en/)
// ====================================================================================

// JIP CHECK
// Prevents the script executing until the player has synchronised correctly:

#include "f\common\f_waitForJIP.sqf"

// ====================================================================================

// DECLARE VARIABLES AND FUNCTIONS

private ["_unitfaction"];

// ====================================================================================

// DETECT PLAYER FACTION
// The following code detects what faction the player's slot belongs to, and stores
// it in the private variable _unitfaction

_unitfaction = toLower (faction player);

// DEBUG
	if (f_var_debugMode == 1) then
	{
	player sideChat format ["DEBUG (briefing.sqf): Player faction: %1",_unitfaction];
	};

// ====================================================================================

// BRIEFING: RUSSIAN ARMY
// The following block of code executes only if the player is in a US slot; it 
// automatically includes a file which contains the appropriate briefing data.

if (_unitfaction == "ru") exitwith {

#include "f\common\f_briefing_ru.sqf"

// DEBUG
	if (f_var_debugMode == 1) then
	{
	player sideChat format ["DEBUG (briefing.sqf): Briefing for %1 slot selected.",_unitfaction];
	};
};

// ====================================================================================

// ERROR CHECKING
// If the faction of the unit cannot be defined, the script exits with an error.

player globalchat format ["DEBUG (briefing.sqf): Faction %1 is not defined.",_unitfaction];