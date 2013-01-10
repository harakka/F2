// This script manages the guerrilla detection markers ingame. It's run on all clients.
// awarness_markers.sqf is the serverside component.

if (isDedicated || faction player == "CDF") exitWith {};
//if (isDedicated) exitWith {};
if (isNil "ha_clientBluMarkers") then {ha_clientBluMarkers = [];};
// Clean up local markers, so player only sees max 20 at one time)
if (count ha_clientBluMarkers > 20) then {
	_tempArray = [];
	_clientMarkerCount = count ha_clientBluMarkers;
	for [{_x = _clientMarkerCount - 20}, {_x < _clientMarkerCount}, {_x = _x + 1}] do {
		_tempArray = _tempArray + [ha_clientBluMarkers select (_x)];
	};
	{
		deleteMarkerLocal _x;
	} forEach (ha_clientBluMarkers - _tempArray);
	ha_clientBluMarkers = _tempArray;
};

{
	// The random pos code lifted from Kylania & Big Dawg KS (http://forums.bistudio.com/showthread.php?t=122517)
	_ang = random 360;  
	_dis = random 30; 
	_dx = sin(_ang)*_dis; 
	_dy = cos(_ang)*_dis; 
	_posWithJitter = [(_x select 0) + _dx, (_x select 1) + _dy, 0];  

	_mkr = createMarkerLocal [format["%1:%2", date select 3, date select 4], _posWithJitter];
	_mkr setMarkerShapeLocal "ICON";
	_mkr setMarkerTypeLocal "hd_destroy";
	_mkr setMarkerTextLocal _mkr;
	ha_clientBluMarkers = ha_clientBluMarkers + [_mkr];
} forEach ha_bluMarkers;
if (count ha_bluMarkers > 0) then {hint format["Enemy sightings reported by cache guards!", count ha_bluMarkers];}
