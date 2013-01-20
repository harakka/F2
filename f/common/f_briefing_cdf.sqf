// F2 - OA Briefing
// Credits: Please see the F2 online manual (http://www.ferstaberinde.com/f2/en/)
// ====================================================================================

waitUntil {scriptDone f_processParamsArray};

// FACTION: CDF

// ====================================================================================

// TASKS
// The code below creates tasks. A (commented-out) sample task is included.

// _task1 = player createSimpleTask ["OBJ_1"];
// _task1 setSimpleTaskDescription ["IN DEPTH OBJECTIVE DESCRIPTION", "SHORT OBJECTIVE DESCRIPTION", "WAYPOINT TEXT"];
// _task1 setSimpleTaskDestination WAYPOINTLOCATION;
// _task1 setTaskState "Created";

// ====================================================================================

// NOTES: CREDITS
// The code below creates the administration sub-section of notes.

_cre = player createDiaryRecord ["diary", ["Credits","
<br/>
Made by harakka with love for Folk ARPS. Thanks to all FA session players for suggestions and bugreports.
<br/>
<br/>
Uses SHK_moveobjects.sqf by Shuko: http://forums.bistudio.com/showthread.php?92018-SHK_moveobjects
<br/><br/>
Made with F2 (http://www.ferstaberinde.com/f2/en/)
"]];

// ====================================================================================

// NOTES: ADMINISTRATION
// The code below creates the administration sub-section of notes.

_adm = player createDiaryRecord ["diary", ["Administration","
<br/>
DESTROYING CACHES
<br/>
Satchel charges must be used to destroy caches. All fireteam members are equipped with satchel charges.
<br/><br/>
TRANSPORT
<br/>
5x UAZ<br/>
3x Transport truck
"]];

// ====================================================================================

// NOTES: EXECUTION
// The code below creates the execution sub-section of notes.

_exe = player createDiaryRecord ["diary", ["Execution","
<br/>
COMMANDER'S INTENT
<br/>
Destroy the marked NAPA equipment caches by using satchels, with minimum casualties to your squad.
"]];

// ====================================================================================

// NOTES: MISSION
// The code below creates the mission sub-section of notes.

_mis = player createDiaryRecord ["diary", ["Mission", format["
OBJECTIVES<br/>
Destroy NAPA weapon caches. Mission is successful once either %1 out of %2 caches are destroyed, or all NAPA units have been eliminated.
<br/><br/>
White circles indicate cache locations. Red circles indicate destroyed caches. Your mission is successful once the set number of caches have been destroyed, or NAPA units have been eliminated.
<br/><br/>
NOTE: Cache markers will only be visible AFTER briefing phase ends, and your starting positions will also change (via automatic teleport).
", ha_param_checkpointVictoryNum, ha_param_checkpointNum+5]]];

// ====================================================================================

// NOTES: SITUATION
// The code below creates the situation sub-section of notes.

_sit = player createDiaryRecord ["diary", ["Situation","
<br/>
The Chernarussian Defence Forces (CDF) intel has indicated locations of several National Party (NAPA) guerrilla equipment caches.
However NAPA is about to relocate the caches, and we must move in swiftly to intercept them and destroy the caches.
<br/><br/>
ENEMY FORCES
<br/>
NAPA guerrillas, number unknown. No armed vehicles or armor. The caches are very likely to be guarded. The enemy can communicate your location amongst themselves if you are spotted, and may send patrols to hunt you down.
<br/><br/>
FRIENDLY FORCES
<br/>
None.
"]];

// ====================================================================================