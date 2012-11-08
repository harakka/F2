// F2 - Group join radio menu option
// Credits: Please see the F2 online manual (http://www.ferstaberinde.com/f2/en/)
// ====================================================================================

if (isDedicated) exitWith {};

private ["_trigger"];

// Create a radio trigger that displays the group join dialog when activated.
_trigger = createTrigger ["EmptyDetector", [0,0,0]];
_trigger setTriggerArea [0, 0, 0, true];
_trigger setTriggerActivation ["JULIET", "PRESENT", true];
_trigger setTriggerText "Join nearby group...";
_trigger setTriggerStatements ["this", "[] execVM f\common\f_grpJoinPicker.sqf", ""];