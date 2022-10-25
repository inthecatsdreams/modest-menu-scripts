require("scripts/global")



local function DDP(i,v)
	if v~=nil then if i>13 then stats.set_bool_masked("MP"..mpx().."_GANGOPS_FM_MISSION_PROG",v,i)stats.set_bool_masked("MP"..mpx().."_GANGOPS_FM_MISSION_PROG",v,i-14)
		if v then stats.set_bool_masked("MP"..mpx().."_GANGOPS_FM_MISSION_SKIP",false,i-14)end else stats.set_bool_masked("MP"..mpx().."_GANGOPS_FM_MISSION_PROG",v,i)
			if v then stats.set_bool_masked("MP"..mpx().."_GANGOPS_FM_MISSION_PROG",false,i+14)stats.set_bool_masked("MP"..mpx().."_GANGOPS_FM_MISSION_SKIP",false,i)end end
	else return stats.get_bool_masked("MP"..mpx().."_GANGOPS_FM_MISSION_PROG",i) end
end
local function DDPs(i,v)
	if v~=nil then stats.set_bool_masked("MP"..mpx().."_GANGOPS_FM_MISSION_SKIP",v,i)if v then stats.set_bool_masked("MP"..mpx().."_GANGOPS_FM_MISSION_PROG",true,i)
	stats.set_bool_masked("MP"..mpx().."_GANGOPS_FM_MISSION_PROG",false,i+14)end else return stats.get_bool_masked("MP"..mpx().."_GANGOPS_FM_MISSION_SKIP",i) end
end
local function DDM(i,v)
	if v~=nil then stats.set_bool_masked("MP"..mpx().."_GANGOPS_FLOW_MISSION_PROG",v,i)
	if v then if i>-1 and i<3 or i>9 and i<14 then if not DDP(i)and not DDPs(i)then DDP(i,true)end elseif i>3 and i<7 then if not DDP(i-1)and not DDPs(i-1)then DDP(i-1,true)end
		elseif i==7 or i==9 then if not DDP(i)and not DDPs(i)and not DDP(i-1)and not DDPs(i-1)then DDP(i,true)DDP(i-1,true)end end end
	else return stats.get_bool_masked("MP"..mpx().."_GANGOPS_FLOW_MISSION_PROG",i) end
end

local function APTm(i,v)
	if v~=nil then stats.set_bool_masked("MP"..mpx().."_HEIST_PLANNING_STAGE",v,i)else return stats.get_bool_masked("MP"..mpx().."_HEIST_PLANNING_STAGE",i)end
end

local function fixVeh()
	for veh in replayinterface.get_vehicles() do if veh:get_acceleration()==0
		then veh:set_acceleration(0.34) end menu.heal_vehicle() veh:set_bulletproof_tires(true) end
end
local function movePed(ps)
	for ped in replayinterface.get_peds() do if IsNPC(ped) then if not ped:is_in_vehicle() then if ps==1 then
		ped:set_position(vector3(ped:get_position().y-20)) else ped:set_position(localplayer:get_position()) end
		ped:set_armour(0) else ped:get_current_vehicle():set_acceleration(0) end end end
end

local PLst={}
local function HPL()
	for i=0,3 do PLst[i]=nil if player.get_player_ped(i) then if player.get_player_ped(i)==localplayer then PLst[i]="Yourself" else
		PLst[i]=player.get_player_name(i)end end end
end

local DDHP={"Deluxos","Akula","Key Cards","ULP Intel","Riot Control van","Stormbergs","Torpedo ECH","Markd Cash","Recon","Chernobog","Flight Path","Test Site Intel",
		"Onboard Compputer"}DDHP[0]="Paramedic Equipment"
local DDHS={"Signal Intercept","ServerFarm","Unknown","Avenger","Rescue ULP","Salvage Hard Drives","Submarine Recon","Unknown","Rescue Agent14","Rescue ULP","Barrage","Khanjali",
		"Air Defences"}DDHS[0]="Dead Courier"
local DDHeist={ "Data Breaches", "Bogdan Problem", "Doomsday Scenario" }

local EqT={"Completed","Stolen","Skipped"}EqT[0]="Incomplete"
 
local AC1,AC2,AC3,AC4,ANum,pai=0,0,0,0,0,-1
local APHE={"Selected","All 100%","Others 100%","Others 85%"}
local POS={ "Underground", "On Yourself" } local LPos,LPos2






local DDSt=nil
local function DDHL()DDSt:clear()HPL()

	DDSt:add_array_item("Setup D'Day", DDHeist, function() return 3 end, function(ActNum)
		if ActNum==1 then DProg=7 DProg2=7 elseif ActNum==2 then DProg=240 DProg2=248
		else DProg=15872 DProg2=16128 end stats.set_int("MP"..mpx().."_GANGOPS_FLOW_MISSION_PROG", DProg)
		stats.set_int("MP"..mpx().."_GANGOPS_FM_MISSION_PROG", DProg2)
	end)

	DDH=DDSt:add_submenu(" Custom Setup  →→→|(Toggle requried items Only!)")
	DDH:add_action("               [ACT-I: Data Breaches]",function()end)
	for i=0,2 do DDH:add_array_item("Prep- "..DDHP[i],EqT,function()if DDP(i+14)then return 2 elseif DDPs(i)then return 3 elseif DDP(i)then return 1 end return 0 end,function(o)
		if o==1 then DDP(i,true)elseif o==2 then DDP(i+14,true)elseif o==3 then DDPs(i,true)else DDP(i+14,false)DDPs(i,false)end end)
		DDH:add_toggle("      Setup"..DDHS[i],function()return DDM(i)end,function()DDM(i,not DDM(i))end)end
	DDH:add_toggle(DDHS[3],function()return DDM(3)end,function()end)

	DDH:add_action("              [ACT-I: Bogdan Problem]",function()end)
	for i=4,7 do DDH:add_array_item("Prep- "..DDHP[i-1],EqT,function()if DDP(i-1+14)then return 2 elseif DDPs(i-1)then return 3 elseif DDP(i-1)then return 1 end return 0 end,function(o)
		if o==1 then DDP(i-1,true)elseif o==2 then DDP(i-1+14,true)elseif o==3 then DDPs(i-1,true)else DDP(i-1+14,false)DDPs(i-1,false)end end)
			if i==7 then DDH:add_array_item("Prep- "..DDHP[i],EqT,function()
				if DDP(i+14)then return 2 elseif DDPs(i)then return 3 elseif DDP(i)then return 1 end return 0 end,function(o)
					if o==1 then DDP(i,true)elseif o==2 then DDP(i+14,true)elseif o==3 then DDPs(i,true)else DDP(i+14,false)DDPs(i,false)end end)end
		DDH:add_toggle("      Setup"..DDHS[i],function()return DDM(i)end,function()DDM(i,not DDM(i))end)end
	DDH:add_toggle(DDHS[8],function()return DDM(8)end,function()DDM(8,not DDM(8))end)

	DDH:add_action("             [ACT-I: Doomsday Scenario]",function()end)
	DDH:add_array_item("Prep- "..DDHP[8],EqT,function()if DDP(8+14)then return 2 elseif DDPs(8)then return 3 elseif DDP(8)then return 1 end return 0 end,function(o)
		if o==1 then DDP(8,true)elseif o==2 then DDP(8+14,true)elseif o==3 then DDPs(8,true)else DDP(8+14,false)DDPs(8,false)end
	end)
	DDH:add_array_item("Prep- "..DDHP[9],EqT,function()if DDP(9+14)then return 2 elseif DDPs(9)then return 3 elseif DDP(9)then return 1 end return 0 end,function(o)
			if o==1 then DDP(9,true)elseif o==2 then DDP(9+14,true)elseif o==3 then DDPs(9,true)else DDP(9+14,false)DDPs(9,false)end
	end)
	DDH:add_toggle("      Setup"..DDHS[9],function()return DDM(9)end,function()DDM(9,not DDM(9))end) 

	for i=10,13 do DDH:add_array_item("Prep- "..DDHP[i],EqT,function()
		if DDP(i+14)then return 2 elseif DDPs(i)then return 3 elseif DDP(i)then return 1 end return 0 end,function(o)
			if o==1 then DDP(i,true)elseif o==2 then DDP(i+14,true)elseif o==3 then DDPs(i,true)else DDP(i+14,false)DDPs(i,false)end end)
		DDH:add_toggle("      Setup"..DDHS[i],function()return DDM(i)end,function()DDM(i,not DDM(i))end)end






	local DDC1,DDC2,DDC3,DDC4=0,0,0,0
	local DDHE={ "Selected", "All 100%", "Others 100%", "Others 85%" }
	if globals.get_int(DDCO+1)<10000 and globals.get_int(DDCO+1)>-1 then
		DDSt:add_array_item("Player 1>", CtPerc, function() return math.floor(globals.get_int(DDCO+1)/5-1) end, function(p) DDC1=(p+1)*5 end)
		DDSt:add_array_item("Player 2>", CtPerc, function() return math.floor(globals.get_int(DDCO+2)/5-1) end, function(p) DDC2=(p+1)*5 end)
		DDSt:add_array_item("Player 3>", CtPerc, function() return math.floor(globals.get_int(DDCO+3)/5-1) end, function(p) DDC3=(p+1)*5 end)
		DDSt:add_array_item("Player 4>", CtPerc, function() return math.floor(globals.get_int(DDCO+4)/5-1) end, function(p) DDC4=(p+1)*5 end)
		DDSt:add_array_item("                        ---[[Set]]---", DDHE, function() return 1 end, function(DDc)
			if DDc==2 then DDC1,DDC2,DDC3,DDC4=100,100,100,100 elseif DDc==3 then DDC1,DDC2,DDC3,DDC4=15,100,100,100
			elseif DDc==4 then DDC1,DDC2,DDC3,DDC4=15,85,85,85 end globals.set_int(DDCO+1, DDC1) globals.set_int(DDCO+2, DDC2)
			if not globals.get_int(DDCO+3) or globals.get_int(DDCO+3)<15 then return end if DDC3>0 then globals.set_int(DDCO+3, DDC3) end
			if not globals.get_int(DDCO+4) or globals.get_int(DDCO+4)<15 then return end if DDC4>0 then globals.set_int(DDCO+4, DDC4) end
		end)
	end

	DDSt:add_action("", function() end)

	local POS={ "Underground", "On Yourself" } local LPos,LPos2
	local function IsNPC(ped) if not ped or ped:get_pedtype()<4 then return false else return true end end

	DDSt:add_action("Complete Server Nodes(ACT I)", function()
		if HS():is_active() then if HS():get_int(Nodes)>-1 and HS():get_int(Nodes)<100 then HS():set_int(Nodes, 2) end end
	end)
	DDSt:add_action("Complete Beam Puzzle(ACT III)", function()
		if HS():is_active() then if HS():get_int(Beam)>-1 and HS():get_int(Beam)<100 then HS():set_int(Beam, 3) end end
	end)

	DDSt:add_array_item("Drop NPCs to ", POS, function() if LPos then return LPos else return 1 end end, function(ps) LPos=ps movePed(ps) end)
	DDSt:add_action("Kill all NPCs", function() menu.kill_all_npcs() end)
	DDSt:add_action("Fix vehicles", function() fixVeh() end)
	DDSt:add_int_range("Replace nearest vehicle|PaintJob>",1,-1,120,function()return pai end,function(n)pai=n
		V=localplayer:get_nearest_vehicle()if not V or localplayer:is_in_vehicle()then return end CREATE_VEHICLE(V:get_model_hash(),V:get_position(),0,n)
	end)
	DDSt:add_array_item("[exp!]Get Paper(ULP) to-",PLst,function()return ANum end,function(n)ANum=n
		for ped in replayinterface.get_peds() do if ped:get_model_hash()==joaat("ig_paper")then ped:set_position(player.get_player_ped(n):get_position())return end end
	end)
end
DDSt=menu.add_submenu("D'day",DDHL)


local function Apt()
	AptH:clear()APTL=AptH:add_submenu("Setup>|(Toggle requried items Only!)")
	for i=0,15,3 do APTL:add_toggle("Mission "..tostring(math.floor(i/3)),function()return APTm(i)end,function()APTm(i,not APTm(i))end)end
	if globals.get_int(APCO+1)<10000 and globals.get_int(APCO+1)>-1 then
		AptH:add_array_item("Apt Player 1", CtPerc, function() return math.floor(globals.get_int(APCO+1)/5-1) end, function(p) AC1=(p+1)*5 end)
		AptH:add_array_item("Apt Player 2", CtPerc, function() return math.floor(globals.get_int(APCO+2)/5-1) end, function(p) AC2=(p+1)*5 end)
		AptH:add_array_item("Apt Player 3", CtPerc, function() return math.floor(globals.get_int(APCO+3)/5-1) end, function(p) AC3=(p+1)*5 end)
		AptH:add_array_item("Apt Player 4", CtPerc, function() return math.floor(globals.get_int(APCO+4)/5-1) end, function(p) AC4=(p+1)*5 end)
		AptH:add_array_item("                 ---[[Set]]---", APHE, function() return 1 end, function(ApC)
			if ApC==2 then AC1,AC2,AC3,AC4=100,100,100,100 elseif ApC==3 then AC1,AC2,AC3,AC4=15,100,100,100
			elseif ApC==4 then AC1,AC2,AC3,AC4=15,85,85,85 end globals.set_int(APCO+1,AC1)
			globals.set_int(APCO+2,AC2) globals.set_int(APCO+3,AC3) globals.set_int(APCO+4,AC4)
		end)
	end
	
	AptH:add_action("", function() end)
	AptH:add_action("Fleeca Circut Breaker", function()
		if HS():is_active() then if HS():get_int(VLSI)>-1 and HS():get_int(VLSI)<100 then HS():set_int(VLSI, 7) end end
	end)


	AptH:add_array_item("Drop NPCs to ", POS, function() if LPos2 then return LPos2 else return 1 end end, function(ps) LPos2=ps movePed(ps) end)
	AptH:add_action("Fix vehicles", function() fixVeh() end)
	AptH:add_action("Kill all NPCs", function() menu.kill_all_npcs() end)
	AptH:add_int_range("Replace nearest vehicle|PaintJob>",1,-1,120,function()return pai end,function(n)pai=n
		V=localplayer:get_nearest_vehicle()if not V or localplayer:is_in_vehicle()then return end CREATE_VEHICLE(V:get_model_hash(),V:get_position(),0,n)
	end)

	AptH:add_array_item("[exp!]Get Rashkovsky to-",PLst,function()return ANum end,function(n)ANum=n
		for ped in replayinterface.get_peds() do if ped:get_model_hash()==joaat("ig_rashcosvki")then ped:set_position(player.get_player_ped(n):get_position())end end
	end)
end

AptH=menu.add_submenu("Apartment Heists",Apt)

menu.add_array_item("Auto Shop Heist>", { "Unselected", "Union Depository", "Superdollar Deal", "Bank Contract", "ECU Job", "Prison Contract", "Agency Deal", "LOST Contract", "Data Contract" },
function() return stats.get_int("MP"..mpx().."_TUNER_CURRENT")+2 end, function(v) stats.set_int("MP"..mpx().."_TUNER_CURRENT", v-2)
stats.set_int("MP"..mpx().."_TUNER_GEN_BS", 12543) end)

menu.add_array_item("ULP Contract>", { "Intelligece", "Counterintelligence", "Extraction", "Asset Seizure", "Operation Paper Trail", "CleanUp" }, function()
return stats.get_int("MP"..mpx().."_ULP_MISSION_CURRENT")+1 end, function(v)
	if stats.get_int("MP"..mpx().."_ULP_MISSION_CURRENT")==v-1 then return end C=stats.get_int("MP"..mpx().."_ULP_MISSION_CURRENT") V=0
	if stats.get_int("MP"..mpx().."_ULP_MISSION_CURRENT")<v-1 then for i=C,5 do V=V+2^i-1 end for i=0,v-1 do V=V+2^i-1 end else for i=0,v-1 do V=V+2^i-1 end end
	stats.set_int("MP"..mpx().."_ULP_MISSION_CURRENT", v-1) stats.set_int("MP"..mpx().."_ULP_MISSION_PROGRESS", stats.get_int("MP"..mpx().."_ULP_MISSION_PROGRESS")+V)
end)