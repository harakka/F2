//////////////////////////////////////////////////////////
// Function file for ArmA2: Operation Arrowhead
// Created by: kylania
//
// nul = [groupLeader] execVM "groupEject.sqf";
//
// Converted to ArmA2:OA from eject1.sqs by Matt Rochelle
// http://forums.bistudio.com/showthread.php?t=74043
//////////////////////////////////////////////////////////

if (isServer) then
{
	_grp = group (_this select 0);

	sleep (random 3);

	{
		unassignVehicle (_x);
		(_x) action ["EJECT", vehicle _x];
		sleep 0.6;
	} foreach units _grp;
};