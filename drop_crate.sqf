/*
Airdrop crates and vehicles with parachutes
version: 1.2

Authors:

- Leh2012
- Gerasimow9
*/

if (!isServer) exitWith {};

_nm = TypeOf (_this select 1);
_bam = null;
if (_this select 0) then { 

_c130 = _this select 1; 
_chute = (_this select 2) createVehicle [0, 0, 0]; 
_chute setPos [(getpos _c130 select 0), (getPos _c130 select 1)-10, (getPos _c130 select 2)-10];
_box = (_this select 3) createVehicle [0, 0, 0];

_box setpos [(getpos _c130 select 0), (getpos _c130 select 1)-10, (getpos _c130 select 2)-10];
_box attachto [_chute, [0, 0, 0]];

waitUntil {((getPos _box) select 2) < 20};
switch (true) do 
{
  case not (alive _box): {detach _box;_box setpos [(getpos _box select 0), (getpos _box select 1), 0];};
  case alive _box: {detach _box;_box setpos [(getpos _box select 0), (getpos _box select 1), 0];_bam =(_this select 3) createVehicle [(getpos _box select 0),(getpos _box select 1),(getpos _box select 2)+0];deletevehicle _box;
  //"SmokeShellgreen" createVehicle getPos _bam;_flare = "F_40mm_White" createVehicle [getPos _bam select 0,getPos _bam select 1,+150];};
  _boxMarker = createMarker[format["%1", _bam],getPos _bam];
  _boxMarker setMarkerShape "ICON";
  _boxMarker setMarkerType "DOT";
  _boxMarker setMarkerText "Equipment Drop";};
};
 
hint format ["%1", _bam];
clearWeaponCargoGlobal _bam;
clearMagazineCargoGlobal _bam;
_bam addMagazineCargoGlobal ["pipebomb", 6];
_bam addMagazineCargoGlobal ["Mine", 10];
_bam addMagazineCargoGlobal ["PG7VL", 8];
_bam addMagazineCargoGlobal ["20Rnd_762x51_B_SCAR", 10];
_bam addMagazineCargoGlobal ["30Rnd_545x39_AKSD", 25];
_bam addMagazineCargoGlobal ["20Rnd_9x39_SP5_VSS", 10];
_bam addMagazineCargoGlobal ["8Rnd_9x18_MakarovSD", 15];