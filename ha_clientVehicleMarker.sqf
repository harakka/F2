waitUntil {!isNil "ha_bluVehiclePos" && !isNil "ha_gueVehiclePos"};

switch (faction player) do {
    case "CDF": {
        _marker = createMarkerLocal ["mkr_sideVehicle", ha_bluVehiclePos];
    };
    case "GUE": {
        _marker = createMarkerLocal ["mkr_sideVehicle", ha_gueVehiclePos];
    };
    default {
        _marker = createMarkerLocal ["mkr_sideVehicle", [0,0]];
        player globalchat "ha_clientVehicleMarker: side vehicle marker creation failed because of unknown player faction";
    };
        
};

"mkr_sideVehicle" setMarkerShapeLocal "ICON";
"mkr_sideVehicle" setMarkerTypeLocal "Car";
"mkr_sideVehicle" setMarkerTextLocal "Transport vehicles";