require("scripts/global")



local function H4Weap(v)if v~=nil then stats.set_int("MP"..mpx().."_H4CNF_WEAPONS",v)else return stats.get_int("MP"..mpx().."_H4CNF_WEAPONS")end end

local function H4Msn(i,v)if v~=nil then stats.set_bool_masked("MP"..mpx().."_H4_MISSIONS",v,i)else return stats.get_bool_masked("MP"..mpx().."_H4_MISSIONS",i)end end
local function H4Gen(i,v)if v~=nil then stats.set_bool_masked("MP"..mpx().."_H4CNF_BS_GEN",v,i)else return stats.get_bool_masked("MP"..mpx().."_H4CNF_BS_GEN",i)end end
 
local function H4Pnt(i,v)
	if v==nil then return stats.get_bool_masked("MP"..mpx().."_H4LOOT_PAINT",i)
	else stats.set_bool_masked("MP"..mpx().."_H4LOOT_PAINT",v,i)stats.set_bool_masked("MP"..mpx().."_H4LOOT_PAINT_SCOPED",v,i)end
end
local function H4Gol(i,v)
	if v==nil then return stats.get_bool_masked("MP"..mpx().."_H4LOOT_GOLD_C",i)
	else stats.set_bool_masked("MP"..mpx().."_H4LOOT_GOLD_C",v,i)stats.set_bool_masked("MP"..mpx().."_H4LOOT_GOLD_C_SCOPED",v,i)if v then
	stats.set_bool_masked("MP"..mpx().."_H4LOOT_CASH_C",false,i)stats.set_bool_masked("MP"..mpx().."_H4LOOT_CASH_C_SCOPED",false,i)end end
end
local function H4Cas(i,v)
	if v==nil then return stats.get_bool_masked("MP"..mpx().."_H4LOOT_CASH_C",i)
	else stats.set_bool_masked("MP"..mpx().."_H4LOOT_CASH_C",v,i)stats.set_bool_masked("MP"..mpx().."_H4LOOT_CASH_C_SCOPED",v,i)if v then
	stats.set_bool_masked("MP"..mpx().."_H4LOOT_GOLD_C",false,i)stats.set_bool_masked("MP"..mpx().."_H4LOOT_GOLD_C_SCOPED",false,i)end end
end
	
local function H4Cok(i,v)
	if v==nil then return stats.get_bool_masked("MP"..mpx().."_H4LOOT_COKE_I",i)
	else stats.set_bool_masked("MP"..mpx().."_H4LOOT_COKE_I",v,i)stats.set_bool_masked("MP"..mpx().."_H4LOOT_COKE_I_SCOPED",v,i)if v then
		stats.set_bool_masked("MP"..mpx().."_H4LOOT_CASH_I",false,i)stats.set_bool_masked("MP"..mpx().."_H4LOOT_CASH_I_SCOPED",false,i)
		stats.set_bool_masked("MP"..mpx().."_H4LOOT_WEED_I",false,i)stats.set_bool_masked("MP"..mpx().."_H4LOOT_WEED_I_SCOPED",false,i)end end
end
local function H4Cas2(i,v)
	if v==nil then return stats.get_bool_masked("MP"..mpx().."_H4LOOT_CASH_I",i)
	else stats.set_bool_masked("MP"..mpx().."_H4LOOT_CASH_I",v,i)stats.set_bool_masked("MP"..mpx().."_H4LOOT_CASH_I_SCOPED",v,i)if v then
		stats.set_bool_masked("MP"..mpx().."_H4LOOT_COKE_I",false,i)stats.set_bool_masked("MP"..mpx().."_H4LOOT_COKE_I_SCOPED",false,i)
		stats.set_bool_masked("MP"..mpx().."_H4LOOT_WEED_I",false,i)stats.set_bool_masked("MP"..mpx().."_H4LOOT_WEED_I_SCOPED",false,i)end end
end
local function H4Wee(i,v)
	if v==nil then return stats.get_bool_masked("MP"..mpx().."_H4LOOT_WEED_I",i)
	else stats.set_bool_masked("MP"..mpx().."_H4LOOT_WEED_I",v,i)stats.set_bool_masked("MP"..mpx().."_H4LOOT_WEED_I_SCOPED",v,i)if v then
		stats.set_bool_masked("MP"..mpx().."_H4LOOT_CASH_I",false,i)stats.set_bool_masked("MP"..mpx().."_H4LOOT_CASH_I_SCOPED",false,i)
		stats.set_bool_masked("MP"..mpx().."_H4LOOT_COKE_I",false,i)stats.set_bool_masked("MP"..mpx().."_H4LOOT_COKE_I_SCOPED",false,i)end end
end



local H4Mis={"Kosatka Submarine>","RO-86 Alkonost>","Velum 5-Seater>","Stealth Annihilator>","Kurtz Patrol Boat>","Longifin Boat>","Pilot(Alkonost,Annihilator)>",
	"Demolition Charges>","*Cutting Torch>","*Plasma Cutter>","*Fingerprint Cloner>","*Approach Weapon>","Weapons Disruption>","Armor Disruption>","Air Support Disruption>"}
	H4Mis[0]="*Gather Intel"
	
local H4BS={"  Put Grappling Eq in NorthDock","  Put Grappling Eq in MainDock","  GrapplingEq Near Lighthouse","Put Guard Clothes in Airstrip",
	"  Put Guard Clothes in NorthDock","  Put Guard Clothes in MainDock","  in WatchTower NearCompound","Bolt Cutters in Airstrip","  Bolt Cutters in NorthDock",
	"  Bolt Cutters in MainDock","  Bolt Cutters in FarmArea","   Weapon Suppressor","Cutting Powder","Power Station","Supply Truck"}H4BS[0]="Put Grappling Eq in Airstrip"

local LootP={	"              HangerTop-       Table1>",				"       	                                Table2>",		"              HangerFloor-     Table1>",
		"       	                                Table2>",	"Airstrip WoodenShed-      Table1>",						"       	                                Table2>",
		"                Warehouse-     Table1>",				"       	                                Table3>",		"       	                                Table2>",
		"                Lockup-           Table1>",			"       	                                Table2>",		"NorthDock WoodShed-    Table1>",
		"       	                                Table2>",	"FarmLand TinShed-          Table1>",			"       	                                Table2>",	"InnerMainDock Shed-      Table1>",						"       	                                Table2>",		"                Shed2-            Table1>",
		"       	                                Table3>",	"       	                                Table2>",		"                Lockup-           Table1>",
		"       	                                Table2>",	"MainDock WoodenShed-  Table1>"}			LootP[0]="       	                                Table2>"	
	
local CHPT={"Ruby Necklace","Bearer Bonds","Pink Diamond"}CHPT[0]="Sinsimito Tequila"CHPT[5]="Panther Statue"CHPT[-1]="NotSet"
local ITR={"Airstrip","North Dock","besideMain Dock","Main Dock","Outside Compound "}ITR[0]="None"
local H4CL,H4IL,DisLv={"Gold","Cash"},{"Coke","Cash","Weed"},{"33%","66%","100%"}H4CL[0]="Empty"H4IL[0]="Empty" DisLv[0]="0%"
local CHW={"Aggressor","Conspirator","Crackshot","Saboteur","Marksman"}CHW[0]="NotSet"


local CHHE={}CHHE[1]="Selected" CHHE[2]="All 100%" CHHE[3]="Others 100%" CHHE[4]="Others 85%"
local MaX,H4C1, H4C2, H4C3, H4C4=nil,0, 0, 0, 0

local CPHsec=menu.add_submenu("Cayo Setup")
CPHsec:add_action("                       Go to Finale",function()
	H4Msn(0,true)H4Msn(1,true)for i=9,12 do H4Msn(i,true)end H4Gen(12,true)stats.set_int("MP"..mpx().."_H4CNF_WEAPONS", 1)
	stats.set_int("MP"..mpx().."_H4LOOT_GOLD_C_SCOPED",stats.get_int("MP"..mpx().."_H4LOOT_GOLD_C"))
	stats.set_int("MP"..mpx().."_H4LOOT_CASH_C_SCOPED",stats.get_int("MP"..mpx().."_H4LOOT_CASH_C"))
	stats.set_int("MP"..mpx().."_H4LOOT_PAINT_SCOPED",stats.get_int("MP"..mpx().."_H4LOOT_PAINT"))
end)

CPHsec:add_action("[!]           ---[[Set Hard Mode]]---", function()stats.set_int("MP"..mpx().."_H4_PROGRESS", 131055)end)

if TTL then TTL4l=7351544 TTL4h=7351544 TTL3h=7351542 else TTL4l=9439088 TTL4h=10470904 TTL3h=8059220 end
local Ccut, CHSh=1, {} CHSh[1]="Solo(100%)" CHSh[2]="2Players(50%)" CHSh[3]="2Players(15%)" CHSh[4]="3Players(35%)"
CHSh[5]="3Players(15%)" CHSh[6]="4Players(25%)" CHSh[7]="4Players(15%)" CHSh[8]="Revert Prices"
CPHsec:add_array_item("Maxfor(yourCut)>", CHSh, function() return Ccut end, function(SHT)
	stats.set_int("MP"..mpx().."_H4_PROGRESS", 131055)Ccut=SHT
	PTv=globals.get_int(CPTO+stats.get_int("MP"..mpx().."_H4CNF_TARGET"))*1.1
	if SHT==1 then CyPV=math.floor((2777726-PTv)/2) CyCV=math.floor((2777726-PTv)/4) CyGV=math.floor((2777726-PTv)/1.5)
	elseif SHT==2 then CyPV=math.floor((5675452-PTv)/4) CyCV=math.floor((5675452-PTv)/8) CyGV=math.floor((5675452-PTv)/3)
	elseif SHT==3 then CyPV=math.floor((3189088-PTv)/4) CyCV=math.floor((3189088-PTv)/8) CyGV=math.floor((3189088-PTv)/3)
	elseif SHT==4 then CyCV=math.floor((TTL3h-PTv)/12) CyPV=math.floor((TTL3h-PTv)/6) CyGV=math.floor((TTL3h-PTv)/4.5)
	elseif SHT==5 then CyCV=math.floor((6219390-PTv)/12) CyPV=math.floor((6219390-PTv)/6) CyGV=math.floor((6219390-PTv)/4.5)
	elseif SHT==6 then CyCV=math.floor((TTL4h-PTv)/16) CyPV=math.floor((TTL4h-PTv)/8) CyGV=math.floor((TTL4h-PTv)/6)
	elseif SHT==7 then CyCV=math.floor((TTL4l-PTv)/16) CyPV=math.floor((TTL4l-PTv)/8) CyGV=math.floor((TTL4l-PTv)/6)
	elseif SHT==8 then CyCV=91800 CyPV=191300 CyGV=330300 end
	RV=math.random(1,4) if RV==1 then G=79 P=40 C=160 elseif RV==2 then G=203 P=24 C=36	elseif RV==3 then G=143 P=80 C=80 else G=206 P=69 C=1 end
	stats.set_int("MP"..mpx().."_H4LOOT_CASH_C", C) stats.set_int("MP"..mpx().."_H4LOOT_GOLD_C", G)
	if P then stats.set_int("MP"..mpx().."_H4LOOT_PAINT", P)end--false error prevension
	if CyCV then stats.set_int("MP"..mpx().."_H4LOOT_CASH_V", CyCV)end
	stats.set_int("MP"..mpx().."_H4LOOT_PAINT_V", CyPV) stats.set_int("MP"..mpx().."_H4LOOT_GOLD_V", CyGV)
end)

CPHsec:add_action("---------------↓↓↓ Manual ↓↓↓---------------",function()end)
CPHsec:add_array_item("Primary Target>", CHPT, function() return stats.get_int("MP"..mpx().."_H4CNF_TARGET") end, function(CyT)
	if CyT then stats.set_int("MP"..mpx().."_H4CNF_TARGET", CyT) end
end)

CPHsec:add_array_item("*Choose Weapon>", CHW, function() return H4Weap() end, function(v)
	H4Weap(v)if H4Weap()>0 then H4Msn(12,true)else H4Msn(12,false)end
end)

CPHsec:add_toggle(H4Mis[0],function()return H4Msn(0)end,function()H4Msn(0,not H4Msn(0))if not H4Msn(0) then stats.set_int("MP"..mpx().."_H4_MISSIONS",0)end end)


APRVEH=CPHsec:add_submenu("*Approach Vehicles")
APRVEH:add_action("               __*Choose at least One__", function() end)
for i=1,6 do APRVEH:add_toggle(H4Mis[i],function()return H4Msn(i)end,function()
	H4Msn(i,not H4Msn(i))if i==2 or i==4 then if not H4Msn(2)and not H4Msn(4)then H4Msn(7,false)end end end)end
APRVEH:add_toggle(H4Mis[7],function()return H4Msn(7)end,function()H4Msn(7,not H4Msn(7))if H4Msn(7) and not H4Msn(2) and not H4Msn(4)then H4Msn(4,true)end end)


DSDIS=CPHsec:add_submenu("*Missions-Disruption-Weapon")
for i=8,11 do DSDIS:add_toggle(H4Mis[i],function()return H4Msn(i)end,function()H4Msn(i,not H4Msn(i))end)end

DSDIS:add_toggle(H4Mis[12],function()return H4Msn(12)end,function()
	H4Msn(12,not H4Msn(12)) if H4Msn(12) and stats.get_int("MP"..mpx().."_H4CNF_WEAPONS")==0 then stats.set_int("MP"..mpx().."_H4CNF_WEAPONS",1)
	elseif not H4Msn(12) and stats.get_int("MP"..mpx().."_H4CNF_WEAPONS")>0 then stats.set_int("MP"..mpx().."_H4CNF_WEAPONS",0) end
end)
DSDIS:add_array_item("   Choose Weapon>", CHW, function() return stats.get_int("MP"..mpx().."_H4CNF_WEAPONS") end, function(v)
	stats.set_int("MP"..mpx().."_H4CNF_WEAPONS", v)if v>0 and not H4Msn(12)then H4Msn(12,true)elseif v==0 and H4Msn(12)then H4Msn(12,false)end
end)
DSDIS:add_toggle(H4BS[12],function()return H4Gen(12)end,function()H4Gen(12,not H4Gen(12))end)

DSDIS:add_toggle(H4Mis[13],function()return H4Msn(13)end,function()H4Msn(13,not H4Msn(13))if not H4Msn(13)then stats.set_int("MP"..mpx().."_H4CNF_WEP_DISRP", 0)end end)
DSDIS:add_array_item("   Arms Destroyed>",DisLv,function()return stats.get_int("MP"..mpx().."_H4CNF_WEP_DISRP")end,function(v)
	stats.set_int("MP"..mpx().."_H4CNF_WEP_DISRP",v)if v>0 then H4Msn(13,true)end
end)

DSDIS:add_toggle(H4Mis[14],function()return H4Msn(14)end,function()H4Msn(14,not H4Msn(14))if not H4Msn(14)then stats.set_int("MP"..mpx().."_H4CNF_ARM_DISRP", 0)end end)
DSDIS:add_array_item("   Shipments Destroyed>",DisLv,function()return stats.get_int("MP"..mpx().."_H4CNF_ARM_DISRP") end,function(v)
	stats.set_int("MP"..mpx().."_H4CNF_ARM_DISRP",v)if v>0 then H4Msn(14,true)end
end)

DSDIS:add_toggle(H4Mis[15],function()return H4Msn(15)end,function()H4Msn(15,not H4Msn(15))if not H4Msn(15)then stats.set_int("MP"..mpx().."_H4CNF_HEL_DISRP", 0)end end)
DSDIS:add_array_item("   Helicopters Destroyed>",DisLv,function()return stats.get_int("MP"..mpx().."_H4CNF_HEL_DISRP")end,function(v)
	stats.set_int("MP"..mpx().."_H4CNF_HEL_DISRP",v)if v>0 then H4Msn(15,true)end
end)


POI=CPHsec:add_submenu("POI(SupplyTruck,BoltCutters,etc)")
for i=0,2 do POI:add_toggle(H4BS[i],function()return H4Gen(i)end,function()H4Gen(i,not H4Gen(i))end)end
POI:add_toggle(H4BS[3],function()return H4Gen(3)end,function()
	H4Gen(3,not H4Gen(3))if H4Gen(3)then v=5156 else v=0 end stats.set_int("MP"..mpx().."_H4CNF_GRAPPEL",v) end)
	
for i=4,7 do POI:add_toggle(H4BS[i],function()return H4Gen(i)end,function()H4Gen(i,not H4Gen(i))if not H4Gen(4)and not H4Gen(5)
	and not H4Gen(6)and not H4Gen(7)then v=5256 else v=0 end stats.set_int("MP"..mpx().."_H4CNF_UNIFORM",v)end)end
for i=8,11 do POI:add_toggle(H4BS[i],function()return H4Gen(i)end,function()H4Gen(i,not H4Gen(i))if not H4Gen(8)and not H4Gen(9)
	and not H4Gen(10)and not H4Gen(11)then v=4424 else v=0 end stats.set_int("MP"..mpx().."_H4CNF_BOLTCUT", v)end)end
for i=13,14 do POI:add_toggle(H4BS[i],function()return H4Gen(i)end,function()H4Gen(i,not H4Gen(i))end)end

POI:add_array_item("Supply Truck in", ITR, function() return stats.get_int("MP"..mpx().."_H4CNF_TROJAN") end, function(SpTr)
	if SpTr>0 then H4Gen(15,true)else sH4Gen(15,false)end stats.set_int("MP"..mpx().."_H4CNF_TROJAN", SpTr)
end)

CPHsec:add_action("ScopeOut POIs",function()stats.set_int("MP"..mpx().."_H4CNF_BS_GEN", 131071)end)



StLt=CPHsec:add_submenu("                -------Set Loot------")
StLt:add_action("---------↓↓↓ Inside Compound ↓↓↓---------",function()end)

StLt:add_array_item("Room1(North)  Table1>", H4CL, function()
if H4Gol(0)then return 1 elseif H4Cas(0)then return 2 else return 0 end end,function(v)
	if v==1 then H4Gol(0,true)H4Cas(0,false) elseif v==2 then H4Gol(0,false)H4Cas(0,true) else H4Gol(0,false)H4Cas(0,false) end
end)
StLt:add_array_item("                   Table2>", H4CL, function()
if H4Gol(1)then return 1 elseif H4Cas(1)then return 2 else return 0 end end,function(v)
	if v==1 then H4Gol(1,true)H4Cas(1,false) elseif v==2 then H4Gol(1,false)H4Cas(1,true) else H4Gol(1,false)H4Cas(1,false) end
end)
StLt:add_toggle("                   Painting>",function()return H4Pnt(0)end,function()H4Pnt(0,not H4Pnt(0))end)

StLt:add_array_item("Room2(Center)  Table1>", H4CL, function()
if H4Gol(2)then return 1 elseif H4Cas(2)then return 2 else return 0 end end,function(v)
	if v==1 then H4Gol(2,true)H4Cas(2,false) elseif v==2 then H4Gol(2,false)H4Cas(2,true) else H4Gol(2,false)H4Cas(2,false) end
end)
StLt:add_array_item("                   Table2>", H4CL, function()
if H4Gol(3)then return 1 elseif H4Cas(3)then return 2 else return 0 end end,function(v)
	if v==1 then H4Gol(3,true)H4Cas(3,false) elseif v==2 then H4Gol(3,false)H4Cas(3,true) else H4Gol(3,false)H4Cas(3,false) end
end)
StLt:add_toggle("                   Painting>",function() return H4Pnt(1) end,function()H4Pnt(1,not H4Pnt(1))end)

StLt:add_array_item("Room3(South)   Table1>", H4CL, function()
if H4Gol(4)then return 1 elseif H4Cas(4)then return 2 else return 0 end end,function(v)
	if v==1 then H4Gol(4,true)H4Cas(4,false) elseif v==2 then H4Gol(4,false)H4Cas(4,true) else H4Gol(4,false)H4Cas(4,false) end
end)
StLt:add_array_item("                   Table2>", H4CL, function()
if H4Gol(5)then return 1 elseif H4Cas(5)then return 2 else return 0 end end,function(v)
	if v==1 then H4Gol(5,true)H4Cas(5,false) elseif v==2 then H4Gol(5,false)H4Cas(5,true) else H4Gol(5,false)H4Cas(5,false) end
end)
StLt:add_toggle("                   Painting>",function() return H4Pnt(2) end,function()H4Pnt(2,not H4Pnt(2))end)

StLt:add_array_item("Basement           Table1>", H4CL, function()
if H4Gol(6)then return 1 elseif H4Cas(6)then return 2 else return 0 end end,function(v)
	if v==1 then H4Gol(6,true)H4Cas(6,false) elseif v==2 then H4Gol(6,false)H4Cas(6,true) else H4Gol(6,false)H4Cas(6,false) end
end)
StLt:add_array_item("                   Table2>", H4CL, function()
if H4Gol(7)then return 1 elseif H4Cas(7)then return 2 else return 0 end end,function(v)
	if v==1 then H4Gol(7,true)H4Cas(7,false) elseif v==2 then H4Gol(7,false)H4Cas(7,true) else H4Gol(7,false)H4Cas(7,false) end
end)
StLt:add_toggle("                   Painting1>",function() return H4Pnt(5) end,function()H4Pnt(5,not H4Pnt(5))end)
StLt:add_toggle("                   Painting2>",function() return H4Pnt(6) end,function()H4Pnt(6,not H4Pnt(6))end)

StLt:add_toggle("Rubio's Office-       Painting1>",function() return H4Pnt(3) end,function()H4Pnt(3,not H4Pnt(3))end)
StLt:add_toggle("                            Painting2>",function() return H4Pnt(4) end,function()H4Pnt(4,not H4Pnt(4))end)

StLt:add_action("-------↓↓↓ Outside of Compound ↓↓↓-------",function()end)

for i=23,0,-1 do
	StLt:add_array_item(LootP[i],H4IL,function()
	if H4Cok(i)then return 1 elseif H4Cas2(i)then return 2 elseif H4Wee(i)then return 3 else return 0 end end,function(v)
		if v==1 then H4Cok(i,true)elseif v==2 then H4Cas2(i,true)elseif v==3 then H4Wee(i,true)else H4Cok(i,false)H4Cas2(i,false)H4Wee(i,false)end
	end)
end



local cayocut_menu=nil

local function CUT()
	cayocut_menu:clear()for i=0,3 do if player.get_player_ped(i)==localplayer then freem=false else freem=true end end
	if globals.get_int(CPCO+1)<1000 and globals.get_int(CPCO+1)>-1 then
		if globals.get_int(CPCO+1)>=15 then if player.get_player_ped(0)==localplayer or freem then P1="You" else P1=player.get_player_name(0) end
		if globals.get_int(CPCO+2)>=15 then if player.get_player_ped(1)==localplayer then P2="You" else P2=player.get_player_name(1) end
		if globals.get_int(CPCO+3)>=15 then if player.get_player_ped(2)==localplayer then P3="You" else P3=player.get_player_name(2) end
		if globals.get_int(CPCO+4)>=15 then if player.get_player_ped(3)==localplayer then P4="You" else P4=player.get_player_name(3) end
		end end end end
		if P1 then cayocut_menu:add_array_item("Player1>"..P1, CtPerc, function() return math.floor(globals.get_int(CPCO+1)/5-1) end, function(p) H4C1=(p+1)*5 end) end
		if P2 then cayocut_menu:add_array_item("Player2>"..P2, CtPerc, function() return math.floor(globals.get_int(CPCO+2)/5-1) end, function(p) H4C2=(p+1)*5 end) end
		if P3 then cayocut_menu:add_array_item("Player3"..P3, CtPerc, function() return math.floor(globals.get_int(CPCO+3)/5-1) end, function(p) H4C3=(p+1)*5 end) end
		if P4 then cayocut_menu:add_array_item("Player4"..P4, CtPerc, function() return math.floor(globals.get_int(CPCO+4)/5-1) end, function(p) H4C4=(p+1)*5 end) end
		if P1 then cayocut_menu:add_array_item("          <Set>>>>>", CHHE, function() return 1 end, function(CyC)
			if CyC==2 then H4C1, H4C2, H4C3, H4C4=100, 100, 100, 100 elseif CyC==3 then H4C1=15 H4C2, H4C3, H4C4=100, 100, 100
			elseif CyC==4 then H4C1=15 H4C2, H4C3, H4C4=85, 85, 85 end MaX=math.max(H4C1, H4C2, H4C3, H4C4)
			if H4C1>=15 then globals.set_int(CPCO+1, H4C1) end if globals.get_int(CPCO+2)==nil then return end
			if globals.get_int(CPCO+2)>=15 and H4C2>=15 then globals.set_int(CPCO+2, H4C2) end if globals.get_int(CPCO+3)==nil then return end
			if globals.get_int(CPCO+3)>=15 and H4C3>=15 then globals.set_int(CPCO+3, H4C3) end if globals.get_int(CPCO+4)==nil then return end
			if globals.get_int(CPCO+4)>=15 and H4C4>=15 then globals.set_int(CPCO+4, H4C4) end end)
		end

--[[local percM={"Detect"} percM[-1]="0%" for i=2,39 do percM[i]=((i+1)*5).."%" end
		cayocut_menu:add_array_item("Get autoTake%(if not <set>)", percM, function()
			if not CMaX then return 1 else return math.floor(CMaX/5-1) end end, function(cut)
				if cut>=2 then CMaX=(cut+1)*5 else
				CMaX=math.max(globals.get_int(CPCO+4), globals.get_int(CPCO+3), globals.get_int(CPCO+2), globals.get_int(CPCO+1))
		end end)]]--
		
	end
end


cayocut_menu=menu.add_submenu("    Cayo Cut",CUT)


local cayoplay_menu=menu.add_submenu("        Cayo Heist")

cayoplay_menu:add_action("Cut Sewer Fence", function() if HS0():is_active() and HS0():get_int(HS0SF)>=3 and HS0():get_int(HS0SF)<6 then HS0():set_int(HS0SF, 6) end end)
cayoplay_menu:add_action("Clone Fingerprint", function() if HS0():is_active() and HS0():get_int(HS0CF)>=2 and HS0():get_int(HS0CF)<10 then HS0():set_int(HS0CF, 5) end end)
cayoplay_menu:add_action("CutGlass", function() if HS0():is_active() and HS0():get_float(HS0CG)>0.00 and HS0():get_float(HS0CG)<100 then HS0():set_float(HS0CG, 100) end end)
cayoplay_menu:add_action("Voltlab(last math)", function() if HS0():is_active() and HS0():get_int(HS0VT)>=0 then HS0():set_int(HS0VT, HS0():get_int(HS0VC)) end end)

local LPos,peV,tke,tar=nil,nil,0,nil
local function IsNPC(ped) if ped==nil or ped:get_pedtype()<4 then return false else return true end end
local POS={} POS[1]="SwimmingPool(IN)" POS[2]="CompoundFront(OUT)"
cayoplay_menu:add_array_item("Drop NPCs to ", POS, function() if LPos then return LPos else return 1 end end, function(ps)
LPos=ps if ps==1 then Vec=vector3(5055.69,-5765.96,13.67)ad=50 else Vec=vector3(4887.51,-5664.50,171.91)ad=0 end
	for ped in replayinterface.get_peds()do if IsNPC(ped)then if ped:is_in_vehicle()then ped:set_config_flag(62,false)sleep(0.08)ped:set_config_flag(62,true)else
		ped:set_rotation(vector3(58.04, 0, 0)) ped:set_position(Vec) ped:set_armour(0) sleep(0.01)
			if ped:get_position()==Vec then ped:set_position(vector3(Vec.x,Vec.y,Vec.z+ad))ped:set_config_flag(60,false)end end end
	end
end)
cayoplay_menu:add_action("Kill all NPCs", function() menu.kill_all_npcs() end)
cayoplay_menu:add_action("Get Pickups", function() for pickup in replayinterface.get_pickups() do pickup:set_position(localplayer:get_position()) end end)
cayoplay_menu:add_array_item("Ped Vehicles", { "Stop", "Fix" }, function() if peV then return peV else return 1 end end, function(pe)
	peV=pe if pe==2 then for veh in replayinterface.get_vehicles() do if veh:get_acceleration()==0 then veh:set_acceleration(0.34) end end
	else for veh in replayinterface.get_vehicles() do if localplayer:get_current_vehicle()~=veh then veh:set_acceleration(0) end end end
end)
pai=-1
cayoplay_menu:add_int_range("Replace nearest vehicle|PaintJob>",1,-1,120,function()return pai end,function(n)pai=n
	V=localplayer:get_nearest_vehicle()if not V or localplayer:is_in_vehicle()then return end CrVh(V:get_model_hash(),V:get_position(),0,n)
end)

cayoplay_menu:add_action("                       Modify Loot", function() end)
cayoplay_menu:add_int_range("Cayo Bag Cap.>",500.0,1800,10000, function()if localplayer then return globals.get_int(CBgC)end end, function(value) globals.set_int(CBgC, value) end)

cayoplay_menu:add_array_item("Detected Target>", CHPT, function() if tar then return tar end return stats.get_int("MP"..mpx().."_H4CNF_TARGET") end, function(CyT)
	tar=CyT
end)

cayoplay_menu:add_int_range("Target Price>", 100000, 100000, 2100000, function()if localplayer then return globals.get_int(CPTO+stats.get_int("MP"..mpx().."_H4CNF_TARGET"))end end, function(PTv)
	globals.set_int(CPTO+stats.get_int("MP"..mpx().."_H4CNF_TARGET"), PTv)
end)
cayoplay_menu:add_int_range("Secondary Take>", 100000, 900000, 6662960, function() if HS0():is_active() then return HS0():get_int(HS0ST) else return 0 end end, function(RTk)
	if HS0():is_active() then HS0():set_int(HS0ST, RTk) end
end)
cayoplay_menu:add_array_item("AutoMaxTake(mode)", { "Safe(Hard)", "Max(Hard)", "Safe(Easy)", "Max(Easy)" }, function()
return 1 end, function(sf) if HS0():is_active() then
	if sf==1 or sf==3 then plmx=2444398.88 else plmx=2550000 end if sf==3 or sf==4 then Mult=1 else Mult=1.1 end
	if globals.get_int(CPCO+1)>=15 and globals.get_int(CPCO+1)<=200 then
		MaX=math.max(globals.get_int(CPCO+4), globals.get_int(CPCO+3), globals.get_int(CPCO+2), globals.get_int(CPCO+1)) end
	if not MaX then return end tke=math.floor(plmx*100/MaX*113.63/100) if TTL then if tke>=7351544 then tke=7351544 end end
	if not tar or tar==-1 then tar=stats.get_int("MP"..mpx().."_H4CNF_TARGET") end
	if tke>=1900000 then globals.set_int(CPTO+tar, 1900000) HS0():set_int(HS0ST, math.floor(tke-1900000*Mult))
	else globals.set_int(CPTO+tar, math.floor(tke/2)) HS0():set_int(HS0ST, math.floor(tke-(tke/2)*Mult))
	end end
end)

cayoplay_menu:add_action("                       Spawn Vehicle", function() end)
cayoplay_menu:add_action("Winky", function() CrVh(joaat("winky"),vector3(4965.86,-5719.61,18.34),0) end)
cayoplay_menu:add_action("Manchez Scout", function() CrVh(joaat("manchez2"),vector3(4965.24,-5723.78,18.38),0) end)
cayoplay_menu:add_action("Valkyrie(MainDockHelipad)", function() CrVh(joaat("valkyrie2"),vector3(4882.62,-5282.87,8.13),0) end)

local TP2LooT=cayoplay_menu:add_submenu("  _____________Teleport to loot_____________")

TP2LooT:add_action("TP-Cayo Below Office", function() TP2(vector3(5002.835938,-5745.856934,18.580250), vector3(2.360836,0,0))end)
TP2LooT:add_action("TP-Cayo Room1", function() TP2(vector3(5078.780273,-5758.335449,14.529647), vector3(2.856643,0,0))end)
TP2LooT:add_action("TP-Cayo Room2", function() TP2(vector3(5027.184082,-5733.711426,16.565582), vector3(1.164920,0,0))end)
TP2LooT:add_action("TP-Cayo Room3", function() TP2(vector3(5009.367676,-5790.344727,16.531700), vector3(-2.891438,0,0))end)
TP2LooT:add_action("TP-Cayo UGRoom IN", function() TP2(vector3(5001.265625,-5747.136230,13.540489), vector3(2.603355,0,0))end)

TP2LooT:add_action("                  Outside of Compound", function() end)
TP2LooT:add_action("TP-FarmLand", function() TP2(vector3(5330.995605,-5269.349609,31.885937), vector3(2.326673,0,0)) end)
TP2LooT:add_action("TP-MainDock1", function() TP2(vector3(4922.276855,-5240.867676,1.223460), vector3(-2.543614,0,0)) end)
TP2LooT:add_action("TP-MainDock2", function() TP2(vector3(4999.680664,-5165.188477,1.464381), vector3(-0.834566,0,0)) end)
TP2LooT:add_action("TP-MainDock3", function() TP2(vector3(4961.548828,-5108.381836,1.682062), vector3(-1.170775,0,0)) end)
TP2LooT:add_action("TP-MainDock4", function() TP2(vector3(5193.768066,-5134.060059,2.046071), vector3(-2.121594,0,0)) end)
TP2LooT:add_action("TP-NorthDock1", function() TP2(vector3(5090.226074,-4683.037598,1.107162), vector3(-1.704092,0,0)) end)
TP2LooT:add_action("TP-NorthDock2", function() TP2(vector3(5133.788086,-4613.124512, 1.239483), vector3(2.694417,0,0)) end)
TP2LooT:add_action("TP-NorthDock3", function() TP2(vector3(5065.334961,-4593.392090, 1.554311), vector3(0.143540,0,0)) end)
TP2LooT:add_action("TP-Airstrip1", function() TP2(vector3(4503.551270,-4552.833496, 2.867439), vector3(-2.928557,0,0)) end)
TP2LooT:add_action("TP-Airstrip2", function() TP2(vector3(4438.547852,-4448.449219, 3.028436), vector3(0.956232,0,0)) end)
TP2LooT:add_action("TP-Airstrip3", function() TP2(vector3(4445.028320,-4444.031738, 5.936793), vector3(-1.704661,0,0)) end)