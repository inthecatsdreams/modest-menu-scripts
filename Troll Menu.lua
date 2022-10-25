require("scripts/global")

local admins={ "Spacer-galore", "Fortune_Cukie", "Laurie_Williams", "RollD20", "SecretWizzle54", "Wawaweewa_I_Like", "BackBoyoDrill",
	"NoAuthorityHere", "ScentedString", "CapnZebraZorse", "godlyGoodestBoi", "whiskylifter", "pigeon_nominate", "SlightlyEvilHoss",
	"ChangryMonkey", "StompoGrande", "x_Shannandoo_x", "Long-boi-load", "NootN0ot", "applecloning", "BeoMonstarh", "BlobbyFett22",
	"ExoSnowBoarder", "ExtremeThanks15", "BailMail99", "ForrestTrump69", "KingOfGolf", "KrustyShackles", "PassiveSalon", "PearBiscuits34",
	"SlowMoKing", "Smooth_Landing", "SuperTrevor123", "Tamehippo", "Thrillhouse12", "LazingLion", "KorruptUserDayta", "LivelyCommanderS",
	"FishingFissures", "uwu-bend", "VickDMF", "AlpacaBarista", "The_Real_Harambe", "Flares4Lyfe", "BinnyAndTheJets", "VinnyPetrol",
	"LazerGameBounce", "FluteOfMilton", "PipPipJongles", "YUyu-lampon", "DeadOnAir", "Dumptruck42168", "Poppernopple", "KrunchyCh1cken",
	"BlessedChu", "Surgeio", "WindmillDuncan", "Wanted_Sign42", "Paulverines", "ZombieTom66", "st1nky_p1nky", "OilyLordAinsley",
	"FruitPuncher15", "PisswasserMax", "BanSparklinWater", "BrucieJuiceyIV", "RapidRaichu", "kingmario11", "DigitalFox9",
	"CheeesesteakPhil", "FoxesAreCool69", "SweetPlumbus", "NotSweetPlumbus", "IM-_-Wassup", "WickedFalcon4054", "aquabull",
	"Ghostofwar1", "DAWNBILLA", "Aur3lian", "JulianApost4te", "DarkStar7171", "xCuteBunny", "random_123", "SheddingYeti",
	"random123", "flyingcobra16", "CriticalRegret", "ScentedPotter", "Huginn5", "Sonknuck-", "HammerDaddy69", "johnet123",
	"bipolarcarp", "jakw0lf", "Kakorot02", "CrazyCatPilots", "G_ashman", "Rossthetic", "StrongBelwas1", "vulconn", "TonyMSD1",
	"AMoreno14", "PayneInUrAbs", "shibuz_gamer123", "M1thras", "Th3_Morr1gan", "Z3ro_Chill", "Titan261", "Coffee_Collie", "YellingRat",
	"BananaGod951", "RDR_Dev", "FecundWolf", "trajan5", "thewho146", "Bangers_RSG", "Bash_RSG", "Bubblez_RSG", "ramendingo", "ChefRSG",
	"Chunk_RSG", "HotTub_RSG", "JPEGMAFIA_RSG", "Klang_RSG", "Lean1_RSG", "Ton_RSG", "RSGWolfman", "TheUntamedVoid", "TylerTGTAB",
	"Wilted_spinach", "DannSw", "RSGINTJoe", "RSGGuestV", "RSGGuest50", "RSGGuest40", "Logic_rsg", "RSGGuest12", "RSGGuest7",
	"ScottM_RSG", "Rockin5", "MonkeyViking", "Anghard07", "playrockstar6", "PlayRockstar5", "PlayRockstar1", "Player8_RSG",
	"Player7_RSG", "MaxPayneDev16", "MaxPayneDev15", "MaxPayneDev14", "MaxPayneDev13", "MaxPayneDev12", "MaxPayneDev11",
	"MaxPayneDev10", "MaxPayneDev9", "MaxPayneDev8", "MaxPayneDev7", "MaxPayneDev6", "MaxPayneDev5", "MaxPayneDev4", "MaxPayneDev3",
	"MaxPayneDev2", "MaxPayneDev1", "MaxPayne3Dev12", "MaxPayne3Dev11", "MaxPayne3Dev9", "GTAdev4", "GTAdev3" }
	
-- On Admin Detection
local nme=0
local Door={"Unlocked","Locked","Locked for Player","Child Lock","Can be broken into","Can be broken into(persist)","Can't be tried to enter"}Door[0]="None"
local function ChangeSession()
	globals.set_int(SsTy, 0) globals.set_int(SsTr, 1) sleep(0.05) globals.set_int(SsTr, 0) nme=0
end if Hkey1 then menu.remove_hotkey(Hkey1) end if ChSs then Hkey1=menu.register_hotkey(ChSs, ChangeSession) end

local function EmptySession() menu.empty_session() nme=0 end
if Hkey2 then menu.remove_hotkey(Hkey1) end if EmSs then Hkey2=menu.register_hotkey(EmSs, EmptySession) end


local function ondetect()
	if Tsk==2 then ChangeSession() elseif Tsk==3 then EmptySession() else if nme~=adm then nme=adm
	menu.send_key_down(keyW) sleep(0.2) menu.send_key_down(keyA) sleep(0.2)
	menu.send_key_up(keyW) sleep(0.2) menu.send_key_down(keyS) sleep(0.2) menu.send_key_up(keyA) sleep(0.2)
	menu.send_key_down(keyD) sleep(0.2) menu.send_key_up(keyS) sleep(0.2) menu.send_key_down(keyW) sleep(0.2)
	menu.send_key_up(keyD) sleep(0.2) menu.send_key_down(keyA) sleep(0.2) menu.send_key_up(keyW) sleep(0.2)
	menu.send_key_up(keyA) end end
end

-- Function definitions
local function Text(text,submenu)
	if submenu then submenu:add_action(text,null) else menu.add_action(text, null) end
end

local function Distance(vec1, vec2)
	return math.sqrt(((vec2.x-vec1.x)^2)+((vec2.y-vec1.y)^2)+((vec2.z-vec1.z)^2))
end

-- Player Info
local function PlyVeh(veh)
	for i=0,31 do ply=player.get_player_ped(i)if ply then if ply:get_current_vehicle()==veh then
		return true end end end return false
end
local function IsModder(ply)
	if not ply or ply:get_pedtype()>3 then return false end	if ply:get_max_health()<100 then return true end if ply:get_max_health()<100 then return true end
	if ply:is_in_vehicle() then if ply:get_current_vehicle():get_gravity()>14 then return true end end
	if ply:is_in_vehicle() then if ply:get_current_vehicle():get_acceleration()<10 and ply:get_current_vehicle():get_acceleration()>0.6 then return true end end
	if ply:get_run_speed()>1.0 or ply:get_swim_speed()>1.0 then return true end
	if ply:get_infinite_clip() then return true end
	if ply:get_no_ragdoll() then return true end
	if ply:get_seatbelt() then return true end
	if ply:get_current_weapon() and ply:get_current_weapon():get_current_ammo()>0 and ply:get_infinite_ammo() then return true end --Infinite ammo
	return false
end
 
-- Action functions
local function TeleportToPlayer(ply, seconds)
	if not ply then return end P=ply:get_position() R=ply:get_heading() pos=vector3(P.x-R.x,P.y-R.y,P.z) oldpos=localplayer:get_position() a=0
	if seconds==1 then if localplayer:is_in_vehicle() then localplayer:get_current_vehicle():set_position(vector3(P.x-4*R.x,P.y-4*R.y,P.z))
	localplayer:get_current_vehicle():set_rotation(ply:get_rotation()) else localplayer:set_position(pos) localplayer:set_rotation(ply:get_rotation()) end
	else if not localplayer:is_in_vehicle() then localplayer:set_position(pos) else localplayer:get_current_vehicle():set_position(pos) end sleep(seconds)
		while not localplayer:get_config_flag(301) do if a==100 then return end sleep(0.1) a=a+1 end
		localplayer:set_freeze_momentum(true) localplayer:set_config_flag(292,true)
		if localplayer:is_in_vehicle() then localplayer:get_current_vehicle():set_position(oldpos) else localplayer:set_position(oldpos) end
		localplayer:set_freeze_momentum(false) localplayer:set_config_flag(292,false) end
end

local function TeleportClosestVehicleToPlayer(ply)
	if not ply then return end
	pos2=ply:get_position() sleep(0.1) pos1=ply:get_position() disX=(pos1.x-pos2.x) disY=(pos1.y-pos2.y) disZ=(pos1.z-pos2.z)
	veh=localplayer:get_nearest_vehicle() if not veh or localplayer:get_nearest_vehicle()==localplayer:get_current_vehicle() then return end
	veh:set_position(ply:get_position()+vector3(2*disX, 2*disY, disZ))
end
 
local function TeleportPedsToPlayer(ply, typ)
	if not ply then return end
	pos2=ply:get_position() sleep(0.1) pos1=ply:get_position() disX=(pos1.x-pos2.x) disY=(pos1.y-pos2.y) disZ=(pos1.z-pos2.z)
	if not typ or typ==1 then for ped in replayinterface.get_peds() do if ped and ped:get_pedtype()>3 then
		if not ped:is_in_vehicle() then ped:set_position(ply:get_position()+vector3(2*disX,2*disY,disZ)) end end end
	elseif typ==2 then for ped in replayinterface.get_peds() do if ped and ped:get_pedtype()==6 or ped:get_pedtype()==27 or
	ped:get_pedtype()==23 or ped:get_pedtype()==29 then
		if not ped:is_in_vehicle() then ped:set_position(ply:get_position()+vector3(2*disX, 2*disY, disZ)) end end end
	elseif typ==3 then for ped in replayinterface.get_peds() do if ped and ped:get_pedtype()==24 then
		if not ped:is_in_vehicle() then ped:set_position(ply:get_position()+vector3(2*disX, 2*disY, disZ)) end end end
	elseif typ==4 then for ped in replayinterface.get_peds() do if ped and ped:get_pedtype()>6 and ped:get_pedtype()<20 then
		if not ped:is_in_vehicle() then ped:set_position(ply:get_position()+vector3(2*disX, 2*disY, disZ)) end end end
	else for ped in replayinterface.get_peds() do if ped and ped:get_pedtype()==28 then
		if not ped:is_in_vehicle() then ped:set_position(ply:get_position()+vector3(2*disX, 2*disY, disZ)) end end end
	end
end
 
local function ExplodePlayer(ply)
	if not ply or ply == nil then return end CrVh(joaat("alkonost"),vector3(505,780,205))
	pos2=ply:get_position() sleep(0.1) pos1=ply:get_position()
	disX=(pos1.x-pos2.x) disY=(pos1.y-pos2.y) disZ=(pos1.z-pos2.z) currentvehicle=nil 
	if localplayer:is_in_vehicle() then currentvehicle=localplayer:get_current_vehicle() end
	for veh in replayinterface.get_vehicles() do if not currentvehicle or currentvehicle~=veh then
		if not PlyVeh(veh) then acc=veh:get_acceleration() veh:set_acceleration(0)
			veh:set_rotation(vector3(0,0,180)) veh:set_health(-1)
			veh:set_position(ply:get_position()+vector3(disX, disY, disZ))
			veh:set_acceleration(acc) end end end
end
 
local function LaunchPlayer(ply)
	if ply==nil then return end CrVh(joaat("alkonost"),vector3(505,780,205))
	pos2=ply:get_position()sleep(0.1)pos1=ply:get_position() disX=(pos1.x-pos2.x)disY=(pos1.y-pos2.y)disZ=(pos1.z-pos2.z)
	if localplayer:is_in_vehicle() then currentvehicle=localplayer:get_current_vehicle()end
	for veh in replayinterface.get_vehicles()do if not currentvehicle or currentvehicle~=veh then
		if not PlyVeh(veh) then acc=veh:get_acceleration() veh:set_acceleration(0) veh:set_rotation(vector3(0,0,0)) veh:set_gravity(-100)
			veh:set_position(ply:get_position()+vector3(2.5*disX,2.5*disY,disZ-5)) veh:set_acceleration(acc)end end end sleep(1)
	for veh in replayinterface.get_vehicles() do if not currentvehicle or currentvehicle~=veh then veh:set_gravity(9.8)end end
end
 
local function SlamPlayer(ply)
	if ply==nil then return end CrVh(joaat("alkonost"),vector3(505,780,205))
	pos2=ply:get_position()sleep(0.1)pos1=ply:get_position() disX=(pos1.x-pos2.x)disY=(pos1.y-pos2.y)disZ=(pos1.z-pos2.z)
	if localplayer:is_in_vehicle() then currentvehicle=localplayer:get_current_vehicle() end
	for veh in replayinterface.get_vehicles() do if not currentvehicle or currentvehicle~=veh then
		if not PlyVeh(veh)then acc=veh:get_acceleration() veh:set_acceleration(0)veh:set_rotation(vector3(0,0,0))veh:set_gravity(10000)
			veh:set_position(ply:get_position()+vector3(5*disX,5*disY,disZ+100))veh:set_acceleration(acc)end end end sleep(1)
	for veh in replayinterface.get_vehicles() do if not currentvehicle or currentvehicle~=veh then
		if not ply:get_current_vehicle() or ply:get_current_vehicle()~=veh then
			veh:set_gravity(9.8) end end end
end

local function DIR(ply)
	if ply then D=math.floor(math.sqrt((ply:get_position().z-localplayer:get_position().z)^2))
	if (ply:get_position().z)>(localplayer:get_position().z) then return D.."m↑" elseif (ply:get_position().z)<(localplayer:get_position().z) then return D.."m↓ " end end
	return ""
end

-- Player option 
local selectedplayer=-1
local function f_p_o(ply_id, ply, ply_name) -- Format Player Option Text
	local text = ""
	if ply == localplayer then text = text.."YOU" else text = text..ply_name end
	if IsModder(ply) then text = text.."  *" end if ply:get_godmode() then text = text.." | God" end
	if ply:is_in_vehicle() then
		if ply:get_current_vehicle():get_godmode() then text = text.." | VehGod"
		else text = text.." | InVehicle" end end

	-- Player's Distance From You
	text = text.." | "..math.floor(Distance(ply:get_position(), localplayer:get_position())).." m" return text
end
 
local function add_player_option(submenu, ply_id, ply, ply_name)
	local text, d = f_p_o(ply_id, ply, ply_name), ply_id
	if (submenu~=nil) then submenu:add_bare_item(text, function() return f_p_o(ply_id, ply, ply_name).."|"..(selectedplayer == ply_id and
		"✓" or "□")  end, function() selectedplayer = d end, null, null)
	else menu.add_bare_item(text, function() return f_p_o(ply_id, ply, ply_name).."|"..(selectedplayer == ply_id and
		"✓" or "□") end, function() selectedplayer = d end, null, null) end
end
 
local function add_info_option(submenu, text, funcget, forceplayer)
	local func = function() 
		local ply=player.get_player_ped(forceplayer and forceplayer or selectedplayer)
		if not ply then return text..": **Invalid**" end return text..": "..funcget(ply) end
	if (submenu ~= nil) then submenu:add_bare_item(text..": ", func, null, null, null)
	else menu.add_bare_item(text..": ", func, null, null, null) end
end

-- TrollLoop
local function switch()
	if selectedplayer==nil then return end
	if globals.get_int(CrVO+27+76)==2 then globals.set_int(CrVO+27+6,selectedplayer)globals.set_int(CrVO+27+76,0)
		sleep(0.2)menu.send_key_press(155)else globals.set_int(CrVO+27+76,2)end
end
if Exploop then menu.remove_hotkey(Exploop)end local Exploop=nil if TRLHK then Exploop=menu.register_hotkey(TL,switch)end
local function LooP(e)
	if e then Exploop=menu.register_hotkey(TL,switch)else menu.remove_hotkey(Exploop)globals.set_int(CrVO+27+76,0)end
end
menu.add_toggle("TrollLoop(NUM9)",function()return TRLHK end,function()TRLHK=not TRLHK LooP(TRLHK)end)

local YN,TPOp,TrOp,adm,LTr,LTyp,LSec,Qd={},{},{},"",nil,1,1,nil
YN[1]="Yes" YN[0]="No"		TrOp[1]="Explotion" TrOp[2]="Anti-Gravity" TrOp[3]="Slamming"
local OAD,PTyp={"Do a roundabout","Change Session","Empty Session"},{"All Peds","Law enforcement","Prostitute","All Gangs","Animals"}

local function ply() return player.get_player_ped(selectedplayer) end

local function TurnTo(ply)
	if not player.get_player_ped(selectedplayer) then return end pos1=localplayer:get_position() pos2=ply:get_position()
	Qd=nil if pos2.x>pos1.x and pos2.y>pos1.y then Qd=1 elseif pos2.x<pos1.x and pos2.y>pos1.y then Qd=2 elseif
	pos2.x<pos1.x and pos2.y<pos1.y then Qd=3 elseif pos2.x>pos1.x and pos2.y<pos1.y then Qd=4 end if not Qd then return 404 end
	if Qd==1 or Qd==3 then sA=math.sqrt((pos2.y-pos1.y)^2) sB=math.sqrt((pos2.x-pos1.x)^2) sC=math.sqrt(sA^2+sB^2) --if 3 then Ang+180deg
	elseif Qd==2 or Qd==4 then sB=math.sqrt((pos2.y-pos1.y)^2) sA=math.sqrt((pos2.x-pos1.x)^2) sC=math.sqrt(sA^2+sB^2)  -- if 2 then Ang+270deg, if 4 +90
	end Ang=math.acos(sA/sC) if Qd>1 then Rad=-(Ang+(5-Qd)*1.57) else Rad=-Ang end if Rad<-3.14 then Rad=Rad+6.28 end
	if localplayer:is_in_vehicle() then localplayer:get_current_vehicle():set_rotation(Rad,0,0) else localplayer:set_rotation(Rad,0,0) end
end


local playerlist=nil
local function BuildList()
	playerlist:clear()playerlist:add_bare_item("---AppleVegas's Player List, "..player.get_number_of_players().." Players---", function()
			return "---AppleVegas's Player List, "..player.get_number_of_players().." Players---" end, null, null, null)
	for i = 0, 31 do local ply = player.get_player_ped(i)
		if ply then add_player_option(playerlist, i, ply, player.get_player_name(i)) admin=player.get_player_name(i)
			for x=1, #admins do if admin==admins[x] then adm="[ Admin>"..admin.." ]" ondetect() end end end
	end
	Text("    ---End---"..adm,playerlist)
	playerlist:add_array_item("On Admin Detection>", OAD, function() return Tsk end, function(d) Tsk=d ondetect() end)
 	add_info_option(playerlist, "Selected Player>", function() return tostring(DIR(player.get_player_ped(selectedplayer)).." "..player.get_player_name(selectedplayer)) end)
	
	-- Troll Options
	playerlist:add_array_item("Troll by>", TrOp, function() if LTr then return LTr else return 1 end end, function(Trll)
		LTr=Trll if Trll==1 then ExplodePlayer(player.get_player_ped(selectedplayer))
		elseif Trll==2 then LaunchPlayer(player.get_player_ped(selectedplayer))
		else SlamPlayer(player.get_player_ped(selectedplayer)) end
	end)
	playerlist:add_action("Send Closest Vehicle to player", function(LsTP) TeleportClosestVehicleToPlayer(player.get_player_ped(selectedplayer)) end)
	playerlist:add_array_item("Send>>", PTyp, function() return LTyp end, function(v) LTyp=v TeleportPedsToPlayer(player.get_player_ped(selectedplayer), v) end)
	
	--Teleport Options
	playerlist:add_array_item("Peek for",{"Teleport","2 seconds","3 seconds","4 seconds","5 seconds","6 seconds","7 seconds","8 seconds"},function() return LSec end, function(n)
		LSec=n TeleportToPlayer(player.get_player_ped(selectedplayer), n)
	end)

	--Experimental
	playerlist:add_action("Turn towards player. ", function() TurnTo(player.get_player_ped(selectedplayer)) end)

	local moreinfo=playerlist:add_submenu("More info on player")
	add_info_option(moreinfo, "Player> ", function() return tostring(player.get_player_name(selectedplayer).."     "..DIR(player.get_player_ped(selectedplayer))) end)

	moreinfo:add_float_range("MaxHealth",10,0,1000, function() if ply() then return ply():get_max_health() end end, function(v) ply():set_max_health(v) end)
	moreinfo:add_float_range("Health",10,0,1000, function() if ply() then return ply():get_health() end end, function(v) ply():set_health(v) end)
	moreinfo:add_float_range("Armour",10,0,1000, function() if ply() then return ply():get_armour() end end, function(v) ply():set_armour(v) end)
	moreinfo:add_float_range("Run Speed",1,0,10, function() if ply() then return ply():get_run_speed() end end, function(v) ply():set_run_speed(v) end)
	moreinfo:add_float_range("Swim Speed",1,0,10, function() if ply() then return ply():get_swim_speed() end end, function(v) ply():set_swim_speed(v) end)
	moreinfo:add_int_range("Wanted level",1,0,5, function() if ply() then return ply():get_wanted_level() end end, function(v) ply():set_wanted_level(v) end)
	moreinfo:add_array_item("Can be targeted>", YN, function() if ply() and ply():get_can_be_targeted() then return 1 else return 0 end end, function(v)
		if v==1 then a=true else a=false end ply():set_can_be_targeted(a) end)
	moreinfo:add_array_item("No ragdoll>", YN, function() if ply() and ply():get_no_ragdoll() then return 1 else return 0 end end, function(v)
		if v==1 then a=true else a=false end ply():set_no_ragdoll(a) end)
		
	moreinfo:add_action("            Vehicle Info(close range only)", function() end)
	moreinfo:add_float_range("Health", 100, 0, 3000, function() if ply() and ply():is_in_vehicle() then return ply():get_current_vehicle():get_health() end end, function(v)
		ply():get_current_vehicle():set_health(v) end)
	moreinfo:add_array_item("Doorlock state",Door,function()if ply()and ply():is_in_vehicle()then return ply():get_current_vehicle():get_door_lock_state()end end,function(v)
		ply():get_current_vehicle():set_door_lock_state(v) end)
	moreinfo:add_array_item("Seatbelt>", YN, function() if ply() and ply():get_seatbelt() then return 1 else return 0 end end, function(v)
		if v==1 then a=true else a=false end ply():set_seatbelt(a) end)
	moreinfo:add_float_range("Gravity", 1, 0, 30, function() if ply() and ply():is_in_vehicle() then return ply():get_current_vehicle():get_gravity() end end, function(v)
		ply():get_current_vehicle():set_gravity(v) end)
	moreinfo:add_float_range("Accelaration", 0.1, 0, 10, function() if ply() and ply():is_in_vehicle() then return ply():get_current_vehicle():get_acceleration() end end,function(v)
		ply():get_current_vehicle():set_acceleration(v) end)
	moreinfo:add_float_range("Max Speed", 10,-1,200, function() if ply() and ply():is_in_vehicle() then return ply():get_current_vehicle():get_max_speed() end end, function(v)
		ply():get_current_vehicle():set_max_speed(v) end)
	moreinfo:add_float_range("Mass", 1000,0,80000, function() if ply() and ply():is_in_vehicle() then return ply():get_current_vehicle():get_mass() end end, function(v)
		ply():get_current_vehicle():set_mass(v) end)
	moreinfo:add_int_range("Bomb Count>",1,-1,100, function() if ply() and ply():is_in_vehicle() then return ply():get_current_vehicle():get_bomb_count() end end, function(v)
		ply():get_current_vehicle():set_bomb_count(v) end)
	moreinfo:add_int_range("CounterMeasure Count>",1,-1,100, function() if ply() and ply():is_in_vehicle() then return ply():get_current_vehicle():get_countermeasure_count()
		end end, function(v) ply():get_current_vehicle():set_countermeasure_count(v) end)
	moreinfo:add_float_range("Boost amount>", 10,0,500, function() if ply() and ply():is_in_vehicle() then return ply():get_current_vehicle():get_boost() end end, function(v)
		ply():get_current_vehicle():set_boost(v) end)
	moreinfo:add_array_item("Boost is active>", YN, function() if ply() and ply():is_in_vehicle() then if ply():get_current_vehicle():get_boost_active() then return 1 else
		return 0 end end end, function(v) if v==1 then a=true else a=false end ply():get_current_vehicle():set_boost_active(a) end)
	moreinfo:add_array_item("Can be targeted>", YN, function() if ply() and ply():is_in_vehicle() then if ply():get_current_vehicle():get_can_be_targeted() then return 1 else
		return 0 end end end, function(v) if v==1 then a=true else a=false end ply():get_current_vehicle():set_can_be_targeted(a) end)
	moreinfo:add_array_item("Visible Damage>", YN, function() if ply() and ply():is_in_vehicle() then if ply():get_current_vehicle():get_can_be_visibly_damaged() then return 1 else
		return 0 end end end, function(v) if v==1 then a=true else a=false end ply():get_current_vehicle():set_can_be_visibly_damaged(a) end)
	moreinfo:add_array_item("Window Damage>", YN, function() if ply() and ply():is_in_vehicle() then if ply():get_current_vehicle():get_window_collisions_disabled() then return 0 else
		return 1 end end end, function(v) if v==1 then a=true else a=false end ply():get_current_vehicle():set_window_collisions_disabled(a) end)
		
	moreinfo:add_action("                     Weapon Info", function() end)
	moreinfo:add_array_item("Infinite Ammo>", YN, function() if ply() and ply():get_infinite_ammo() then return 1 else return 0 end end, function(v)
		if v==1 then a=true else a=false end ply():set_infinite_ammo(a) end)
	moreinfo:add_array_item("Infinite Clip>", YN, function() if ply() and ply():get_infinite_clip() then return 1 else return 0 end end, function(v)
		if v==1 then a=true else a=false end ply():set_infinite_clip(a) end)
	moreinfo:add_int_range("Current Ammo", 10, 0, 1000, function() if ply() and ply():get_current_weapon() then return ply():get_current_weapon():get_current_ammo() end end, function(v)
		ply():get_current_weapon():set_current_ammo(v) end)
	moreinfo:add_float_range("Reload time multiplier", 0.1, 0.1, 2, function() if ply() and ply():get_current_weapon() then return ply():get_current_weapon():get_reload_time_multiplier()
		end end, function(v) ply():get_current_weapon():set_reload_time_multiplier(v) end)
	moreinfo:add_float_range("Time between shots", 0.1, 0.1, 2, function() if ply() and ply():get_current_weapon() then return ply():get_current_weapon():get_time_between_shots()
		end end, function(v) ply():get_current_weapon():set_time_between_shots(v) end)
	moreinfo:add_float_range("Range", 100, 10, 2000, function() if ply() and ply():get_current_weapon() then return ply():get_current_weapon():get_range() end end, function(v)
		ply():get_current_weapon():set_range(v) end)
	moreinfo:add_float_range("Lock-On range", 100, 10, 2000, function() if ply() and ply():get_current_weapon() then return ply():get_current_weapon():get_lock_on_range() end end, function(v)
		ply():get_current_weapon():set_lock_on_range(v) end)
	moreinfo:add_float_range("Ped Hit Force", 1000, 0, 80000, function() if ply() and ply():get_current_weapon() then return ply():get_current_weapon():get_ped_force() end end, function(v)
		ply():get_current_weapon():set_ped_force(v) end)
	moreinfo:add_float_range("Vehicle Hit Force", 1000, 0, 80000, function() if ply() and ply():get_current_weapon() then return ply():get_current_weapon():get_vehicle_force()
		end end, function(v) ply():get_current_weapon():set_vehicle_force(v) end)
	moreinfo:add_float_range("Heli Hit Force", 1000, 0, 80000, function() if ply() and ply():get_current_weapon() then return ply():get_current_weapon():get_heli_force() end end, function(v)
		ply():get_current_weapon():set_heli_force(v) end)
	moreinfo:add_int_range("Fire Type", 1, 0, 5, function() if ply() and ply():get_current_weapon() then return ply():get_current_weapon():get_fire_type() end end, function(v)
		ply():get_current_weapon():set_fire_type(v) end)
	moreinfo:add_int_range("Explosion Type", 1, 0, 5, function() if ply() and ply():get_current_weapon() then return ply():get_current_weapon():get_explosion_type() end end, function(v)
		ply():get_current_weapon():set_explosion_type(v) end)
	moreinfo:add_int_range("Damage Type", 1, 0, 5, function() if ply() and ply():get_current_weapon() then return ply():get_current_weapon():get_damage_type() end end, function(v)
		ply():get_current_weapon():set_damage_type(v) end)
end
playerlist=menu.add_submenu("-------- →→→ [Troll Menu] →→→ ---------",BuildList)


