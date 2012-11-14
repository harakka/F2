// F2 - Group switcher action
// Credits: Please see the F2 online manual (http://www.ferstaberinde.com/f2/en/)
// ====================================================================================

if (isDedicated) exitWith {};

private ["_playerGroupsNear", "_newGroup", "_group"];
_playerGroupsNear = [];
f_grpPicker_GrpList = [];
{
	_group = group _x;
	player sidechat format["%1", _group];
	//if (!(_x in _groups) && ({isPlayer _x} count units _x) > 0 && (alive (leader _grp)) then {
	if (_group != group player && !(_group in _playerGroupsNear) && (alive (leader _group))) then {
		_playerGroupsNear = _playerGroupsNear + [_group];
	};
} forEach nearestObjects [player, ["Man"], 50];
f_grpPicker_GrpList = _playerGroupsNear;
x = createDialog "GrpPicker";
waitUntil {f_var_GrpPicker_state == 1};
_newGroup = (player getVariable "f_var_grpPicker_grp");
player sidechat format["Joining %1", _newGroup];