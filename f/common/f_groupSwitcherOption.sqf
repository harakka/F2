// F2 - Group switcher radio menu option
// Credits: Please see the F2 online manual (http://www.ferstaberinde.com/f2/en/)
// ====================================================================================

// JIP CHECK
// Prevents the script executing until the player has synchronised correctly:

#include "f_waitForJIP.sqf"

// ====================================================================================

if (isDedicated) exitWith {};

private ["_trigger"];

// Create a radio trigger that displays the group join dialog when activated.
_trigger = createTrigger ["EmptyDetector", [0,0,0]];
_trigger setTriggerArea [0, 0, 0, false];
_trigger setTriggerActivation ["INDIA", "PRESENT", true];
_trigger setTriggerText "Join nearby group...";
_trigger setTriggerTimeout [0,0,0,true];
_trigger setTriggerStatements ["this", "[] execVM ""f\common\f_groupSwitcherAction.sqf"";", ""];