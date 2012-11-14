// F2 - JIP Reinforcement Options
// Credits: Please see the F2 online manual (http://www.ferstaberinde.com/f2/en/)
// ====================================================================================

// DECLARE VARIABLES AND FUNCTIONS

private ["_unit","_textAction","_grp","_joinDistance","_loadout"];
_joinDistance = 10;

// ====================================================================================

// REMOVE REINFORCEMENT OPTIONS ACTION TO PLAYER ACTION MENU
// We remove the action to the player's action menu.
// NB This is on the assumption that the player has made positive selections and not
// cancelled the menu.

player removeAction F2_JIP_reinforcementOptionsAction;

// ====================================================================================

// ALLOW PLAYER TO SELECT GROUP
// Using a dialog we allow the player to select the group s/he is going to [re-]join.

f_var_JIP_state = 0;

// f_grpPicker_GrpList will contain the list of groups shown in the group picker dialog
f_grpPicker_GrpList = [];
{
    private "_grp";
    _grp = _x;
    if (side(_grp) == side(player) && (faction (leader _grp) == faction player ) && (alive (leader _grp) ) && (_grp != group(player))) then
    {
    	f_grpPicker_GrpList = f_grpPicker_GrpList + [_grp];
    };
} forEach allGroups;

x = createDialog "GrpPicker";
waitUntil {f_var_GrpPicker_state == 1}
f_var_JIP_state = 1;
_grp = (player getVariable "f_var_grpPicker_grp");

// ====================================================================================

// ALLOW PLAYER TO SELECT LOADOUT
// Using a dialog we allow the player to select the loadout s/he requires.

f_var_JIP_state = 2;
x = createDialog "KitPicker";
waitUntil {f_var_JIP_state == 3};
_loadout = (player getVariable "f_var_JIP_loadout");

// ====================================================================================

// IMPLEMENT CHOICES
// Using the choices made by the player we implement the desired loadout and set the
// target group for her/him to join.

[player] joinSilent grpNull;
nul = [_grp,_joinDistance] execVM "f\common\f_JIP_nearTargetGroupCheck.sqf";
nul = [_loadout,player] execVM "f\common\folk_assignGear.sqf";

// ====================================================================================


