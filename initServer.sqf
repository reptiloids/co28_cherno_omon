/*
 *	You can change MissionDate to some specific date to override date set in mission editor:
 *		format:		[@Year, @Month, @Day, @Hours, @Minutes] (e.g. [2012, 12, 31, 12, 45])
 */
 
MissionDate = [
	date select 0
	, date select 1
	, date select 2
	, if ("par_daytime" call BIS_fnc_getParamValue == 0) then {10+round(random 4)} else {21+round(random 8)}
	, selectRandom [0,10,15,20,25,30,40,45,50]
];
publicVariable "MissionDate";

/*
 * Date
 */
setDate MissionDate;

/*
 *	Weather
 */
if (!isNil "dzn_fnc_setWeather") then {
	  ("par_weather" call BIS_fnc_getParamValue) spawn dzn_fnc_setWeather;
};


	0 = [] spawn {
	
		//add delay
			waitUntil {time > 2};
			
		// get tgt_box2
			tgt_box2 setpos [(getpos tgt_box1 select 0),(getpos tgt_box1 select 1),(0.5)];
			
	};
	
/*
 *	Reinforce
 */

0 = [] spawn {
waitUntil {(tgt_box1 inArea rtb) && (tgt_box2 inArea rtb)};

[ atk1, [w1, w2, w3, w4] ] call dzn_fnc_dynai_setZoneKeypoints;
[ atk2, [w1, w2, w3, w4] ] call dzn_fnc_dynai_setZoneKeypoints;

atk1 call dzn_fnc_dynai_activateZone;
atk2 call dzn_fnc_dynai_activateZone;
};