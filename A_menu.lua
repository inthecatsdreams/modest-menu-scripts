require("scripts/global")


local function wEp()if localplayer:get_current_weapon()then return true end return false end

local Flgs,FLx={},{18,32,33,35,52,58,60,62,71,72,73,76,78,100,104,122,125,140,166,170,184,187,223,224,241,253,276,281,292,301,314,331,410,423,429,421}
Flgs[18]="Can Punch>"						Flgs[32]="Can Fly Thru Windscreen>"			Flgs[33]="Dies By Ragdoll>"					Flgs[35]="Helmet>"
Flgs[52]="No Collision>"					Flgs[58]="Is Shooting>"						Flgs[60]="Is On Ground>"					Flgs[62]="No Collide>"
Flgs[71]="Dead>"							Flgs[72]="Is Sniper Scope Active>"			Flgs[73]="Super Dead>"						Flgs[76]="Is In Air>"
Flgs[78]="Is Aiming>"						Flgs[100]="Drunk>"							Flgs[104]="No Ragdoll,Not Playing Anim>"	Flgs[122]="No Player Melee>"
Flgs[125]="NmMessage466>"					Flgs[140]="Can Attack Friendlies>"			Flgs[166]="Injured Limp>"					Flgs[170]="Injured Limp2>"
Flgs[184]="Disable Shuffling2Driver Seat>"	Flgs[187]="Injured Down>"					Flgs[223]="Shrink>"							Flgs[224]="Melee Combat>"
Flgs[241]="Disable Stopping VehEngine>"		Flgs[253]="Is On Stairs>"					Flgs[276]="Has One Leg On Ground>"			Flgs[281]="No Writhe>"
Flgs[292]="Freeze>"							Flgs[301]="Is Still>"						Flgs[314]="No Ped Melee>"					Flgs[331]="Ped Switching Weapon>"
Flgs[410]="Alpha>"							Flgs[423]="Disable Prop KnockOff>"			Flgs[429]="Disable Starting VehEngine>"		Flgs[421]="Flaming Footprints>"

Fast={"_CHAR_ABILITY_1_UNLCK","_CHAR_ABILITY_2_UNLCK","_CHAR_ABILITY_3_UNLCK","_CHAR_FM_ABILITY_1_UNLCK","_CHAR_FM_ABILITY_2_UNLCK","_CHAR_FM_ABILITY_3_UNLCK"}


local function Veh() if localplayer:is_in_vehicle() then return localplayer:get_current_vehicle() else return nil end end

local function PLA()if localplayer:is_in_vehicle() then return Veh():get_number_plate_text()else return "" end end

local original_max_health = 0.0
local function GetUndeadOffradar()
	if not localplayer then return nil end max_health = localplayer:get_max_health() return max_health < 100.0
end
local function SetUndeadOffradar(value)
	if value == nil or localplayer == nil then return end if value then max_health = localplayer:get_max_health()
		if max_health >= 100.0 then original_max_health = max_health end localplayer:set_max_health(0.0) else
		if original_max_health >= 100 then localplayer:set_max_health(original_max_health) else localplayer:set_max_health(328.0) end end
end
local function ToggleUndeadOffradar()
	value = GetUndeadOffradar() if value ~= nil then SetUndeadOffradar(not value) end
end
menu.register_hotkey(UOR, ToggleUndeadOffradar)

local bT,WR,LR=0,0,0
local function OnWeaponChanged(oldWeapon, newWeapon)
	if newWeapon~=nil then NAME=localplayer:get_current_weapon():get_name_hash()
		if NAME==joaat("weapon_hominglauncher") then newWeapon:set_range(1500) elseif NAME==joaat("weapon_raypistol") then
			newWeapon:set_heli_force(1075) newWeapon:set_ped_force(63) newWeapon:set_vehicle_force(1075) end
		if bT==0 then if NAME==joaat("weapon_stungun_mp") or NAME==joaat("weapon_stungun") then newWeapon:set_time_between_shots(1)
			elseif NAME==joaat("weapon_raypistol") then newWeapon:set_time_between_shots(0.5) end
			else newWeapon:set_time_between_shots(bT) end
		if WR~=0 then newWeapon:set_range(WR) else if NAME==joaat("weapon_raypistol") then newWeapon:set_range(1200)
			elseif NAME==joaat("weapon_stungun_mp") or NAME==joaat("weapon_stungun") then newWeapon:set_range(1000) end end
		if LR==0 then if NAME==joaat("weapon_hominglauncher") then newWeapon:set_lock_on_range(1500) end
			else newWeapon:set_lock_on_range(LR) end end
end
------
if WCD then menu.remove_callback(WCD) end local WCD=nil
if enable then local WCD = menu.register_callback('OnWeaponChanged', OnWeaponChanged) end

local function mxwep()
	localplayer:get_current_weapon():set_heli_force(60000) localplayer:get_current_weapon():set_ped_force(60000)
	localplayer:get_current_weapon():set_vehicle_force(60000) localplayer:get_current_weapon():set_time_between_shots(0.1)
	localplayer:get_current_weapon():set_range(2000) localplayer:get_current_weapon():set_lock_on_range(2000)
	localplayer:get_current_weapon():set_spread(0.2)
end
if WepTw~=nil then menu.register_hotkey(WepTw, mxwep) end

local TPF, TPU, TPD, enable3=nil, nil, nil, false
local function TPup()
	if not enable3 then return end newpos=localplayer:get_position()+vector3(0,0,2.5)
	if not localplayer:is_in_vehicle() then localplayer:set_position(newpos) else Veh():set_position(newpos) end
end
local function TPdn()
	if not enable3 then return end newpos=localplayer:get_position()+vector3(0,0,-2.5)
	if not localplayer:is_in_vehicle() then localplayer:set_position(newpos) else Veh():set_position(newpos) end
end
local function TPfr() if not enable3 then return end menu.teleport_forward() end
local function TPHk(e)
	if e then TPD=menu.register_hotkey(QTPd, TPdn) TPF=menu.register_hotkey(QTPf, TPfr) TPU=menu.register_hotkey(QTPu, TPup)
	else menu.remove_hotkey(TPD) menu.remove_hotkey(TPF) menu.remove_hotkey(TPU) end
end
------
local function TelePort() enable3=not enable3 TPHk(enable3) end
if TPH then menu.remove_hotkey(TPH) end local TPH=nil
if enable2 then TPH=menu.register_hotkey(QTP, TelePort) end
local function TPHkS(e)
	if e then TPH=menu.register_hotkey(QTP, TelePort) else if not TPD then
		menu.remove_hotkey(TPH) else menu.remove_hotkey(TPD) menu.remove_hotkey(TPF)
		menu.remove_hotkey(TPU) menu.remove_hotkey(TPH) end end
end

local OlA,OlG,OlVeh=nil,nil,nil
local function VehicleTweaks()
	if localplayer:is_in_vehicle() then OlVeh=Veh()
		if Veh():get_acceleration()==0.59 then if OlA then Veh():set_acceleration(OlA) end
			if OlG then Veh():set_gravity(OlG) end if not OlVeh:get_can_be_visibly_damaged() then OlVeh:set_can_be_visibly_damaged(true) end
			if OlVeh:get_window_collisions_disabled() then OlVeh:set_window_collisions_disabled(false) end
			if OlVeh:get_godmode() then OlVeh:set_godmode(false) end OlA,OlG,OlVeh=nil,nil,nil
		elseif Veh():get_acceleration() < 0.59 and Veh():get_acceleration() > 0.1 then
			OlA=Veh():get_acceleration() OlG=Veh():get_gravity() OlV=Veh():get_can_be_visibly_damaged()
			Veh():set_acceleration(0.59) Veh():set_gravity(14.8) Veh():set_max_speed(220) end
		if Veh():get_acceleration()==40 then Veh():set_acceleration(OlA)
			if not OlVeh:get_can_be_visibly_damaged() then OlVeh:set_can_be_visibly_damaged(true) end
			if OlVeh:get_window_collisions_disabled() then OlVeh:set_window_collisions_disabled(false) end
			if OlVeh:get_godmode() then  OlVeh:set_godmode(false) end OlA,OlG,OlVeh=nil,nil,nil
		elseif  Veh():get_acceleration() < 40 and Veh():get_acceleration() > 5 then
			OlA=Veh():get_acceleration() Veh():set_acceleration(40) Veh():set_max_speed(220) end
	else if not OlVeh then return end if OlA then OlVeh:set_acceleration(OlA) end if OlG then OlVeh:set_gravity(OlG) end
		if not OlVeh:get_can_be_visibly_damaged() then OlVeh:set_can_be_visibly_damaged(true) end
		if OlVeh:get_window_collisions_disabled() then OlVeh:set_window_collisions_disabled(false) end
		if OlVeh:get_godmode() then  OlVeh:set_godmode(false) end OlA,OlG,OlVeh=nil,nil,nil end
end
if enable4 then menu.register_hotkey(VehTw, VehicleTweaks) end

local function RfB()
	if localplayer:is_in_vehicle() then a=0 while a==0 do
		if Veh():get_boost()==0 then menu.refill_boost() Veh():set_boost_enabled(true)
		else Start=Veh():get_boost() sleep(0.05) End=Veh():get_boost()
			if (End-Start)>=0 then menu.refill_boost() Veh():set_boost_enabled(true)end end
		a=1 end end
end
if RefB then menu.register_hotkey(RefB, RfB) end if RefB2 then menu.register_hotkey(RefB2, RfB) end

local function GD(GOD)
	if GOD then if not localplayer:get_godmode() then localplayer:set_godmode(true) end
		if not localplayer:get_no_ragdoll() then localplayer:set_no_ragdoll(true) end
		if not localplayer:get_seatbelt() then localplayer:set_seatbelt(true) end
	else if localplayer:get_godmode() then localplayer:set_godmode(false) end
		if localplayer:get_no_ragdoll() then localplayer:set_no_ragdoll(false) end
		if localplayer:get_seatbelt() then localplayer:set_seatbelt(false) end end
end
if GHk then menu.register_hotkey(GHk, function() GOD=not GOD GD(GOD) end) end

local function NoScratch()
	if localplayer:is_in_vehicle() then OlVeh=Veh()
		Veh():set_can_be_visibly_damaged(false) Veh():set_window_collisions_disabled(true) end
end
if VDmg then menu.register_hotkey(VDmg, NoScratch) end



local WepCD=menu.add_submenu("Weapon CD and extras")
WepCD:add_toggle("Undead offradar", GetUndeadOffradar, SetUndeadOffradar)

WepCD:add_toggle("CanYouStartEngine?",function()return not flag(429)end, function()sflag(429,not flag(429))end)

WepCD:add_bare_item("", function() if localplayer:is_in_vehicle()then return"                  Plate>"..PLA()else return""end end, null, null, null)
local PLindx=1
WepCD:add_array_item("Number Plate>", Plates, function()return PLindx end,function(t)PLindx=t if Veh()then Veh():set_number_plate_text(Plates[t])end
end)

local SM=WepCD:add_submenu("Num2↓,Shft↓,Nm2↑,Shft↑. end=Num2")
local High=0
SM:add_bare_item("", function()
	if localplayer and localplayer:is_in_vehicle()then vel=localplayer:get_current_vehicle():get_velocity()else vel=vector3(0,0,0) High=0 end
	S=math.sqrt(vel.x^2+vel.y^2+vel.z^2)*2 if metric then speed=string.format("%.1f",S*1.609344)else speed=string.format("%.1f",speed)end
	if tonumber(speed)>High then High=tonumber(speed) end
	return "Speed: "..(metric and speed.." Kmph".."|Max>"..High.." Kmph" or string.format("%.1f",speed).." Mph".."|Max>"..High.."Mph")
end,null,null,null)

WepCD:add_toggle("QuickFire-Atmzer,StnGun/Auto{}", function() return enable end, function()
	enable=not enable if enable then WCD=menu.register_callback('OnWeaponChanged', OnWeaponChanged)else menu.remove_callback(WCD) bT,WR,LR=0,0,0 end
end)

WepCD:add_float_range("{}Time Between Shots for all", 0.1, 0, 4, function()if wEp()then return localplayer:get_current_weapon():get_time_between_shots()end end, function(BtSh)
	bT=BtSh localplayer:get_current_weapon():set_time_between_shots(BtSh)
end)
WepCD:add_float_range("{}Weapon Range for all", 10, 0, 1500, function()if wEp()then return localplayer:get_current_weapon():get_range()end end, function(range)
	WR=range localplayer:get_current_weapon():set_range(range)
end)
WepCD:add_float_range("{}Lock-On Range", 10, 0, 1500, function()if wEp()then return localplayer:get_current_weapon():get_lock_on_range()end end, function(Lock)
	LR=Lock localplayer:get_current_weapon():set_lock_on_range(Lock)
end)
WepCD:add_action("Max All weaponstats", function() mxwep() end)


WepCD:add_action("                 _________Extras_________", function() end)
WepCD:add_toggle("QuickTP(NumDel)", function() return enable2 end, function() --Menu Toggle- Add/Remove Hotkey
	enable2=not enable2 TPHkS(enable2)
end)

WepCD:add_action("Make Nightclub Popular", function() stats.set_int("MP"..mpx().."_club_popularity", 1000) end)
WepCD:add_int_range("Kosatka Missile CD", 60000,0,60000, function()if localplayer then return globals.get_int(KMCD)end end, function(v) globals.set_int(KMCD, v) end)
WepCD:add_int_range("Kosatka Missile Range", 1000,0,20000, function()if localplayer then return globals.get_int(KMR)end end, function(v) globals.set_int(KMR, v) end)

WepCD:add_int_range("No. of Chllngs to Get Carmeet Prize", 1, 1, 100, function()if localplayer then
if stats.get_bool("MP"..mpx().."_CARMEET_PV_CHLLGE_CMPLT") then return 1 end return 0 end end, function(ChCn)
	stats.set_bool("MP"..mpx().."_CARMEET_PV_CHLLGE_CMPLT", true) stats.set_int("MP"..mpx().."_CARMEET_PV_CHLLGE_PRGSS", ChCn)
end)

local ReportsStats_submenu=WepCD:add_submenu("Reports Stats")
ReportsStats_submenu:add_action("                        _Read Only_",null)
ReportsStats_submenu:add_int_range("Griefing",0,0,0,function()if localplayer then return stats.get_int("MPPLY_GRIEFING")end end, function() end)
ReportsStats_submenu:add_int_range("Exploits",0,0,0,function()if localplayer then return stats.get_int("MPPLY_EXPLOITS")end end, function() end)
ReportsStats_submenu:add_int_range("Bug Exploits",0,0,0,function()if localplayer then return stats.get_int("MPPLY_GAME_EXPLOITS")end end, function() end)
ReportsStats_submenu:add_int_range("Text Chat:Annoying Me",0,0,0,function()if localplayer then return stats.get_int("MPPLY_TC_ANNOYINGME")end end, function() end)
ReportsStats_submenu:add_int_range("Text Chat:Using Hate Speech",0,0,0,function()if localplayer then return stats.get_int("MPPLY_TC_HATE")end end, function() end)
ReportsStats_submenu:add_int_range("Voice Chat:Annoying Me",0,0,0,function()if localplayer then return stats.get_int("MPPLY_VC_ANNOYINGME")end end, function() end)
ReportsStats_submenu:add_int_range("Voice Chat:Using Hate Speech",0,0,0,function()if localplayer then return stats.get_int("MPPLY_VC_HATE")end end, function() end)
ReportsStats_submenu:add_int_range("Offensive Language",0,0,0,function()if localplayer then return stats.get_int("MPPLY_OFFENSIVE_LANGUAGE")end end, function() end)	ReportsStats_submenu:add_int_range("Offensive Tagplate",0,0,0,function()if localplayer then return stats.get_int("MPPLY_OFFENSIVE_TAGPLATE")end end, function() end)
ReportsStats_submenu:add_int_range("Offensive Content",0,0,0,function()if localplayer then return stats.get_int("MPPLY_OFFENSIVE_UGC")end end, function() end)
ReportsStats_submenu:add_int_range("Bad Crew Name",0,0,0,function()if localplayer then return stats.get_int("MPPLY_BAD_CREW_NAME")end end, function() end)
ReportsStats_submenu:add_int_range("Bad Crew Motto",0,0,0,function()if localplayer then return stats.get_int("MPPLY_BAD_CREW_MOTTO")end end, function() end)
ReportsStats_submenu:add_int_range("Bad Crew Status",0,0,0,function()if localplayer then return stats.get_int("MPPLY_BAD_CREW_STATUS")end end, function() end)
ReportsStats_submenu:add_int_range("Bad Crew Emblem",0,0,0,function()if localplayer then return stats.get_int("MPPLY_BAD_CREW_EMBLEM")end end, function() end)
ReportsStats_submenu:add_int_range("Friendly",0,0,0,function()if localplayer then return stats.get_int("MPPLY_FRIENDLY")end end, function() end)
ReportsStats_submenu:add_int_range("Helpful",0,0,0,function()if localplayer then return stats.get_int("MPPLY_HELPFUL")end end, function() end)


local FLAGS=WepCD:add_submenu("Config Flags>")
for i=1,#FLx do if Flgs[FLx[i]]then FLAGS:add_toggle(Flgs[FLx[i]],function()if localplayer then return flag(FLx[i])end end,function()sflag(FLx[i],not flag(FLx[i]))end)end end

WepCD:add_toggle("Fast Run",function()for i=1,#Fast do if stats.get_int("MP"..mpx()..Fast[i])~=-1 then return false end end return true end,function()
	for i=1,#Fast do if stats.get_int("MP"..mpx()..Fast[i])~=-1 then stats.set_int("MP"..mpx()..Fast[i],-1)else stats.set_int("MP"..mpx()..Fast[i],0)end end
end)







local FC=menu.add_submenu("F. Clinton | CDs")
FC:add_action("Goto Dr. Dre Final Mission", function()
	stats.set_int("MP"..mpx().."_FIXER_STORY_BS", -1) stats.set_int("MP"..mpx().."_FIXER_STORY_STRAND", -1)
	stats.set_int("MP"..mpx().."_FIXER_STORY_COOLDOWN", -1)
end)

FC:add_int_range("Security mission cooldown",300000,0,300000, function()if localplayer then return globals.get_int(SMCD)end end, function(v)
	globals.set_int(SMCD, v)
end)
FC:add_int_range("Payphone hit cooldown",1200000,0,1200000, function()if localplayer then return globals.get_int(PHCD)end end, function(v)
	if value then globals.set_int(PHCD, v)end
end)
FC:add_int_range("AutoShop Vehicle CD",2880,0,2880, function()if localplayer then return globals.get_int(ASvCD)end end, function(v)
	globals.set_int(ASvCD, v)
end)
FC:add_int_range("Casino Works CD", 180000, 0, 180000, function()if localplayer then return globals.get_int(CsWCD)end end, function(v)
	globals.set_int(CsWCD, v)
end)
FC:add_int_range("CEO-Works CD", 300000, 0, 300000, function()if localplayer then return globals.get_int(CEOWCD)end end, function(v)
	globals.set_int(CEOWCD, v)
end)
FC:add_int_range("CEO-Headhunter CD", 600000, 0, 600000, function()if localplayer then return globals.get_int(CEOHCD)end end, function(v)
	globals.set_int(CEOHCD, v)
end)
FC:add_int_range("CEO-Asset Recovery CD", 600000, 0, 600000, function()if localplayer then return globals.get_int(CEOARCD)end end, function(v)
	globals.set_int(CEOARCD, v)
end)
FC:add_int_range("CEO-Airfreight CD", 600000, 0, 600000, function()if localplayer then return globals.get_int(CEOACD)end end, function(v)
	globals.set_int(CEOACD, v)
end)

local function refillInventory()
	stats.set_int("MP"..mpx().."_NO_BOUGHT_YUM_SNACKS", 30) stats.set_int("MP"..mpx().."_NO_BOUGHT_HEALTH_SNACKS", 15)
	stats.set_int("MP"..mpx().."_NO_BOUGHT_EPIC_SNACKS", 5) stats.set_int("MP"..mpx().."_NUMBER_OF_ORANGE_BOUGHT", 10)
	stats.set_int("MP"..mpx().."_NUMBER_OF_BOURGE_BOUGHT", 10) stats.set_int("MP"..mpx().."_NUMBER_OF_CHAMP_BOUGHT", 5)
	stats.set_int("MP"..mpx().."_CIGARETTES_BOUGHT", 20) stats.set_int("MP"..mpx().."_MP_CHAR_ARMOUR_5_COUNT", 10)
	stats.set_int("MP"..mpx().."_BREATHING_APPAR_BOUGHT", 20) if stats.get_int("MP"..mpx().."_SR_INCREASE_THROW_CAP") then 
	if localplayer:get_weapon_by_hash(joaat("slot_stickybomb")) then localplayer:get_weapon_by_hash(joaat("slot_stickybomb")):set_current_ammo(30) end
	if localplayer:get_weapon_by_hash(joaat("slot_smokegrenade")) then localplayer:get_weapon_by_hash(joaat("slot_smokegrenade")):set_current_ammo(30) end
	if localplayer:get_weapon_by_hash(joaat("slot_grenade")) then localplayer:get_weapon_by_hash(joaat("slot_grenade")):set_current_ammo(30) end
	if localplayer:get_weapon_by_hash(joaat("slot_molotov")) then localplayer:get_weapon_by_hash(joaat("slot_molotov")):set_current_ammo(30) end
	if localplayer:get_weapon_by_hash(joaat("slot_proxmine")) then localplayer:get_weapon_by_hash(joaat("slot_proxmine")):set_current_ammo(10) end
	if localplayer:get_weapon_by_hash(joaat("slot_pipebomb")) then localplayer:get_weapon_by_hash(joaat("slot_pipebomb")):set_current_ammo(15) end end
end
menu.register_hotkey(RefIn, refillInventory)

local function HEAL()
	if localplayer:get_armour()<50 then localplayer:set_armour(50) else if localplayer:get_health()<localplayer:get_max_health()/2 then
	localplayer:set_health(localplayer:get_health()+snack*3) elseif localplayer:get_health()<localplayer:get_max_health() then
	if localplayer:get_health()+snack<localplayer:get_max_health() then localplayer:set_health(localplayer:get_health()+snack) else
	localplayer:set_health(localplayer:get_max_health()) end end end
end if heal then menu.register_hotkey(heal, HEAL) end

