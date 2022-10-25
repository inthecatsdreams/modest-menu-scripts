require("scripts/global")


local Weapon=0
local function CsTrg() return stats.get_int("MP"..mpx().."_H3OPT_TARGET") end
local function H3Bit1(i,v)if v~=nil then stats.set_bool_masked("MP"..mpx().."_H3OPT_BITSET1",v,i)else return stats.get_bool_masked("MP"..mpx().."_H3OPT_BITSET1",i)end end
local function H3Bit0(i,v)if v~=nil then stats.set_bool_masked("MP"..mpx().."_H3OPT_BITSET0",v,i)else return stats.get_bool_masked("MP"..mpx().."_H3OPT_BITSET0",i)end end


local percM={"Detect"},{"0%"}percM[-1]="0%"for i=2,39 do percM[i]=((i+1)*5).."%" end
local CSHAP={"Silent and Sneaky","SilentnSneaky-HARD","TheBigCON","TheBigCON-HARD","Aggressive","Aggressive-HARD"}CSHAP[-1]="Unselected"
local CSHHKR={"Rickie Lukens","Christian Feltz","Yohan Blair","Avi Schwartzman","Paige Harris"}CSHHKR[0]="Unselected"
local CSHT={"Gold","Artwork","Diamonds"}CSHT[0]="Cash"

local DCHMis1={"*Vault KeyCards>", "*Weapons Collected>","*Vehicles Collected>", "*hacking Device>","*Nano Drone>","*Vault Laser>","Vault Drills>","*Vault Explosives>","*Breaching Charges>"}DCHMis1[0]="*Vault Content>"

local DCHMis0={"PatrolRoutes","Duggan Shipments","Infiltration Suit","Power Drills","EMP Device","Gunman Decoy","Clean Vehicle","Bugstars Van","Plant Trash","Maintainance Gear","Maintainance Van","Grouppe Sechs Van","Grouppe Sechs Gear","[!]Yung Ancestors Car","[!]Yung Ancestors Gear","Noose Gear","Fire Fighter Gear"}--17
DCHMis0[19]="Boring Machine"DCHMis0[20]="Reinforced Armor"

local CSHMSK={"Geometric","Hunter","Christian Feltz","Oni Half Mask","Emoji","Ornate Skull","Lucky Fruit","Guerilla","Clown","Animal","Riot","Oni","Hockey"}CSHHKR[0]="Unselected"



local CsSet=menu.add_submenu("Casino Setup")

CsSet:add_array_item("                     Go to Finale>",{"Normal","Hard"},function()
if stats.get_int("MP"..mpx().."_H3_HARD_APPROACH")==stats.get_int("MP"..mpx().."_H3OPT_APPROACH") then return 2 end return 1 end,function(v)
	AP=nil if v==1 then for i=1,3 do if stats.get_int("MP"..mpx().."_H3_HARD_APPROACH")~=i and stats.get_int("MP"..mpx().."_H3_LAST_APPROACH")~=i then AP=i end end
	else AP=stats.get_int("MP"..mpx().."_H3_HARD_APPROACH")end stats.set_int("MP"..mpx().."_H3OPT_APPROACH", AP)
	if AP==1 then H3Bit1(5,true)H3Bit1(6,true)H3Bit0(3,true)H3Bit0(5,true)elseif AP==2 then
		H3Bit1(7,true)H3Bit0(12,true)H3Bit0(13,true)H3Bit0(16,true)elseif AP==3 then H3Bit1(8,true)H3Bit1(9,true)H3Bit0(19,true)H3Bit0(20,true)else return end
	for i=0,4 do H3Bit1(i,true)end H3Bit0(1,true)H3Bit0(2,true)stats.set_int("MP"..mpx().."_H3OPT_KEYLEVELS", 2)
	stats.set_int("MP"..mpx().."_H3OPT_CREWHACKER",4)stats.set_int("MP"..mpx().."_H3OPT_CREWWEAP",1)stats.set_int("MP"..mpx().."_H3OPT_CREWDRIVER",1)
	stats.set_int("MP"..mpx().."_H3OPT_WEAPS", 0)stats.set_int("MP"..mpx().."_H3OPT_VEHS", 3)stats.set_int("MP"..mpx().."_H3OPT_DISRUPTSHIP", 3)
end)

CsSet:add_action("---------------↓↓↓ Manual ↓↓↓---------------",function()end)

CsSet:add_array_item("Choose Target>", CSHT, function() return CsTrg() end, function(H3t)
	stats.set_int("MP"..mpx().."_H3OPT_TARGET", H3t)
end)

for i=0,1 do CsSet:add_toggle(DCHMis1[i],function()return H3Bit1(i)end,function()H3Bit1(i,not H3Bit1(i))if i==0 then if not H3Bit1(i)then
	stats.set_int("MP"..mpx().."_H3OPT_BITSET1",0)stats.set_int("MP"..mpx().."_H3OPT_BITSET0",0)end end end)end
	
CsSet:add_toggle(DCHMis1[4],function()return H3Bit1(4)end,function()H3Bit1(4,not H3Bit1(4))end)

CsSet:add_array_item("*Game Approach>",{"Normal Mode","Hard Mode"}, function()
	if stats.get_int("MP"..mpx().."_H3_HARD_APPROACH")==stats.get_int("MP"..mpx().."_H3OPT_APPROACH") then
		return 2 else return 1 end end, function(H3lvl)
	LstAp=stats.get_int("MP"..mpx().."_H3_LAST_APPROACH") HrdAp=stats.get_int("MP"..mpx().."_H3_HARD_APPROACH")
	if H3lvl==2 then Apr=HrdAp else
		if LstAp ~= 1 and HrdAp ~= 1 then Apr=1 Weapon = 1
		elseif LstAp ~= 2 and HrdAp ~= 2 then Apr=2 Weapon = 0
		else Apr=3 Weapon = 0 end end
	stats.set_int("MP"..mpx().."_H3OPT_APPROACH", Apr)
end)

CsSet:add_array_item("*Or Choose Approach>", CSHAP, function() return 2*stats.get_int("MP"..mpx().."_H3OPT_APPROACH")-1 end, function(H3AO)
	if H3AO==1 then CSAP=1 LSTA=3 HRDA=2 elseif H3AO==2 then CSAP=1 LSTA=3 HRDA=1 elseif H3AO==3 then CSAP=2 LSTA=3 HRDA=1
	elseif H3AO==4 then CSAP=2 LSTA=3 HRDA=2 elseif H3AO==5 then CSAP=3 LSTA=1 HRDA=2 else CSAP=3 LSTA=1 HRDA=3 end
	stats.set_int("MP"..mpx().."_H3_LAST_APPROACH", LSTA)stats.set_int("MP"..mpx().."_H3_HARD_APPROACH", HRDA)stats.set_int("MP"..mpx().."_H3OPT_APPROACH", CSAP)
end)

CsSet:add_array_item("Choose Mask>", CSHMSK, function()M=stats.get_int("MP"..mpx().."_H3OPT_MASKS")
if M<1 or M>13 or M==nil then return 0 end return stats.get_int("MP"..mpx().."_H3OPT_MASKS") end, function(H3Msk)
	stats.set_int("MP"..mpx().."_H3OPT_MASKS", H3Msk)
end)
print(stats.get_int("MP"..mpx().."_H3OPT_MASKS"))
CsSet:add_array_item("Choose Hacker>", CSHHKR, function() return stats.get_int("MP"..mpx().."_H3OPT_CREWHACKER") end, function(Hkr)
	stats.set_int("MP"..mpx().."_H3OPT_CREWHACKER", Hkr)
end)



local APRSP=nil
local function CurAp()
	APRSP:clear()if stats.get_int("MP"..mpx().."_H3OPT_APPROACH")==1 then
		APRSP:add_action("                   [Silent and Sneaky]",function()end)
		APRSP:add_toggle(DCHMis0[5],function()return H3Bit0(5)end,function()H3Bit0(5,not H3Bit0(5))end)
		APRSP:add_toggle(DCHMis0[3],function()return H3Bit0(3)end,function()H3Bit0(3,not H3Bit0(3))end)
	elseif stats.get_int("MP"..mpx().."_H3OPT_APPROACH")==2 then
		APRSP:add_action("                         [The Big Con]",function()end)
		APRSP:add_toggle(DCHMis1[7],function()return H3Bit1(7)end,function()H3Bit1(7,not H3Bit1(7))end)
		APRSP:add_action("         __EntryDisguise__",function()end)
		for i=8,15 do APRSP:add_toggle(DCHMis0[i],function()return H3Bit0(i)end,function()
		H3Bit0(i,not H3Bit0(i))if i%2~=0 then if H3Bit0(i)then H3Bit0(i-1,true)end end end)end
		APRSP:add_action("              __ExitDisguise__", function()end)
		for i=16,17 do APRSP:add_toggle(DCHMis0[i],function()return H3Bit0(i)end,function()H3Bit0(i,not H3Bit0(i))end)end
	elseif stats.get_int("MP"..mpx().."_H3OPT_APPROACH")==3 then
		APRSP:add_action("                            [Aggressive]",function()end)
		for i=19,20 do APRSP:add_toggle(DCHMis0[i],function()return H3Bit0(i)end,function()H3Bit0(i,not H3Bit0(i))end)end
	else APRSP:add_action("    No Approach detected", function() end) APRSP:add_action("Try going back to MainMenu once", function() end)
	end
end
APRSP=CsSet:add_submenu("Approach Specific options",CurAp)

local GUN=nil
local KaAb, ChRe, PaMc, ChMc, GuMo={}, {}, {}, {}, {}
local we1, we2, we3, we4, we5=0, 0, 0, 0, 0
local function WEAPON()
	GUN:clear()GUN:add_action("                      Choose one", function() end)
	WEP=stats.get_int("MP"..mpx().."_H3OPT_CREWWEAP") APR=stats.get_int("MP"..mpx().."_H3OPT_APPROACH") Wa=stats.get_int("MP"..mpx().."_H3OPT_WEAPS")
	
	Abo, Mot, Ree, Mcc, Mcr="", "", "", "", "" if WEP==1 then Abo="*" AB=Wa elseif WEP==2 then Mot="*" MO=Wa
	elseif WEP==3 then Ree="*" RE=Wa elseif WEP==4 then Mcc="*" MC=Wa elseif WEP==5 then Mcr="*" MR=Wa end
	if APR==1 then kaab="MicroSMG" kaaB="MachinePistol" elseif APR==2 then kaab="MicroSMG" kaaB="Shotgun"
	elseif APR==3 then kaab="Shotgun" kaaB="Revolver" else kaab="Gun1" kaaB="Gun2" end
	if APR==1 or APR==3 then chre="SMG" chrE="Shotgun" elseif APR==2 then chre="Machine Pistol" chrE="Shotgun"
	else chre="Gun1" chrE="Gun2" end GuMo[0]="Rifle" GuMo[1]="Shotgun"
	if APR==1 then chmc="MicroSMG" chmC="MachinePistol" elseif APR==2 then chmc="MicroSMG" chmC="Shotgun"
	elseif APR==3 then chmc="MkII Shotgun" chmC="MkII Rifle" else chmc="Gun1" chmC="Gun2" end
	if APR==1 then pamc="MicroSMG" pamC="MachinePistol" elseif APR==2 then pamc="MicroSMG" pamC="Shotgun"
	elseif APR==3 then pamc="Shotgun" pamC="Revolver" else pamc="Gun1" pamC="Gun2" end
	KaAb[0]=kaab KaAb[1]=kaaB ChRe[0]=chre ChRe[1]=chrE ChMc[0]=chmc ChMc[1]=chmC PaMc[0]=pamc PaMc[1]=pamC
	
	GUN:add_array_item("Karl Abolaji "..Abo, KaAb, function() if not AB then return we1 else return Wa end end, function(KaW)
		we1=KaW stats.set_int("MP"..mpx().."_H3OPT_CREWWEAP", 1) stats.set_int("MP"..mpx().."_H3OPT_WEAPS", KaW) end)
	GUN:add_array_item("Charlie Reed"..Ree, ChRe, function() if not RE then return we3 else return Wa end end, function(ChW)
		we3=ChW stats.set_int("MP"..mpx().."_H3OPT_CREWWEAP", 3) stats.set_int("MP"..mpx().."_H3OPT_WEAPS", ChW) end)
	GUN:add_array_item("Patrick Mcreary"..Mcr, PaMc, function() if not MR then return we5 else return Wa end end, function(PaW)
		we5=PaW stats.set_int("MP"..mpx().."_H3OPT_CREWWEAP", 5) stats.set_int("MP"..mpx().."_H3OPT_WEAPS", PaW) end)
	GUN:add_array_item("Gustavo Mota"..Mot, GuMo, function() if not MO then return we2 else return Wa end end, function(GuW)
		we2=GuW stats.set_int("MP"..mpx().."_H3OPT_CREWWEAP", 2) stats.set_int("MP"..mpx().."_H3OPT_WEAPS", GuW) end)
	GUN:add_array_item("Chester Mccoy"..Mcc, ChMc, function() if not MC then return we4 else return Wa end end, function(ChW)
		we4=ChW stats.set_int("MP"..mpx().."_H3OPT_CREWWEAP", 4) stats.set_int("MP"..mpx().."_H3OPT_WEAPS", ChW) end)
	GUN:add_toggle(DCHMis1[2],function()return H3Bit1(2)end,function()H3Bit1(2,not H3Bit1(2))end)
end
GUN=CsSet:add_submenu("Choose a Gunman and Weapon",WEAPON)

local CAR=nil
local KaDe, ZaNe, TaMa, EdTo, CcMc={}, {}, {}, {}, {}
local ca1, ca2, ca3, ca4, ca5=3, 3, 3, 3, 3
local function DRIVER()
	CAR:clear()CAR:add_action("            (IfnotSetAlready)Choose one", function() end)
	Ca=stats.get_int("MP"..mpx().."_H3OPT_VEHS") drv=stats.get_int("MP"..mpx().."_H3OPT_CREWDRIVER")
	den, mar, toh, nel, mcc="", "", "", "", ""
	if drv==1 then den="*" DE=Ca elseif drv==2 then mar="*" MA=Ca elseif drv==3 then toh="*" TO=Ca elseif drv==4 then nel="*" NE=Ca elseif drv==5 then mcc="*" MR=Ca end
	KaDe[0]="Issi Classic" KaDe[1]="ASBO" KaDe[2]="Kanjo" KaDe[3]="Sentinel Classic"
	ZaNe[0]="Manchez" ZaNe[1]="Stryder" ZaNe[2]="Defiler" ZaNe[3]="Lectro"
	TaMa[0]="Retinue MKII" TaMa[1]="Drift Yosemite" TaMa[2]="Sugoi" TaMa[3]="Jugular"
	EdTo[0]="Sultan Classic" EdTo[1]="Gauntlet Classic" EdTo[2]="Elie" EdTo[3]="Komoda"
	CcMc[0]="Zhaba" CcMc[1]="Vagrant" CcMc[2]="Outlaw" CcMc[3]="Everon"
	
	CAR:add_array_item("Karim Denz"..den, KaDe, function() if not DE then return ca1 else return Ca end end, function(KaC)
		ca1=KaC stats.set_int("MP"..mpx().."_H3OPT_CREWDRIVER", 1) stats.set_int("MP"..mpx().."_H3OPT_VEHS", KaC) end)
	CAR:add_array_item("Zach Nelson(Bikes)"..nel, ZaNe, function() if not NE then return ca4 else return Ca end end, function(ZaC)
		ca4=ZaC stats.set_int("MP"..mpx().."_H3OPT_CREWDRIVER", 4) stats.set_int("MP"..mpx().."_H3OPT_VEHS", ZaC) end)
	CAR:add_array_item("Taliana Martinez"..mar, TaMa, function() if not MA then return ca2 else return Ca end end, function(TaC)
		ca2=TaC stats.set_int("MP"..mpx().."_H3OPT_CREWDRIVER", 2) stats.set_int("MP"..mpx().."_H3OPT_VEHS", TaC) end)
	CAR:add_array_item("Eddie Toh"..toh, EdTo, function() if not TO then return ca3 else return Ca end end, function(EdC)
		ca3=EdC stats.set_int("MP"..mpx().."_H3OPT_CREWDRIVER", 3) stats.set_int("MP"..mpx().."_H3OPT_VEHS", EdC) end)
	CAR:add_array_item("Chester Mccoy"..mcc, CcMc, function() if not MR then return ca5 else return Ca end end, function(ChC)
		ca5=ChC stats.set_int("MP"..mpx().."_H3OPT_CREWDRIVER", 5) stats.set_int("MP"..mpx().."_H3OPT_WEAPS", ChC) end)
	CAR:add_toggle(DCHMis1[3],function()return H3Bit1(3)end,function()H3Bit1(3,not H3Bit1(3))end)
end
CAR=CsSet:add_submenu("Choose a Driver and Car",DRIVER)



Comm=CsSet:add_submenu("Common Missions")

Comm:add_array_item("Security Pass Level>", { "No", "Lv.1", "Lv.2" }, function() return stats.get_int("MP"..mpx().."_H3OPT_KEYLEVELS")+1 end,function(SPss)
	stats.set_int("MP"..mpx().."_H3OPT_KEYLEVELS", SPss-1)
end)
for i=1,2 do Comm:add_toggle(DCHMis0[i],function()return H3Bit0(i)end,function()H3Bit0(i,not H3Bit0(i))end)end
Comm:add_array_item("           Shipments Destroyed>", {"0%","33%","66%","100%"}, function()return stats.get_int("MP"..mpx().."_H3OPT_DISRUPTSHIP")+1 end,function(DugS)
	if DugS>1 then DuSh=4 stats.set_int("MP"..mpx().."_H3OPT_DISRUPTSHIP",DugS-1)H3Bit0(2,true)
	else DuSh=0 stats.set_int("MP"..mpx().."_H3OPT_DISRUPTSHIP", 0)end
end)
Comm:add_toggle(DCHMis0[4],function()return H3Bit0(4)end,function()return H3Bit0(4,not H3Bit0(4))end)

for i=6,7 do Comm:add_toggle(DCHMis0[i],function()return H3Bit0(i)end,function()H3Bit0(i,not H3Bit0(i))end)end



local CsCT=nil
local H3C1, H3C2, H3C3, H3C4, OH, MaX, tar=0, 0, 0, 0, 0, nil, nil
local CaSHE={} CaSHE[1]="Selected" CaSHE[2]="All 100%" CaSHE[3]="Others 100%" CaSHE[4]="Others 85%"

local function CUT()
	CsCT:clear()for i=0,3 do if player.get_player_ped(i)==localplayer then freem=false else freem=true end end
	if globals.get_int(DPCO+1) <= 1000 and globals.get_int(DPCO+1) >= 0 then
		if globals.get_int(DPCO+1)>=15 then if player.get_player_ped(0)==localplayer or freem then P1="You" else P1=player.get_player_name(0)end
		if globals.get_int(DPCO+2)>=15 then if player.get_player_ped(1)==localplayer then P2="You" else P2=player.get_player_name(1)end if not P2 then return end
		if globals.get_int(DPCO+3)>=15 then if player.get_player_ped(2)==localplayer then P3="You" else P3=player.get_player_name(2)end
		if globals.get_int(DPCO+4)>=15 then if player.get_player_ped(3)==localplayer then P4="You" else P4=player.get_player_name(3)end
		end end end end
		CsCT:add_array_item("Player1> "..P1, CtPerc, function() return math.floor(globals.get_int(DPCO+1)/5-1) end, function(p) H3C1=(p+1)*5 end)
		CsCT:add_array_item("Player2> "..P2, CtPerc, function() return math.floor(globals.get_int(DPCO+2)/5-1) end, function(p) H3C2=(p+1)*5 end)
		if P3 then CsCT:add_array_item("Player3> "..P3, CtPerc, function() return math.floor(globals.get_int(DPCO+3)/5-1) end, function(p) H3C3=(p+1)*5 end) end
		if P4 then CsCT:add_array_item("Player4> "..P4, CtPerc, function() return math.floor(globals.get_int(DPCO+4)/5-1) end, function(p) H3C4=(p+1)*5 end) end
		CsCT:add_array_item("          <Set>>>>>", CaSHE, function() return 1 end, function(CasC)
			if CasC==2 then H3C1, H3C2, H3C3, H3C4=100, 100, 100, 100
			elseif CasC==3 then H3C1, H3C2, H3C3, H3C4=15, 100, 100, 100
			elseif CasC==4 then H3C1, H3C2, H3C3, H3C4=15, 85, 85, 85 end
			MaX=math.max(H3C1, H3C2, H3C3, H3C4)
			if H3C1>=15 then globals.set_int(DPCO+1, H3C1) end
			if H3C2>=15 then globals.set_int(DPCO+2, H3C2) end
			if globals.get_int(DPCO+3) and globals.get_int(DPCO+3)>=15 and H3C3>=15 then globals.set_int(DPCO+3, H3C3) end
			if globals.get_int(DPCO+4) and globals.get_int(DPCO+4)>=15 and H3C4>=15 then globals.set_int(DPCO+4, H3C4) end
		end)
		CsCT:add_array_item("Get Take%(for AutoMaxTake)",percM,function()if not DCMaX then return 1 end return math.floor(DCMaX/5-1)end,function(cut)
			if cut>=2 then DCMaX=(cut+1)*5 else DCMaX=math.max(globals.get_int(DPCO+4), globals.get_int(DPCO+3), globals.get_int(DPCO+2), globals.get_int(DPCO+1))end
			if player.get_player_ped(0)==localplayer then OH=0 else OH=1 end
		end)
	end
end
CsCT=menu.add_submenu("    Casino Cut",CUT)



local CsHs=menu.add_submenu("        Casino Heist")
local LPos=nil local POS={} POS[1]="Underground" POS[2]="Locker" local AMTOpt=1

CsHs:add_action("Complete Keypad", function()
	if HS():is_active() and HS():get_int(HSKP)>=3 and HS():get_int(HSKP)<100 then HS():set_int(HSKP, 5) end
end)
CsHs:add_action("Complete Fingerprint", function()
	if HS():is_active() and HS():get_int(HSFG)==3 or HS():get_int(HSFG)==4 then
		HS():set_int(HSFG, 5) end
end)
CsHs:add_action("Drill Vault Door", function()
	if HS():is_active() and HS():get_int(HSVT)>=0 or HS():get_int(HSVT)<=100 then
		HS():set_int(HSVS, HS():get_int(HSVT)) end
end)
CsHs:add_array_item("Drop NPCs to ", POS, function() if LPos then return LPos else return 1 end end, function(ps) LPos=ps
	for ped in replayinterface.get_peds()do if ped and ped:get_pedtype()>3 then if ped:is_in_vehicle()then ped:set_config_flag(62,false)sleep(0.08)ped:set_config_flag(62,true)else
		if ps==1 then ped:set_rotation(vector3(58.04,0,0))ped:set_position(vector3(ped:get_position().y-20))else
			ped:set_position(vector3(2520.59, -287.45, -60.02)) end ped:set_armour(0) ped:set_config_flag(60, false)end end end
end) local peV
CsHs:add_array_item("Ped Vehicles", { "Stop", "Fix" }, function() if peV then return peV else return 1 end end, function(pe)
	peV=pe if pe==2 then for veh in replayinterface.get_vehicles() do if veh:get_acceleration()==0 then veh:set_acceleration(0.34) end end
	else for veh in replayinterface.get_vehicles() do if localplayer:get_current_vehicle()~=veh then veh:set_acceleration(0) end end end
end)
pai=-1
CsHs:add_int_range("Replace nearest vehicle|PaintJob>",1,-1,120,function()return pai end,function(n)pai=n
	V=localplayer:get_nearest_vehicle()if not V or localplayer:is_in_vehicle()then return end CrVh(V:get_model_hash(),V:get_position(),0,n)
end)

CsHs:add_action("Kill all NPCs", function() menu.kill_all_npcs() end)

CsHs:add_action("                       Modify Loot", function() end)
CsHs:add_array_item("Detected Target>", CSHT, function() if tar then return tar end return CsTrg() end, function(t) tar=t end)
local Price={0,100000,2115000,2326500,2350000,2585000,2843500,3290000,3619000,20000000}
CsHs:add_array_item("Potential Take for Target>", Price, function()
if localplayer then if not tar or tar==-1 then tar=CsTrg() end for i=1,10 do if Price[i]==globals.get_int(DTO+tar) then return i end end end return 2 end, function(v) 
	if not tar or tar==-1 then tar=CsTrg() end globals.set_int(DTO+tar, tonumber(Price[v]))
end)
CsHs:add_int_range("Real Take>", 100000, 150000, 4438000, function() if HS():is_active() then return HS():get_int(HSRT) else return 0 end end, function(RTv) 
	if HS():is_active() then HS():set_int(HSRT, RTv) end
end)

CsHs:add_array_item("AutoMaxTake(Cut%required)>", { "Safe", "Max" }, function() return AMTOpt end, function(sf)
	if MaX==nil then return end AMTOpt=sf
	Car=stats.get_int("MP"..mpx().."_H3OPT_CREWDRIVER") Hck=stats.get_int("MP"..mpx().."_H3OPT_CREWHACKER") Gun=stats.get_int("MP"..mpx().."_H3OPT_CREWWEAP")
	if sf==1 then plmx=3300000 else plmx=3660000 end
	if OH then Wp,Dr,Hc=5,5,3 else if Gun==1 then Wp=5 elseif Gun==2 then Wp=9 elseif Gun==3 then Wp=7 elseif Gun==4 then Wp=10  elseif Gun==5 then Wp=8 end
	if Car==1 then Dr=5 elseif Car==2 then Dr=7 elseif Car==3 then Dr=9 elseif Car==4 then Dr=6 elseif Car==5 then Dr=10 end
	if Hck==1 then Hc=3 elseif Hck==2 then Hc=7 elseif Hck==3 then Hc=5 elseif Hck==4 then Hc=10 elseif Hck==5 then Hc=9 end end
	tke=math.floor((plmx*100/MaX)*((((10000/(100-Wp)-100)+(10000/(100-Dr)-100)+(10000/(100-Hc)-100)+(10000/95-100))+100)/100))
	if tke>4438000 then tke=4438000 end HS():set_int(HSRT, tke)
end)

CsHs:add_action("      _____________Teleport_____________", function() end)
CsHs:add_action("TP-Double KeyCard", function() TP2(2469.234863,-281.168030,-71.994225, -1.049023,0,0) end)
CsHs:add_action("TP-Staff Lobby Entrance", function() TP2(2547.100098,-269.579987,-60.022987, 3.134611,0,0) end)

CsHs:add_action("    ______Spawn On Suitable Location_____", function() end)

CsHs:add_action("Spawn Unmarked Cruiser", function() CrVh(joaat("police4"),vector3(982.24,-27.73,81.0),0) end)
CsHs:add_action("Spawn Police Maverick", function() CrVh(joaat("polmav"),vector3(966.54,42.75,122.0),0) end)
CsHs:add_action("Spawn Police Mav- side", function() CrVh(joaat("polmav"),vector3(964.94,-131.53,73.5),0) end)