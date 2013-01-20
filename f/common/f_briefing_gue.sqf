// F2 - OA Briefing
// Credits: Please see the F2 online manual (http://www.ferstaberinde.com/f2/en/)
// ====================================================================================

// FACTION: GUERILLA NAPA

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
CACHES
<br/>
Each cache is guarded by 2-5 friendly AI units. CDF must use satchel charges to destroy caches. The friendly AI will report enemy sightings to you via map markers, unless they are wiped out very quickly. These markers are accurate to about 30 meters and include a timestamp.
<br/><br/>
TRANSPORT
<br/>
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
Assist our comrades in protecting the equipment caches, and eliminate any CDF soldiers sent to destroy them.
"]];

// ====================================================================================

// NOTES: MISSION
// The code below creates the mission sub-section of notes.

_mis = player createDiaryRecord ["diary", ["Mission", format["
OBJECTIVES<br/>
Protect the weapon caches and eliminate CDF troops. The enemy is victorious if they destroy %1 out of %2 caches, or all of our soldiers are dead.
<br/><br/>
White circles indicate cache locations. Red circles indicate destroyed caches.
<br/><br/>
NOTE: Cache markers will only be visible AFTER briefing phase ends, and your starting positions will also change (via automatic teleport).
", ha_param_checkpointVictoryNum, ha_param_checkpointNum+5]]];

// ====================================================================================

// NOTES: SITUATION
// The code below creates the situation sub-section of notes.

_sit = player createDiaryRecord ["diary", ["Situation","
<br/>
An ex-comrade has leaked information to CDF about the location of our equipment caches, and CDF is on their way to destroy them. This equipment is vital in our strife to keep our country free and has been acquired at great expense. The caches must be protected at any means until we can relocate them. Our boys are already standing guard at each cache. Your job is to help safeguard the caches, and hunt down the CDF soldiers sent to destroy them.
<br/><br/>
ENEMY FORCES
<br/>
CDF force of unknown size, no armed vehicles or armor.
<br/><br/>
FRIENDLY FORCES
<br/>
Every cache is manned by 2-5 comrades. Jaroslav is ill and couldn't come today, so Vasil is filling out for him. If you see him, don't joke about the ill-fitting ski mask, he tries really hard.
"]];

// ====================================================================================