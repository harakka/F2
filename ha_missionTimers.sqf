// If the script is run by the server, start monitoring timers
if (isServer) then {
	player globalchat "ding from isServer";
	[] spawn {
		_briefingTime = 60*ha_param_briefingTime;
		_totalTime = _briefingTime + 60*ha_param_missionTime;
		
		waitUntil {time >= _briefingTime};
		ha_timerBriefingEnd = true;
		publicVariable "ha_timerBriefingEnd";

		if (ha_param_missionTime > 0) then {
			waitUntil {time >= _totalTime};
			myEnd = [5] execVM "f\server\f_mpEndBroadcast.sqf";
		};
	};
};
// If the script is run by the client, wait for the briefing end signal
if (!isDedicated) then {
	player globalchat "ding from !isDedicated";
	waitUntil {scriptDone f_processParamsArray};
	waitUntil {!isNil "ha_timerBriefingEnd"};
	if (ha_param_missionTime > 0) then {
		titleText [format["Mission begins. You have %1 minutes before mission ends. Good luck!", ha_param_missionTime], "PLAIN"];
	} else {
		titleText ["Mission begins. Good luck!", "PLAIN"];
	};
	player globalchat "ding again from !isDedicated";
};