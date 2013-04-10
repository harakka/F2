// Force helicopter to land under fire
// http://www.folkarps.com/forum/viewtopic.php?f=35&t=803
// Author: head

// _helo init
// { _x disableai "AUTOTARGET"; _x setCombatMode "BLUE"; _x setBehaviour "CARELESS"; _x allowFleeing 0; } foreach crew this;

// trying just for the pilot:
// this disableai "AUTOTARGET"; this setCombatMode "BLUE"; this setBehaviour "CARELESS"; this allowFleeing 0;

// 100 radius wp move with nul = execVM "scriptname.sqf"

_helo = _this select 0;
_nextWP = (currentWaypoint group _helo) + 1;

while { ((alive _helo) && !(unitReady _helo )) } do
{
	sleep 1;
};
hint "LANDING";
if (alive _helo) then {
	_helo land "LAND";
};

waituntil {isTouchingGround _helo};
hint "GOGOGO";
{
	doGetOut _x;
	unassignVehicle _x;
} foreach assignedCargo _helo;
waituntil { count (assignedCargo _helo) == 0 };
_helo land "NONE";
group _helo setCurrentWaypoint _nextWP;
