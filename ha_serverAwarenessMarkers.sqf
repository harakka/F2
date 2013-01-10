// This script was inspired by the Awarness Script v1.00 by afp, December 2009.

if (!isServer) exitWith {};
if (isNil "ha_bluMarkers") then {ha_bluMarkers = [];};

sleep 10;

_bluGroups = [];
_resGroups = [];

{
    if (side _x == resistance && !(_x in _resGroups)) then {
        _resGroups = _resGroups + [_x];
	} else {
    	if (side _x == west && !(_x in _bluGroups)) then {
            _bluGroups = _bluGroups + [_x];
        };
    };
} forEach allGroups;

while {true} do {
	sleep 30;
	_detectedPlayers = [];
	ha_bluMarkers = [];
	{
		_bluGroup = _x;
		{
            // Only AI-controlled squads that are alive can send BLUFOR location updates
            // I don't know for sure if dead AI update knowledge values, but better safe than sorry
			_gueGroup = _x;
            if (!(isPlayer leader _gueGroup) && (({alive _x} count units _gueGroup) > 0)) then {
				sleep 0.01;
				{
					sleep 0.01;
					if (!(_x in _detectedPlayers) && (_gueGroup knowsAbout _x > 1)) then {
						_detectedPlayers = _detectedPlayers + [_x];
						ha_bluMarkers = ha_bluMarkers + [getPos _x];
					};
				} forEach units _bluGroup;
            };
		} forEach _resGroups;
	} forEach _bluGroups;
    
    // TODO: This doesn't quite work yet. It should update markers for
    // Non-dedicated servers, but doesn't (probably misnamed variables)
    if (isServer && !isDedicated) then {
        [] execVM "ha_clientAwarenessMarkers.sqf";}
    else {
		if (count ha_bluMarkers > 0) then {publicVariable "ha_bluMarkers";};
    }
};