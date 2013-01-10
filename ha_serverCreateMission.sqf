if (!isServer) exitWith {};

waitUntil {scriptDone f_processParamsArray};

// Doesn't work on a dedicated server if done before exiting briefing: players don't get teleported,
// markers don't appear... the works. Pain in the ass
sleep 0.001;

// TODO: Params for route generation, externalize these
ha_CpCount = 0;					// This will be the actual checkpoint count once the route's genned
_paramCpMaxCount = ha_param_checkpointNum + 5;			// Maximum number of checkpoints in route
_paramCpMaxDistance = 800;		// ha_param_CpMaxDistance Maximum distance between two adjacent checkpoints in the route (1000)
_paramCpMinDistance = 400;		// ha_param_CpMinDistance Minimum distance between two adjacent checkpoints in the route (500)
_paramCpSpawnDistance = 1000;	// Maximum distance the player can spawn away from any checkpoint
_paramSideSpawnDistance = 1000; // Minimum distance for the two sides to spawn away from one another
_paramWestMinSpawnDistanceFromCPs = 500;	// West will spawn at least this far from any CP

_checkpoints = [];		// 3D array of all potential checkpoints. [#a, [#b, #c]] where a = number, b = name, c = position
_routeCheckpoints = [];	// Checkpoints on the route, by number
_usedCheckpoints = [];	// Used checkpoints not available for further stuff, by number
_nearCheckpoints = [];	// Checkpoints that are within useful distance of some checkpoint on route

// Make a list of all potential checkpoints with their names and locations, indexed by checkpoint number
// ----------------------
// Loop through all markers named ha_cp_# (where #: 0-999)
for [{_x = 0}, {_x <= 999}, {_x = _x + 1}] do {

	_marker = format["ha_cp_%1", _x];
	_isMarkerInvalid = [getMarkerPos _marker, [0,0,0]] call BIS_fnc_areEqual;
	
	// Only do stuff for markers that actually exist
	if (!_isMarkerInvalid) then {
		_checkpoints set [_x, [_marker, getMarkerPos _marker]];
	};
};

// Generate a route from the potential checkpoint list
// -----------------------------------------

_iterations = 0;			// Route generation loop iteration limit counter

_checkpointCount = count _checkpoints;				// Total number of checkpoints
_startCheckpoint = floor(random _checkpointCount);		// Route starting checkpoint
_usedCheckpoints = _usedCheckpoints + [_startCheckpoint];

_currentCheckpoint = _startCheckpoint;			// Current checkpoint in generation loop

if (f_var_debugMode == 1) then {
	player sidechat format["Number of potential checkpoints: %1, starting point: %2", _checkpointCount, _startCheckpoint];
};

_currentCheckpointPos = [];

while {((count _routeCheckpoints) < _paramCpMaxCount) && (_iterations < _checkpointCount)} do {

	_routeCountAtStart = count _routeCheckpoints;
	_nearToCurrentCps = [];

	_currentCheckpointPos = (_checkpoints select _currentCheckpoint) select 1;		// Current checkpoint position

	// Generate list of available checkpoints that are between _paramCpMinDistance - _paramCpMaxDistance away from _currentCheckpoint
	{
		_isCheckpointUnavailable = _forEachIndex in _usedCheckpoints;
		_cpDistToCurrent = _currentCheckpointPos distance (_x select 1);
		if (!_isCheckpointUnavailable && (_cpDistToCurrent >= _paramCpMinDistance) && (_cpDistToCurrent <= _paramCpMaxDistance)) then {
			_nearToCurrentCps = _nearToCurrentCps + [_forEachIndex];
		};
	} forEach _checkpoints;
	
	// If _nearToCurrentCps is empty at this point, no matching cps were found for this round
	if (count _nearToCurrentCps != 0) then {
	
		// Select a random checkpoint from that list as new current cp
		_currentCheckpoint = _nearToCurrentCps select (floor(random (count _nearToCurrentCps)));
		
		// Mark it as unavailable
		_usedCheckpoints = _usedCheckpoints + [_currentCheckpoint];
		
		// Add the new current cp to route
		_routeCheckpoints = _routeCheckpoints + [_currentCheckpoint];
		
		// Add nearby checkpoints to the common _nearCheckpoints list
		// Implementation note: substracting _nearToCurrentCps ensures no duplicates remain in _nearCheckpoints
		_nearCheckpoints = _nearCheckpoints - _nearToCurrentCps + _nearToCurrentCps;
	};
	
	_iterations = _iterations + 1;
};

ha_CpCount = count _routeCheckpoints;
[_routeCheckpoints] execVM "ha_serverCreateCheckpoints.sqf";

_nearCheckpoints = _nearCheckpoints - _usedCheckpoints;

// Select mission start checkpoints
//_westMissionStartCp = _nearCheckpoints select (floor(random (count _nearCheckpoints)));

// Select Guerrilla start position first, then use it to constraint the west start position
// Guerrillas can spawn pretty much wherever, including in the middle of all the caches
_eastMissionStartCp = _nearCheckpoints select (floor(random (count _nearCheckpoints)));

_badCheckpoints = [];			// Used by west start pos selection to avoid re-checking potential positions
_westMissionStartCp = 0;	

// Whenever a potential position "fails", it's marked as unusable and _westMissionStartCp is set to 0
while {_westMissionStartCp == 0} do {
    // Select a random checkpoint for testing... Yeah I know, it could hang on a bad day. Such is life.
    _westMissionStartCp = _nearCheckpoints select (floor(random (count _nearCheckpoints)));
    if (_westMissionStartCp in _badCheckpoints) then { _westMissionStartCp = 0;};
    
    // Check if the west start pos is far enough from east one
    if ((_westMissionStartCp > 0) && ((_checkpoints select _westMissionStartCp) select 1) distance ((_checkpoints select _eastMissionStartCp) select 1) < _paramSideSpawnDistance) then {
        _badCheckpoints = _badCheckpoints + [_westMissionStartCp];
        _westMissionStartCp = 0;
    };
    if (_westMissionStartCp > 0) then {
	    {
	    	// Check that the west start pos is far enough from every CP
	        if (((_checkpoints select _westMissionStartCp) select 1) distance ((_checkpoints select _x) select 1) < _paramWestMinSpawnDistanceFromCPs)
	            exitWith{ _badCheckpoints = _badCheckpoints + [_westMissionStartCp]; _westMissionStartCp = 0};
	    } forEach _routeCheckpoints;
    };
};

{	_usedCheckpoints =_usedCheckpoints + [_x]; _nearCheckpoints - [_x];
} forEach [_westMissionStartCp, _eastMissionStartCp];

// Teleport player groups to start positions
//-------------------------------------------
[_checkpoints, _westMissionStartCp, _eastMissionStartCp] execVM "ha_serverMovePlayers.sqf";

// Generate debug markers
if (f_var_debugMode == 1) then {
	player sidechat format["Route generation finished at iteration %1, useful checkpoints: %2", _iterations, count _nearCheckpoints];
	_null = [(format ["ha_cp_%1", _eastMissionStartCp]), "ColorRed", "mil_box"] execVM "ha_createDebugMarker.sqf";
	_null = [(format ["ha_cp_%1", _westMissionStartCp]), "ColorBlue", "mil_box"] execVM "ha_createDebugMarker.sqf";
};

ha_initMission = true;
publicVariable "ha_initMission";