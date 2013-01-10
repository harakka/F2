if (isServer) exitWith {};

sleep 0.001;
titleText ["Somewhere on Chernarus...", "BLACK FADED", 0];
waitUntil{!(isNil "BIS_fnc_init")};
waitUntil{(!isNil "ha_initMission") && (!isNil "ha_initCheckpoints") && (!isNil "ha_initMovePlayers")};
titleFadeout 1;

