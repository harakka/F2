if (isnil "ha_curMarker") then {ha_curMarker = 437;};
player sideChat format["Teleporting to ha_cp_%1", ha_curMarker];
player setPos (getMarkerPos format["ha_cp_%1", ha_curMarker]);
ha_curMarker = ha_curMarker + 1;