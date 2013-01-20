if (isDedicated) exitWith {};

sleep 0.001;
titleText ["Loading...", "BLACK FADED", 0];
waitUntil{!(isNil "BIS_fnc_init")};
waitUntil{(!isNil "ha_initMission") && (!isNil "ha_initCheckpoints") && (!isNil "ha_initMovePlayers")};
titleFadeout 2;
sleep 1;
cutRsc ["introImage", "PLAIN", 1];
titleText [format["Planning timer starts. You have %1 minutes.", ha_param_briefingTime], "PLAIN"];
