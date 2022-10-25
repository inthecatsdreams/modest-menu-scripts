require("scripts/global")



local function PlyVeh(veh)
	for i=0,31 do ply=player.get_player_ped(i)if ply then if ply:get_current_vehicle()==veh then return true end end end return false
end

local function TeleportPedsToPlayer(ply,dead)
	if ply==nil then return end pos2=ply:get_position()sleep(0.1)pos1=ply:get_position() disX=(pos1.x-pos2.x)disY=(pos1.y-pos2.y)disZ=(pos1.z-pos2.z)
	for ped in replayinterface.get_peds() do if ped and ped:get_pedtype()>3 then if not ped:is_in_vehicle() then
		ped:set_position(ply:get_position()+vector3(2*disX,2*disY,disZ))end end end
end

local function ExplodePlayer(ply)
	if ply==nil then return end pos2=ply:get_position()sleep(0.1)pos1=ply:get_position() disX=(pos1.x-pos2.x)disY=(pos1.y-pos2.y)disZ=(pos1.z-pos2.z)
	if localplayer:is_in_vehicle() then currentvehicle=localplayer:get_current_vehicle() end
	for veh in replayinterface.get_vehicles() do if not currentvehicle or currentvehicle~=veh then
		if not PlyVeh(veh) then acc=veh:get_acceleration() veh:set_acceleration(0) veh:set_rotation(vector3(0,0,180))
		veh:set_health(-1) veh:set_position(ply:get_position()+vector3(disX,disY,disZ)) veh:set_acceleration(acc) end end end
end
 
local function LaunchPlayer(ply)
	if ply==nil then return end pos2=ply:get_position() sleep(0.1) pos1=ply:get_position()
	disX=(pos1.x-pos2.x) disY=(pos1.y-pos2.y) disZ=(pos1.z-pos2.z) local currentvehicle = nil 
	if localplayer:is_in_vehicle() then currentvehicle = localplayer:get_current_vehicle() end
	for veh in replayinterface.get_vehicles() do if not currentvehicle or currentvehicle~=veh then
		if not PlyVeh(veh) then acc=veh:get_acceleration() veh:set_acceleration(0) veh:set_rotation(vector3(0,0,0))
		veh:set_gravity(-100) veh:set_position(ply:get_position()+vector3(2.5*disX, 2.5*disY, disZ-5)) veh:set_acceleration(acc) end end end
	sleep(1) for veh in replayinterface.get_vehicles() do if not currentvehicle or currentvehicle ~= veh then veh:set_gravity(9.8) end end
end
 
local function SlamPlayer(ply)
	if ply==nil then return end pos2=ply:get_position() sleep(0.1) pos1=ply:get_position()
	local currentvehicle=nil disX=(pos1.x-pos2.x) disY=(pos1.y-pos2.y) disZ=(pos1.z-pos2.z)
	if localplayer:is_in_vehicle() then currentvehicle=localplayer:get_current_vehicle() end
	for veh in replayinterface.get_vehicles() do if not currentvehicle or currentvehicle ~= veh then
		if not PlyVeh(veh) then acc=veh:get_acceleration() veh:set_acceleration(0) veh:set_rotation(vector3(0,0,0))
			veh:set_gravity(10000) veh:set_position(ply:get_position()+vector3(5*disX, 5*disY, disZ + 100)) veh:set_acceleration(acc) end end end
	sleep(1) for veh in replayinterface.get_vehicles() do if not currentvehicle or currentvehicle ~= veh then
		if not ply:get_current_vehicle() or ply:get_current_vehicle() ~= veh then veh:set_gravity(9.8) end end end
end


local function lpBmb()
	SlPl=player.get_player_ped(globals.get_int(CrVO+27+6)) globals.set_int(CrVO+27+6, 0)
	while SlPl~=nil and globals.get_int(CrVO+27+76)~=2 do
		CrVh(joaat("kosatka"),vector3(505,780,205))
		TeleportPedsToPlayer(SlPl)sleep(0.5) 	ExplodePlayer(SlPl)sleep(1.5)		if globals.get_int(CrVO+27+76)==2 then return end
		LaunchPlayer(SlPl)sleep(3) CrVh(joaat("alkonost"),vector3(505,780,205)) if globals.get_int(CrVO+27+76)==2 then return end
		ExplodePlayer(SlPl)sleep(0.5)			SlamPlayer(SlPl)sleep(1.5)			if globals.get_int(CrVO+27+76)==2 then return end
		ExplodePlayer(SlPl)sleep(0.5)			ExplodePlayer(SlPl)sleep(0.5)		ExplodePlayer(SlPl)sleep(1.5) end
end
menu.register_hotkey(155, lpBmb)



