#define DLG (uiNamespace getVariable "GrpJoinPick_Dlg")
#define COMBO (uiNamespace getVariable "GrpJoinPick_Combo")
#define USEBUTTON (uiNamespace getVariable "GrpJoinPick_UseBtn")

GrpJoinPickInit =
{
    uiNamespace setVariable ["GrpJoinPick_Dlg", _this select 0];
    uiNamespace setVariable ["GrpJoinPick_Combo", (_this select 0) displayCtrl 1];
    uiNamespace setVariable ["GrpJoinPick_UseBtn", (_this select 0) displayCtrl 3];

    USEBUTTON ctrlEnable false;
    GrpList = [];
    GrpCount = 0;
	
	_playerGroupsNear = [];
	{
		
		//if (!(_x in _groups) && ({isPlayer _x} count units _x) > 0 && (alive (leader _grp)) then {
		if (!(group _x in _playableGroupsNear) && (alive (leader group _x)) then {
			_playerGroupsNear = _playerGroupsNear + [group _x];
		};
	} forEach position player nearObjects ["Man", 50];
	
    {
        private "_grp";
        _grp = _x;
        if (side(_grp) == side(player) && (faction (leader _grp) == faction player ) && (alive (leader _grp) ) && (_grp != group(player))) then
        {
            GrpList set [GrpCount, _grp];
            private "_idx";
            _idx = COMBO lbAdd str(_grp); COMBO lbSetValue [_idx, GrpCount + 1];
            GrpCount = GrpCount + 1;
        };
    } forEach _playerGroupsNear;

    _sel = player getVariable "GrpPicker_Selection";
    if (!isNil '_sel') then
    {
        COMBO lbSetCurSel _sel;
    };
};

GrpJoinPicker_Pick =
{
    private "_idx";
    _idx = lbCurSel COMBO;
    if (_idx < 0) exitWith {};

    private "_data";
    _data = COMBO lbValue _idx;
    if (_data == 0) exitWith {};

    private "_grp";
    _grp = GrpList select (_data - 1);

    closeDialog 0;
    player setVariable ["f_var_JIP_grp", _grp];
    player setVariable ["GrpPicker_Selection", _idx];
    f_var_JIP_state = 1;
};

GrpJoinPicker_OnSelChanged =
{
    private "_idx";
    _idx = lbCurSel COMBO;
    if (_idx < 0) exitWith
    {
        USEBUTTON ctrlEnable false;
    };

    _data = COMBO lbValue _idx;
    if (_data == 0) exitWith
    {
        USEBUTTON ctrlEnable false;
    };
    USEBUTTON ctrlEnable true;
};
