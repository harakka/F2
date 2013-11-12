// Create crate marker for JIP
if (time > 10) then {
	waitUntil {!isNull player && !isNil "ha_supplyCratePos"};
	{
		_boxMarker = createMarkerLocal[format["supply_crate%1", _x], _x];
		_boxMarker setMarkerShapeLocal "ICON";
		_boxMarker setMarkerTypeLocal "DOT";
		_boxMarker setMarkerTextLocal "Supply Drop";
	} foreach ha_supplyCratePos;
};

// Create marker for everyone else
if (!isServer) exitWith {};

sleep 0.1;
waitUntil {time > 0};
ha_supplyCratePos = [];
{
	_boxMarker = createMarker[format["supply_crate%1", count ha_supplyCratePos], (position _x)];
	_boxMarker setMarkerShape "ICON";
	_boxMarker setMarkerType "DOT";
	_boxMarker setMarkerText "Equipment Drop";
	ha_supplyCratePos = ha_supplyCratePos + [position _x];
} foreach [supply_crate01, supply_crate02];
publicVariable "ha_supplyCratePos";