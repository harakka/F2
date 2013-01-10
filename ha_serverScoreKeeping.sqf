if (!isServer) exitWith {};
if (isnil "ha_score") then {ha_score = 0;};

ha_score = ha_score + 1;
if (ha_score >= ha_param_checkpointVictoryNum) then {
    [1] execVM "f\server\f_mpEndBroadcast.sqf";
}
