/* 
 * 
 * by: harakka
 */
if (!isServer) exitWith {};

{
    if (isNil "ha_gen_marker_count") then { ha_gen_marker_count = 0;};
    
    _marker_names = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "L", "K"];
    
	_id = _x;
	_marker = format["ha_cp_%1", _id];
	_pos = getMarkerPos _marker;
	
	// Create checkpoint objects
	/* This is interesting: since _cpObject reference won't exist at the time of
	 * trigger activation, we need to do a "variable variable": since ArmAscript
	 * allows code generation, we generate a variable name from a string and then
	 * use that global name to store a reference to the _cpObject, and later on
	 * that generated global name gets used by the trigger activation.
	 * UGLY CODE WARNING!
	*/
	
	call compile format ['ha_cpObject_%1 = "LocalBasicWeaponsBox" createVehicle getMarkerPos _marker;', _id];
    call compile format ['clearMagazineCargoGlobal ha_cpObject_%1;', _id];
    call compile format ['clearWeaponCargoGlobal ha_cpObject_%1;', _id];
    call compile format ['ha_cpObject_%1 addWeaponCargoGlobal["Makarov", 99];', _id];
    call compile format ['ha_cpObject_%1 addMagazineCargoGlobal["8Rnd_9x18_Makarov", 99];', _id];
    // Ensure the cache can only be destroyed with a satchel charge
	call compile format ['ha_cpObject_%1 addEventHandler ["handleDamage", {if ((getText(configFile >> "CfgAmmo" >> (_this select 4) >> "simulation") in ["shotPipeBomb", "shotTimeBomb"])) then {1};}]', _id];

	_cpCamo = "Land_CamoNetVar_EAST" createVehicle _pos;
    
    // Coop
    if (ha_param_coop == 1) then {
		if (ha_param_moreEnemies == 1) then {
            _grp = [_pos, resistance, 8, [], [], [0.1,0.1,0.1], [], [3, 0.7]] call BIS_fnc_spawnGroup;
        	
    	} else {
        	_grp = [_pos, resistance, 5, [], [], [0.1,0.1,0.1], [], [3, 0.5]] call BIS_fnc_spawnGroup;
        };
    // Adversarial
    } else {
        _grp = [_pos, resistance, 4, [], [], [0.1,0.1,0.1], [], [2, 0.4]] call BIS_fnc_spawnGroup;
    };
    
    // Doesn't really work, I think only commander's facing matters and rest will act per formation
    {_x setDir random 360} forEach units _grp;
    
    // Random behavior: casual patrolling and chilling etc.
    [_grp, _pos] call bis_fnc_taskDefend;

    
    _grp setCombatMode "RED";
    _grp setBehaviour "COMBAT";
	
	_trigger = createTrigger ["EmptyDetector", _pos];
	_trigger setTriggerArea [0,0,0,false];
	_trigger setTriggerActivation["NONE", "PRESENT", false];	// The first 2 params don't matter because of statements
	_trigger setTriggerStatements [format["!alive ha_cpObject_%1", _id],	format["""%1"" setMarkerType""Flag""; hint ""A cache has been destroyed!""; [] execVM ""ha_serverScoreKeeping.sqf"" ", _marker], ""];
	
	// Set marker settings
	_marker setMarkerShape "ICON";
	_marker setMarkerType "mil_circle";
	_marker setMarkerText format[" %1 (%2)", (_marker_names select ha_gen_marker_count), _id];
    ha_gen_marker_count = ha_gen_marker_count + 1;
} forEach (_this select 0);

ha_initCheckpoints = true;
publicVariable "ha_initCheckpoints";