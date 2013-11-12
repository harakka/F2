if (isDedicated) exitWith{};

// Move the unit into indicated position and initiate HALO
// NOTE: it seems the HALO_init.sqs will only work properly if the unit is local,
// this means _unit needs to be either player himself or AI under his command
sleep 0.01;
_unit = _this select 0;
_ins = _this select 1;

_unit setPos [((_ins select 0)+ random 140)-70, ((_ins select 1) + random 140)-70, 0];
sleep 0.1;
_unit flyinheight 3000;
[_unit, 3000] exec "ca\air2\halo\data\Scripts\HALO_init.sqs";