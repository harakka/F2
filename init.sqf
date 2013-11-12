{_x setMarkerAlpha 0;} forEach ["ups_fields1", "ups_orchard", "ups_nizhnoye", "ups_dock1", "ups_orchard2", "ups_dock2", "ups_dock3", "ups_depot1", "ups_berezino1", "ups_berezino2", "ups_radar1", "ups_radar2", "ups_roadside"];


// ====================================================================================

// F2 - Process ParamsArray
// Credits: Please see the F2 online manual (http://www.ferstaberinde.com/f2/en/)
// WARNING: DO NOT DISABLE THIS COMPONENT

f_processParamsArray = [] execVM "f\common\f_processParamsArray.sqf";

// ====================================================================================

// F2 - Disable Saving and Auto Saving
// Credits: Please see the F2 online manual (http://www.ferstaberinde.com/f2/en/)

enableSaving [false, false];

// ====================================================================================

// F2 - Respawn INIT
// Credits: Please see the F2 online manual (http://www.ferstaberinde.com/f2/en/)

// f_respawnINIT = player addEventHandler ["killed", {_this execVM "init_onPlayerRespawn.sqf"}];

// ====================================================================================

// F2 - Mission Maker Teleport
// Credits: Please see the F2 online manual (http://www.ferstaberinde.com/f2/en/)

// f_missionMakerTeleport = 0;
// [] execVM "f\common\f_missionMakerTeleport.sqf";

// ====================================================================================

// F2 - OA Briefing
// Credits: Please see the F2 online manual (http://www.ferstaberinde.com/f2/en/)

[] execVM "briefing.sqf";

// ====================================================================================

// F2 - Mission Conditions Selector
// Credits: Please see the F2 online manual (http://www.ferstaberinde.com/f2/en/)

[] execVM "f\common\f_setMissionConditions.sqf";

// ====================================================================================

// F2 - OA Folk Group IDs
// Credits: Please see the F2 online manual (http://www.ferstaberinde.com/f2/en/)

f_script_setGroupIDs = [] execVM "f\common\folk_setGroupIDs.sqf";

// ====================================================================================

// F2 - ShackTactical Fireteam Member Markers
// Credits: Please see the F2 online manual (http://www.ferstaberinde.com/f2/en/)

[] execVM "f\common\ShackTac_setlocalFTMemberMarkers.sqf";

// ====================================================================================

// F2 - OA Folk Group Markers
// Credits: Please see the F2 online manual (http://www.ferstaberinde.com/f2/en/)

[] execVM "f\common\folk_setLocalGroupMarkers.sqf";

// ====================================================================================

// F2 - F2 Common Local Variables
// Credits: Please see the F2 online manual (http://www.ferstaberinde.com/f2/en/)
// WARNING: DO NOT DISABLE THIS COMPONENT

f_script_setLocalVars = [] execVM "f\common\f_setLocalVars.sqf";

// ====================================================================================

// F2 - Multiplayer Ending Controller 
// Credits: Please see the F2 online manual (http://www.ferstaberinde.com/f2/en/)

f_endSelected = -1;
[] execVM "f\common\f_mpEndSetUp.sqf";

// ====================================================================================

// F2 - Kegetys Spectator Script
// Credits: Please see the F2 online manual (http://www.ferstaberinde.com/f2/en/)

[] execVM "f\common\f_spect\specta_init.sqf";

// ====================================================================================

// F2 - Disable BIS Conversations
// Credits: Please see the F2 online manual (http://www.ferstaberinde.com/f2/en/)

player setVariable ["BIS_noCoreConversations", true];

// ====================================================================================

// F2 - Automatic Body Removal
// Credits: Please see the F2 online manual (http://www.ferstaberinde.com/f2/en/)

// f_removeBodyDelay = 180;
// f_doNotRemoveBodies = [];
// [] execVM "f\common\f_addRemoveBodyEH.sqf";

// ====================================================================================

// F2 - Automatic Body Removal (FIFO)
// Credits: Please see the F2 online manual (http://www.ferstaberinde.com/f2/en/)

// f_abrFIFOlength = 30;
// f_abrDistance = 150;
// f_abrFIFOmaxLength = 50;
// f_doNotRemoveBodies = [];
// ["fifo"] execVM "f\common\f_addRemoveBodyEH.sqf";
// [] execVM "f\server\f_abrFIFO.sqf";

// ====================================================================================

// F2 - Dynamic View Distance 
// Credits: Please see the F2 online manual (http://www.ferstaberinde.com/f2/en/)

//f_viewDistance_default = 1200;
//f_viewDistance_tank = 2000;
//f_viewDistance_rotaryWing = 2000;
//f_viewDistance_fixedWing = 2500;
//[] execVM "f\common\f_addSetViewDistanceEHs.sqf";

// ====================================================================================

// F2 - Authorised Crew Check
// Credits: Please see the F2 online manual (http://www.ferstaberinde.com/f2/en/)

// VehicleName addEventhandler ["GetIn", {[_this,[UnitName1,UnitName2]] execVM "f\common\f_isAuthorisedCrew.sqf"}];

// ====================================================================================

// F2 - Authorised Crew Type Check
// Credits: Please see the F2 online manual (http://www.ferstaberinde.com/f2/en/)

// VehicleName addEventhandler ["GetIn", {[_this,["UnitType1","UnitType2"]] execVM "f\common\f_isAuthorisedCrewType.sqf"}];

// ====================================================================================

// F2 - Casualties Cap
// Credits: Please see the F2 online manual (http://www.ferstaberinde.com/f2/en/)

[[GrpRU_CO, GrpRU_DC, GrpRU_ASL, GrpRU_A1, GrpRU_A2, GrpRU_A3, GrpRU_BSL, GrpRU_B1, GrpRU_B2, GrpRU_B3, GrpRU_CSL, GrpRU_C1, GrpRU_C2, GrpRU_C3, GrpRU_DSL, GrpRU_D1, GrpRU_D2, GrpRU_D3, GrpRU_ST1, GrpRU_ST2],100,1] execVM "f\server\f_endOnCasualtiesCap.sqf";

// ====================================================================================

// F2 - Casualties Cap (Advanced)
// Credits: Please see the F2 online manual (http://www.ferstaberinde.com/f2/en/)

// [[GroupName],100] execVM "f\server\f_casualtiesCapAdv.sqf";

// ====================================================================================

// F2 - AI Skill Selector (coop)
// Credits: Please see the F2 online manual (http://www.ferstaberinde.com/f2/en/)

// f_isFriendlyBLU = 1;
// f_isFriendlyRES = 1;
// f_isFriendlyOPF = 0;
// f_isFriendlyCIV = 1;
// [] execVM "f\common\f_setAISkill.sqf";

// ====================================================================================

// F2 - AI Skill Selector (A&D)
// Credits: Please see the F2 online manual (http://www.ferstaberinde.com/f2/en/)

// f_isFriendlyToBLU_RES = 1;
// f_isFriendlyToBLU_CIV = 1;
// [] execVM "f\common\f_setAISkillAD.sqf";

// ====================================================================================

// F2 - Construction Interface (COIN) Presets
// Credits: Please see the F2 online manual (http://www.ferstaberinde.com/f2/en/)

// f_COINstopped = false;
// [COINName,"UnitName",0,2500] execVM "f\common\f_COINpresets.sqf";

// ====================================================================================

// F2 - Name Tags
// Credits: Please see the F2 online manual (http://www.ferstaberinde.com/f2/en/)

// [] execVM "f\common\f_recog\recog_init.sqf";

// ====================================================================================

// F2 - Group E&E Check
// Credits: Please see the F2 online manual (http://www.ferstaberinde.com/f2/en/)

// [GroupName,ObjectName,100,1] execVM "f\server\f_groupEandECheck.sqf";

// ====================================================================================

// F2 - ORBAT notes
// Credits: Please see the F2 online manual (http://www.ferstaberinde.com/f2/en/)

[] execVM "f\common\f_orbatNotes.sqf";

// ====================================================================================

// F2 - Tripwire action
// Credits: Please see the F2 online manual (http://www.ferstaberinde.com/f2/en/)

// [[UnitName1,UnitName2],25,2,east] execVM "f\common\fa_tripwire_init.sqf";

// ====================================================================================

// F2 - Join Group Action
// Credits: Please see the F2 online manual (http://www.ferstaberinde.com/f2/en/)

[false] execVM "f\common\f_groupJoinAddOption.sqf";

// Custom scripts
[] execVM "custom\breath_fog.sqf";
[] execVM "custom\groupTeleport.sqf";
[] execVM "custom\player_altitude.sqf";
[] execVM "custom\supply_marker2.sqf";

//Init UPSMON script
call compile preprocessFileLineNumbers "scripts\Init_UPSMON.sqf";

//Process statements stored using setVehicleInit
processInitCommands;
//Finish world initialization before mission is launched. 
finishMissionInit;