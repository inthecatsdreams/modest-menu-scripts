local function DrugWarsVehiclesUnlocks_Toundra_Panthere_L7NEG()
    for i = 33968, 33968, 1 do
        globals.set_int(262145 + i, 1)
        sleep(2)
    end
end

local function DrugWarsVehiclesUnlocks_Classique_Broadway_L7NEG()
    for i = 33967, 33967, 1 do
        globals.set_int(262145 + i, 1)
        sleep(2)
    end
end
 
local function DrugWarsVehiclesUnlocks_Karin_Boor_L7NEG()
    for i = 33972, 33972, 1 do
        globals.set_int(262145 + i, 1)
        sleep(2)
    end
end

local function DrugWarsVehiclesUnlocks_MTL_Brickade_6x6_L7NEG()
    for i = 32695, 32695, 1 do
        globals.set_int(262145 + i, 1)
        sleep(2)
    end
end

local function DrugWarsVehiclesUnlocks_Willard_Eudora_L7NEG()
    for i = 33971, 33971, 1 do
        globals.set_int(262145 + i, 1)
        sleep(2)
    end
end

local function DrugWarsVehiclesUnlocks_Karin_Hotring_Everon_L7NEG()
    for i = 33969, 33969, 1 do
        globals.set_int(262145 + i, 1)
        sleep(2)
    end
end
 
local function DrugWarsVehiclesUnlocks_Weeny_Issi_Rally_L7NEG()
    for i = 33966, 33966, 1 do
        globals.set_int(262145 + i, 1)
        sleep(2)
    end
end

local function DrugWarsVehiclesUnlocks_Maibatsu_Manchez_Scout_C_L7NEG()
    for i = 33962, 33962, 1 do
        globals.set_int(262145 + i, 1)
        sleep(2)
    end
end

local function DrugWarsVehiclesUnlocks_Annis_300R_L7NEG()
    for i = 33961, 33961, 1 do
        globals.set_int(262145 + i, 1)
        sleep(2)
    end
end
 
local function DrugWarsVehiclesUnlocks_Ocelot_Virtue_L7NEG()
    for i = 33970, 33970, 1 do
        globals.set_int(262145 + i, 1)
        sleep(2)
    end
end

local function DrugWarsVehiclesUnlocks_Vapid_Taxi_L7NEG()
    for i = 33963, 33963, 1 do
        globals.set_int(262145 + i, 1)
        sleep(2)
    end
end

local function DrugWarsUnlockClothes_L7NEG()
    for i = 33973, 34112, 1 do
        globals.set_int(262145 + i, 1)
        sleep(2)
    end
end

local function GunVan_L7NEG()
    for i = 33799, 33799, 1 do
        globals.set_int(262145 + i, 1)
        sleep(2)
    end
end

local function UnlockTaxiJob_L7NEG()
    for i = 33770, 33770, 1 do
        globals.set_int(262145 + i, 1)
        sleep(2)
    end
end

local function StreetDealer_L7NEG()
    for i = 34062, 34062, 1 do
        globals.set_int(262145 + i, 1)
        sleep(2)
    end
end

local function unlockBLVDGarage_L7NEG()
    for i = 32702, 32702, 1 do
        globals.set_int(262145 + i, 1)
        sleep(2)
    end
end

local function UnlockExit_L7NEG()
    for i = 32688, 32688, 1 do
        globals.set_int(262145 + i, 0)
        sleep(2)
    end
end

L7NEG = menu.add_submenu("Ultimate Recovery 1.64 by L7NEG")

local function Text(text)
	L7NEG:add_action(text,  function() end)
end

Text("*************************************************************")
Text("*           ** Ultimate Recovery 1.64 **                    *")
Text("               **✅ Made By L7NEG ✅**                      ")
Text("               **✅      V2       ✅**                      ")
Text("*************************************************************")

L7NEG3 = L7NEG:add_submenu("Unlocker")

L7NEG4 = L7NEG:add_submenu("Eclipse BLVD Garage Unlocker")

L7NEG5 = L7NEG:add_submenu("Dax Missions")

-- don't sell over this amount in total, or the sell will fail.
local MaxSellAmount = 8000000;

-- prices for each nightclub good  (from the game - you can't change these)
local crgoGunsPrice = 5000;    -- Sporting Goods             $5,000
local crgoCokePrice = 27000;   -- South American Imports     $27,000
local crgoMethPrice = 11475;   -- Pharmaceutical Research    $11,475
local crgoWeedPrice = 2025;    -- Organic Produce            $2,025
local crgoDocsPrice = 1350;    -- Printing & Copying         $1,350 // this was set to 11350 in v0.5b2
local crgoCashPrice = 4725;    -- Cash Creation              $4,725
local crgoShipPrice = 10000;   -- Cargo & Shipments          $10,000

local crgoBikerPrice = 35000;  -- Biker Cargo sell price     $30,000

-- create some script handles
local scrNightclub = script("am_mp_nightclub")
local scrWarehouse = script("am_mp_warehouse")
local scrSellContraband = script("gb_contraband_sell")
local scrSellBikerContraband = script("gb_biker_contraband_sell")
local scrBikerWarehouse = script("am_mp_biker_warehouse")
local scrBunker = script("am_mp_bunker")
local scrBunkerBusiness = script("appBunkerBusiness")
local scrGunrunning = script("gb_gunrunning")
local scrBuyContraband = script("gb_contraband_buy")
local scrSecuroServ = script("appsecuroserv")

-- get the right variable prefix
if stats.get_int("MPPLY_LAST_MP_CHAR") == 0 then
  mpx = "MP0_"
else
  mpx = "MP1_"
end

local function funcSimpMgr(isRunning)
  -- zero out some counters
  local hasGuns = 0;
  local hasCoke = 0;
  local hasMeth = 0;
  local hasWeed = 0;
  local hasDocs = 0;
  local hasCash = 0;
  local hasShip = 0;
  local numCargoGuns = 0;
  local numCargoCoke = 0;
  local numCargoMeth = 0;
  local numCargoWeed = 0;
  local numCargoDocs = 0;
  local numCargoCash = 0;
  local numCargoShip = 0;

  while isRunning == true do
    stats.set_int(mpx .. "CLUB_POPULARITY", 1000)
    local numLifetimeSales = stats.get_int(mpx .. "LIFETIME_SELL_COMPLETE")
    local bunkerProdTotal = stats.get_int(mpx .. "prodtotalforfactory5")
    local bikerProdTotal = stats.get_int(mpx .. "prodtotalforfactory1")
    if scrBunker:is_active() then
      local numCargoUnits
      if bunkerProdTotal <= 0 then
        numCargoUnits = 1
      else
        if numLifetimeSales < 3 then
          numCargoUnits = math.floor(7500 / bunkerProdTotal)
        else
          numCargoUnits = math.floor(MaxSellAmount / bunkerProdTotal)
        end
      end
        globals.set_int(283677, 0)
        globals.set_int(283693, 0)
        globals.set_int(283678, 0)
        globals.set_int(283679, 0)
        globals.set_int(283694, 0)
        globals.set_int(283695, 0)
        globals.set_int(283702, 10)
        menu.trigger_bunker_production()
        sleep(1)
        globals.set_int(283682, numCargoUnits)
    end
    if scrGunrunning:is_active() then
      sleep(5)
      scrGunrunning:set_int(1205, 15)
      sleep(1)
      scrGunrunning:set_int(1979, 0)
    end
    if scrBikerWarehouse:is_active() then
      globals.set_int(281098, 10)
      local maxCargoUnits = math.floor(MaxSellAmount / bikerProdTotal)
      local numCargoUnits = math.floor(maxCargoUnits / crgoBikerPrice)
      globals.set_float(281211, numCargoUnits)
      menu.trigger_mc_production()
      sleep(1)
      if scrSellBikerContraband:is_active() then end
    end
    if scrWarehouse:is_active() then
      if not scrBunkerBusiness:is_active() then
        if numLifetimeSales > 3 then
          if bool50kCargo then
            globals.set_int(277933, 5500000)
          else
            globals.set_int(277933, 5500000)
          end
        else
          globals.set_int(277933, 5500000)
        end
        globals.set_int(277698, 0)
        globals.set_int(277699, 0)
        if scrSecuroServ:is_active() then
          scrSecuroServ:set_int(736, 1)
          sleep(0.5)
          scrSecuroServ:set_int(737, 1)
          sleep(0.5)
          scrSecuroServ:set_int(555, 3012)
        end
        if scrSellContraband:is_active() then
          scrSellContraband:set_int(1135, 1)
          scrSellContraband:set_int(595, 0)
          scrSellContraband:set_int(1124, 0)
          scrSellContraband:set_int(547, 7)
          sleep(1)
          scrSellContraband:set_int(541, 99999)
        end
      end
    end
    if scrBuyContraband:is_active() then
        sleep(1)
        scrBuyContraband:set_int(603, 1)
        scrBuyContraband:set_int(599, 111)
        scrBuyContraband:set_int(789, 6)
        scrBuyContraband:set_int(790, 4)
    end
    if scrNightclub:is_active() then
      globals.set_int(286592, 0)
      globals.set_int(286634, 0)
      globals.set_int(286635, 0)
      local crgoGunsCount = stats.get_int(mpx .. "HUB_PROD_TOTAL_1")
      local crgoCokeCount = stats.get_int(mpx .. "HUB_PROD_TOTAL_2")
      local crgoMethCount = stats.get_int(mpx .. "HUB_PROD_TOTAL_3")
      local crgoWeedCount = stats.get_int(mpx .. "HUB_PROD_TOTAL_4")
      local crgoDocsCount = stats.get_int(mpx .. "HUB_PROD_TOTAL_5")
      local crgoCashCount = stats.get_int(mpx .. "HUB_PROD_TOTAL_6")
      local crgoShipCount = stats.get_int(mpx .. "HUB_PROD_TOTAL_0")
      if crgoGunsCount > 0 then hasGuns = 1 end
      if crgoCokeCount > 0 then hasCoke = 1 end
      if crgoMethCount > 0 then hasMeth = 1 end
      if crgoWeedCount > 0 then hasWeed = 1 end
      if crgoDocsCount > 0 then hasDocs = 1 end
      if crgoCashCount > 0 then hasCash = 1 end
      if crgoShipCount > 0 then hasShip = 1 end
      if crgoMethCount < 2 then   -- not sure why he breaks on meth?
        menu.trigger_nightclub_production()
      else
        local crgoGunsValue = math.floor(crgoGunsPrice * crgoGunsCount)
        local crgoCokeValue = math.floor(crgoCokePrice * crgoCokeCount)
        local crgoMethValue = math.floor(crgoMethPrice * crgoMethCount)
        local crgoWeedValue = math.floor(crgoWeedPrice * crgoWeedCount)
        local crgoDocsValue = math.floor(crgoDocsPrice * crgoDocsCount)
        local crgoCashValue = math.floor(crgoCashPrice * crgoCashCount)
        local crgoShipValue = math.floor(crgoShipPrice * crgoShipCount)
        local crgoTotalValue = math.floor(crgoGunsValue + crgoCokeValue + crgoMethValue + crgoWeedValue + crgoDocsValue + crgoCashValue + crgoShipValue)
        local countCategories = math.floor(hasGuns + hasCoke + hasMeth + hasWeed + hasDocs + hasCash + hasShip)
        local avgMaxCatAmt = math.floor(MaxSellAmount / countCategories)
        if crgoGunsValue == 0 then
          numCargoGuns = 1
        else
          numCargoGuns = math.floor(avgMaxCatAmt / crgoGunsValue)
        end
        if crgoCokeValue == 0 then
          numCargoCoke = 1
        else
          numCargoCoke = math.floor(avgMaxCatAmt / crgoCokeValue)
        end
        if crgoMethValue == 0 then
          numCargoMeth = 1
        else
          numCargoMeth = math.floor(avgMaxCatAmt / crgoMethValue)
        end
        if crgoWeedValue == 0 then
          numCargoWeed = 1
        else
          numCargoWeed = math.floor(avgMaxCatAmt / crgoWeedValue)
        end
        if crgoDocsValue == 0 then
          numCargoDocs = 1
        else
          numCargoDocs = math.floor(avgMaxCatAmt / crgoDocsValue)
        end
        if crgoCashValue == 0 then
          numCargoCash = 1
        else
          numCargoCash = math.floor(avgMaxCatAmt / crgoCashValue)
        end
        if crgoShipValue == 0 then
          numCargoShip = 1
        else
          numCargoShip = math.floor(avgMaxCatAmt / crgoShipValue)
        end
        globals.set_int(286526, math.floor(crgoGunsPrice * numCargoGuns))
        globals.set_int(286527, math.floor(crgoCokePrice * numCargoCoke))
        globals.set_int(286528, math.floor(crgoMethPrice * numCargoMeth))
        globals.set_int(286529, math.floor(crgoWeedPrice * numCargoWeed))
        globals.set_int(286530, math.floor(crgoDocsPrice * numCargoDocs))
        globals.set_int(286531, math.floor(crgoCashPrice * numCargoCash))
        globals.set_int(286532, math.floor(crgoShipPrice * numCargoShip))
      end
    end
  end
end

local L7NEG7 = L7NEG:add_submenu("Ultimate Money Manager 5.5Mil")
L7NEG7:add_toggle("Start Ultimate Money Manager",
  function()
    return boolNightclubManager
  end,
  function()
    boolNightclubManager = not boolNightclubManager;
    funcSimpMgr(boolNightclubManager)
  end
)

L7NEG3:add_action(
    "Unlock 1.64 Clothes",
    function()
        DrugWarsUnlockClothes_L7NEG()
    end
)

L7NEG3:add_action(
    "Unlock 1.64 Unreleased Vehicles",
    function()
        DrugWarsVehiclesUnlocks_Toundra_Panthere_L7NEG()
        DrugWarsVehiclesUnlocks_Classique_Broadway_L7NEG()
        DrugWarsVehiclesUnlocks_Karin_Boor_L7NEG()
        DrugWarsVehiclesUnlocks_MTL_Brickade_6x6_L7NEG()
        DrugWarsVehiclesUnlocks_Willard_Eudora_L7NEG()
        DrugWarsVehiclesUnlocks_Karin_Hotring_Everon_L7NEG()
        DrugWarsVehiclesUnlocks_Weeny_Issi_Rally_L7NEG()
        DrugWarsVehiclesUnlocks_Maibatsu_Manchez_Scout_C_L7NEG()
        DrugWarsVehiclesUnlocks_Annis_300R_L7NEG()
        DrugWarsVehiclesUnlocks_Ocelot_Virtue_L7NEG()
        DrugWarsVehiclesUnlocks_Vapid_Taxi_L7NEG()
    end
)

L7NEG3:add_action(
    "Unlock Gun Van",
    function()
        GunVan_L7NEG()
    end
)

L7NEG3:add_action(
    "Unlock Taxi Job",
    function()
        UnlockTaxiJob_L7NEG()
    end
)

L7NEG3:add_action(
    "Unlock StreetDealer",
    function()
        StreetDealer_L7NEG()
    end
)

L7NEG3:add_action("Unlock Gooch Event (Mask)", function()
    globals.set_int(2756261, 171)
    globals.set_int(2756259, 6)
end)

L7NEG4:add_action(
     "Unlock Eclipse BLVD Garage (50 car)",
     function()
         unlockBLVDGarage_L7NEG()
     end
)

L7NEG6 = L7NEG3:add_submenu("LSCM Unlocker")

L7NEG6:add_action("LSCM Prize Ride Unlock", function() stats.set_bool(mpx .. "CARMEET_PV_CHLLGE_CMPLT", true) end)

L7NEG6:add_action("Unlock All Rep Lvl 1000", function() for i = 293761, 293788 do globals.set_float(i, 100000) end end)

L7NEG6N = L7NEG6:add_submenu("Read Me")

L7NEG5:add_action("Remove Dax Missions CoolDown ", function()
	function mpx()return stats.get_int("MPPLY_LAST_MP_CHAR")end 
	        stats.set_int("MP"..mpx().."_XM22JUGGALOWORKCDTIMER", -1) 
end)

L7NEG4:add_action(
     "Unlock Exit (important)",
     function()
         UnlockExit_L7NEG()
     end
)

L7NEG5 = L7NEG4:add_submenu("Tutorial ReadMe Important")

L7NEG5:add_action("First Activate The Unlock BLVD Garage", function() end)

L7NEG5:add_action("Then Go To Dynasty8 Website And Buy It", function() end)

L7NEG5:add_action("For 2740000$", function() end)

L7NEG5:add_action("And Finally Activate The Unlock exit", function() end)

L7NEG5:add_action("Option so you can drive/walk in", function() end)

L7NEG5:add_action("Note That If U Change Server", function() end)

L7NEG5:add_action("Then You Need To", function() end)

L7NEG5:add_action("Activate The Unlock exit", function() end)

L7NEG5:add_action("Again And Thats Bcuz Rockstar Hasnot", function() end)

L7NEG5:add_action("Released It", function() end)

L7NEG5:add_action("Yet Dont Worry I Tested It And It Is", function() end)

L7NEG5:add_action("Full Safe", function() end)

L7NEG5:add_action("Enjoy", function() end)

L7NEG5:add_action("https://dsc.gg/l7neg-", function() end)

L7NEG1 = L7NEG:add_submenu("Credits ReadMe")

L7NEG1:add_action("L7NEG For Building This OP Script", function() end)

L7NEG1:add_action("Discord Server For Any Help", function() end)

L7NEG1:add_action("https://dsc.gg/l7neg-", function() end)

L7NEG1:add_action("My Telegram Account", function() end)

L7NEG1:add_action("https://t.me/L7NEG", function() end)

L7NEG1:add_action("Telegram Channel", function() end)

L7NEG1:add_action("htts://t.me/YPFFFF", function() end)

L7NEG1:add_action("Kiddions For ModestMenu", function() end)

L7NEG1:add_action("And Again Thanks UnkownCheats.me", function() end)

L7NEG1:add_action("Community For The 1.64 Globals", function() end)

L7NEG1:add_action("Warning", function() end)

L7NEG1:add_action("These Accounts Above Are", function() end)

L7NEG1:add_action("The Only Official Besides", function() end)

L7NEG1:add_action("That It Is Fake C/P", function() end)

L7NEG1:add_action("And Special Thanks To", function() end)

L7NEG1:add_action("You For Using My Script", function() end)

L7NEG1:add_action("And MerryChristmass", function() end)

L7NEG1:add_action("Love You All", function() end)

L7NEG1:add_action("More Updates Will Be", function() end)

L7NEG1:add_action("Up Soon", function() end)

L7NEG6N:add_action("Buy A Membership, Activate, Sit in", function() end)

L7NEG6N:add_action("A Test Car And Go To The Track", function() end)

L7NEG6N:add_action("", function() end)

L7NEG6N:add_action("Then Activate", function() end)

L7NEG6N:add_action("And Buy Something In The LSCM Store", function() end)

L7NEG6N:add_action("", function() end)

L7NEG6N:add_action("Then Change Session To Apply Lvl 1000", function() end)

L7NEG6N:add_action("If You've Used LS Tuner Awards Unlock", function() end)

L7NEG6N:add_action("Before, All Unlocks Will Be Temporary Only", function() end)

L7NEG6N:add_action("Only", function() end)


L7NEG9 = L7NEG7:add_submenu("Auto Get Cargo Crates")


 local function Text(text)
	L7NEG9 :add_action(text,  function() end)
end
Text("__________________________________")
Text("!!! Cancel method Exit the menu !!!")
Text("__________________________________")


 local function Text(text)
	menu.add_action(text, function() end)
end

val = false
local function Replay()
	while val == true do
		stats.set_bool_masked("MP0_FIXERPSTAT_BOOL1",true, 12) -- Credits to L7NEG
	end
end
L7NEG9:add_toggle("Auto Crates", function() return val end, function() val = not val Replay(val) end)


L7NEG8 = L7NEG7:add_submenu("WareHouse Data Editor")

L7NEG8:add_action("--------------Warehouse Profile Editor--------------", function() end)
L7NEG8:add_int_range("Change Lifetime Sales", 1, 0, 10000, function()
PlayerIndex = globals.get_int(1574918)
	if PlayerIndex == 0 then
		mpx = "MP0_"
	else
		mpx = "MP1_"
	end
                                       return 
            stats.get_int(mpx.."LIFETIME_SELL_COMPLETE") end,
	   function(value) 
                           stats.set_int(mpx.."LIFETIME_BUY_COMPLETE", value) 
                           stats.set_int(mpx.."LIFETIME_BUY_UNDERTAKEN", value) 
                           stats.set_int(mpx.."LIFETIME_SELL_COMPLETE", value) 
                           stats.set_int(mpx.."LIFETIME_SELL_UNDERTAKEN", value)

 end)

L7NEG8:add_int_range("Change Lifetime Earnings Made", 200000.0, 0, 10000000, function()
PlayerIndex = globals.get_int(1574918)
	if PlayerIndex == 0 then
		mpx = "MP0_"
	else
		mpx = "MP1_"
	end
                                       return 
   stats.get_int(mpx.."LIFETIME_CONTRA_EARNINGS") end,           
	   function(value) 
stats.set_int(mpx.."LIFETIME_CONTRA_EARNINGS", value * 1)
 end)


L7NEG7N = L7NEG7:add_submenu("Tutorial ReadMe")

L7NEG7N:add_action("     Ceo Crates Method       ", function() end)
L7NEG7N:add_action("   First Enter Your Warehouse   ", function() end)
L7NEG7N:add_action("Next Start Ultimate Money Manager       ", function() end)
L7NEG7N:add_action("     Finally Active The Auto Sell Afk       ", function() end)
L7NEG7N:add_action("", function() end)
L7NEG7N:add_action("     Bunker Method & Other       ", function() end)
L7NEG7N:add_action("https://www.youtu.be/z7oEdc5UIMA&t", function() end)
L7NEG7N:add_action("https://youtu.be/GjGUpIjKOno", function() end)
L7NEG7N:add_action("https://youtu.be/1_AQi7C20Uo", function() end)
L7NEG7N:add_action("", function() end)
L7NEG7N:add_action("https://dsc.gg/l7neg-", function() end)