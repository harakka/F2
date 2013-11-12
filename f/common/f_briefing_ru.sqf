// F2 - RU Briefing
// Credits: Please see the F2 online manual (http://www.ferstaberinde.com/f2/en/)
// ====================================================================================

// FACTION: RU

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
Made by harakka for the Folk and ARPS ninjas. Be Stealth!
<br/><br/>
Mission uses following scripts by the community:<br/>
UPSMON by Monsada, Rafalsky, Kronzky et al<br/>
Breath fog script by tpw, Doolittle<br/>
GroupEject by Kylania<br/>
<br/><br/><br/>
Made with F2 (http://www.ferstaberinde.com/f2/en/)
"]];

// ====================================================================================

// NOTES: ADMINISTRATION
// The code below creates the administration sub-section of notes.

_adm = player createDiaryRecord ["diary", ["Administration","
INSERTION<br/>
Every element leader has an action menu option to teleport his group for HALOing. Avoid teleporting inside the main AO (red circle). Confirm all members of the group are properly loaded into the game before you use the teleport action.<br/>
The group will be teleported HALO-ready at 3000m altitude. Parachutes will open automatically at safe altitude of around 200m. You have about 45 seconds of freefall.<br/>
Be careful not to open your parachute prematurely!<br/>
REMEMBER: Right Ctrl + M will open GPS map to help navigate for landing.<br/><br/>

EQUIPMENT<br/>
Everyone except marksmen are equipped with suppressed AKS-74Us. Marksmen carry the VSS suppressed sniper rifle.<br/>
Every saboteur carries 3 mines and 2 satchels.<br/>
Two supply crates containing ammo, rockets, satchels and mines will be paradropped deeper into the area of operations. Their location will be marked on map once they land. Use them if you need to resupply during the mission.
<br/><br/>
JOIN-IN-PROGRESS (JIP):<br/>
When joining during the mission, players will be able to select their squad and gear in the action menu. Ask which squad to join if unsure. After options have been selected, JIP players will be teleporter HALO-ready at 3000m altitude on the position of their selected squad's leader.
"]];

// ====================================================================================

// NOTES: MISSION
// The code below creates the mission sub-section of notes.

_mis = player createDiaryRecord ["diary", ["Mission","
PRIMARY OBJECTIVES<br/>
0. HALO (High Altitude - Low Opening) jump into positions designated by the commander.<br/>
1. Eliminate any defenses located at Nizhnoye dock in preparation for possible amphibious assault, marked <marker name='mkr_task_dock'>DOCK</marker>.<br/>
2. Destroy CDF long-range anti-air and artillery radars with satchels, marked <marker name='mkr_task_radar1'>RADAR 1</marker> and <marker name='mkr_task_radar2'>RADAR 2</marker>.<br/>
3. Destroy CDF self-propelled anti-air systems, marked <marker name='mkr_task_aa1'>AA 1</marker> and <marker name='mkr_task_aa2'>AA 2</marker>.<br/>
4. Disable or destroy vehicles parked at CDF vehicle depot, marked <marker name='mkr_task_depot'>VEHICLE DEPOT</marker>.<br/><br/>

OPTIONAL OBJECTIVE<br/>
4. Mine the major roads leading into Berezino area to hinder CDF reinforcements. Suggested roads are marked on your map, but the positioning of mines is left for the commander to decide.<br/><br/>

<br/><br/>
NOTE: commander is free to complete objectives in any order.

"]];

// ====================================================================================

// NOTES: SITUATION
// The code below creates the situation sub-section of notes.

_sit = player createDiaryRecord ["diary", ["Situation","
<br/>
In a few hours, the Russian Ground Forces will enter Chernarus to ensure the safety of the large resident Russian population, who have recently come under threat of politically and ethnically motivated violence by Chernarussian nationalist extremists.<br/>
The intent of the first strike is to quickly neutralize CDF's defense capabilities to minimize casualties on both sides and limit duration of the conflict.
<br/><br/>
Before the main attack begins, your Spetsnaz detachment will be inserted via parachutes behind enemy lines, to destroy CDF defense assets and hinder movement into the Berezino area, preparing it as a beachhead for the coming invasion.
<br/><br/>
ENEMY FORCES
<br/>
Infantry patrols and light vehicles in the area marked with red circle, mostly on roads and in built-up areas. CDF may reinforce the area with motorized infantry, paratroopers and heavier vehicles once your presence is detected.
<br/><br/>
FRIENDLY FORCES
<br/>
None.
<br/><br/><br/>
"]];

// ====================================================================================