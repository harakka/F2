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

/*
	_playerGroupsNear = [];
	{
		
		//if (!(_x in _groups) && ({isPlayer _x} count units _x) > 0 && (alive (leader _grp)) then {
		if (!(group _x in _playableGroupsNear) && (alive (leader group _x)) then {
			_playerGroupsNear = _playerGroupsNear + [group _x];
		};
	} forEach position player nearObjects ["Man", 50];
	*/