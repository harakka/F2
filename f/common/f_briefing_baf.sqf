// F2 - OA Briefing
// Credits: Please see the F2 online manual (http://www.ferstaberinde.com/f2/en/)
// ====================================================================================

// FACTION: BRITISH ARMED FORCES

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
Made by harakka for the Folk ARPS sessions.<br/>
Uses Head's force landing script with modifications.<br/>
Original stub created by Wolfenswan to commemorate the release of F2 2-7-0.
<br/><br/>
Made with F2 (http://www.ferstaberinde.com/f2/en/)<br/>
"]];

// ====================================================================================

// NOTES: ADMINISTRATION
// The code below creates the administration sub-section of notes.

_adm = player createDiaryRecord ["diary", ["Administration","
<br/>
END CONDITIONS<br/>
The mission will end if BAF is wiped out, if Spetsnaz destroy all of their targets, if all enemies are eliminated from the AO, or if a time limit of 35 minutes is reached.<br/><br/>
TRANSPORT<br/>
Units start mounted in:<br/>
1 x Chinook - loaded with spare ammo<br/>
2 x Merlin - loaded with spare ammo<br/><br/>
<br/>
OTHER NOTES<br/>
Do not dismount the helicopters while on the carrier, doing so may lead to sudden death or other unpleasantness.<br/>
"]];

// ====================================================================================

// NOTES: EXECUTION
// The code below creates the execution sub-section of notes.

_exe = player createDiaryRecord ["diary", ["Execution","
<br/>
COMMANDER'S INTENT
<br/>
Protect designated areas and any other areas the Spetsnaz may attempt to destroy. Optionally clean out Elektrozhavodsk of hostiles.
<br/><br/>
MOVEMENT PLAN
<br/>
It may be possible to land within the ChDKZ-held area designated by the red border. If doing so, practice haste and utmost caution. Do not overfly the town unless you intend to draw fire from any enemy vehicles possibly hiding therein.
<br/><br/>
FIRE SUPPORT PLAN
<br/>
None.
<br/><br/>
SPECIAL TASKS
<br/>
None.
"]];

// ====================================================================================

// NOTES: MISSION
// The code below creates the mission sub-section of notes.

_mis = player createDiaryRecord ["diary", ["Mission","
<br/>
PRIMARY OBJECTIVE<br/>
Protect <marker name='mkr_obj09'>the power plant</marker>, <marker name='mkr_obj05'>gas station</marker>, <marker name='mkr_obj02'>fuel storage 1</marker> and <marker name='mkr_obj01'>fuel storage 2</marker> from heliborne Spetsnaz saboteurs.<br/><br/>
SECONDARY OBJECTIVE<br/>
The Spetsnaz may attempt to destroy other locations as well. Intercept and stop them if possible.<br/>
"]];

// ====================================================================================

// NOTES: SITUATION
// The code below creates the situation sub-section of notes.

_sit = player createDiaryRecord ["diary", ["Situation","
<br/>
Russian troops have entered Chernarus on the pretext of protecting the Russian minority from ethnically and politically motivated violence.<br/>
Supporting the Russians, the Chernarussian Movement of the Red Star (ChDKZ, Chedaki) communist insurgents have started a military campaign of their own. A few hours ago they attacked and routed the Chernarussian Defence Forces (CDF) units stationed in the city of Elektrozhavodsk.<br/><br/>

Elektrozhavodsk is a major industrial, transport and service hub. Our intel indicates the Russians are taking an advantage of their assumed friendliness with the ChDKZ.
They are sending Spetsnaz units to destroy key civilian assets and infrastructure in the area to demoralize both CDF military and to erode their civilian support.<br/><br/>

British Armed Forces, up to now only a neutral observer, is the only party currently in position to stop these illegal attacks on civilian infrastructure. You are authorizes to engage both ChDKZ and Russian forces in the area.
<br/><br/>
ENEMY FORCES
<br/>
ChDKZ<br/>Large number of infantry in town, probably disorganized and spread out. Expect technicals and small numbers of light armor. ChDKZ is capable of reinforcing if their control of the city is contested.<br/>
Russian Armed Forces<br/>
No current presence. Multiple squads of heliborne Spetsnaz on the way to the AO.
<br/><br/>
FRIENDLY FORCES
<br/>
None known.
<br/>
"]];

// ====================================================================================