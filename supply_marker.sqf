// Create crate marker for JIP
if (time > 10) then {
	waitUntil {!isNull player && !isNil "ha_supplyCratePos"};
	_boxMarker = createMarkerLocal["supply_crate01", ha_supplyCratePos];
	_boxMarker setMarkerShapeLocal "ICON";
	_boxMarker setMarkerTypeLocal "DOT";
	_boxMarker setMarkerTextLocal "Supply Drop";
};

// Create marker for everyone else
if (!isServer) exitWith {};

sleep 0.1;
waitUntil {time > 0};

_boxMarker = createMarker["supply_crate01", position supply_crate01];
_boxMarker setMarkerShape "ICON";
_boxMarker setMarkerType "DOT";
_boxMarker setMarkerText "Equipment Drop";
ha_supplyCratePos = position supply_crate01;
publicVariable "ha_supplyCratePos";