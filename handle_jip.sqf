if (isDedicated) exitWith{};

if (time > 10 || isNull player || (group player) == GrpRU_JIP) then {
	waitUntil {f_var_JIP_state == 3};
};