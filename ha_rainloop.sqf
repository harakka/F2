// Script to re-set the rain constantly, to actually make it look like it's raining.
waitUntil {scriptDone f_processParamsArray};
if (f_param_weather != 4) exitWith {};
while {true} do {
	3 setRain 0.6;
	sleep 3;
}
	