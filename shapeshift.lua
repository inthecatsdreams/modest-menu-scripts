require("scripts/global")


local function getDelay()
	delay,incr=0,0.01 globals.set_int(GTr, 1)
	while(true)do delay=delay+incr sleep(incr)if globals.get_int(GTr)==0 then return delay+incr end end
end

local function set_model_hash(h)d=getDelay()C=0
	while h~=0 do myped=player.get_player_ped()if not myped or myped:get_model_hash()==h or C==10 then return end 
		globals.set_int(GTr, 1)if h then globals.set_int(GHs,h)end sleep(d)globals.set_int(GTr,0)globals.set_int(GHs,0)sleep(0.1)C=C+1 end
end
	


local ShpShft=menu.add_submenu("ShapeShift")

local Birdy,Sea,FemSt,mSt,FeC,MaC,FCu,MCu,FGn,MGn,Law,Oth,Ani,Cos=1,1,1,1,1,1,1,1,1,1,1,1,1,1

local MPk,MPv={"MP Male","MP Female"}		,		{"mp_m_freemode_01","mp_f_freemode_01"}

local ANMk,ANMv={"Boar","Cat","Chimp","Chop","Chop2" ,"Cow","Coyote","Deer","Husky" ,"Mountain Lion","Panther","Pig","Poodle" ,"Pug" 	,"Rabbit","Rat","Retriever" ,"Rottweiler",
		"Shepherd","Rhesus","Westy"}		,		{"a_c_boar","a_c_cat_01","a_c_chimp","a_c_chop","a_c_chop_02" ,"a_c_cow" ,"a_c_coyote" ,"a_c_deer","a_c_husky" ,"a_c_mtlion",
		"a_c_panther","a_c_pig","a_c_poodle" ,"a_c_pug" ,"a_c_rabbit_01","a_c_rat","a_c_retriever","a_c_rottweiler","a_c_shepherd","a_c_rhesus","a_c_westy"}

local CosPk,CosPv={"Clown","ImpoRage","Jesus01","MovAlien","MovSpace","Pogo","Priest"	,"RsRanger","Zombie","JohnnyKlebitz","Mime"	,"Orleans","juggernaut","corpse"}
				,		{"s_m_y_clown_01","u_m_y_imporage","u_m_m_jesus_01","s_m_m_movalien_01","s_m_m_movspace_01","u_m_y_pogo_01","ig_priest","u_m_y_rsranger_01",
		"u_m_y_zombie_01","ig_johnnyklebitz","s_m_y_mime","ig_orleans","u_m_y_juggernaut_01","u_m_y_corpse_01"}

local BRDk,BRDv={"ChickenHawk","Comorant-swan like","Crow","Hen","Pigeon","Seagull"}		,		{"a_c_chickenhawk","a_c_cormorant","a_c_crow","a_c_hen","a_c_pigeon",
		"a_c_seagull"}

local SCRek,SCRev={"Dolphin","Fish","GreyWhale","Humpback","HammerHead Shark","KillerWhale","Sting Ray","Tiger Shark"}		,		{"a_c_dolphin","a_c_fish","a_c_whalegrey",
		"a_c_humpback","a_c_sharkhammer","a_c_killerwhale","a_c_stingray","a_c_sharktiger"}

local FCHarStk,FCHarStv={"Agatha","AmandaTownley","Denise","DeniseFriendCS","GeorginaCheng","Imani","Maryann" ,"Mimi","MrsPhillips","Paige","PrologueHostage01AFM","Sessanta",
		"Tanisha","Tonya","TracyDisanto"}		,		{"ig_agatha","ig_amandatownley","ig_denise","csb_denise_friend","ig_georginacheng","ig_imani","ig_maryann","ig_mimi",
		"ig_mrsphillips","ig_paige","a_f_m_prolhost_01","ig_sessanta","ig_tanisha","ig_tonya","ig_tracydisanto"}

local MCHarStk,MCHarStv={"Agent14","Ary" ,"Ary2","AviSchwartzman","Avon","Barry","Billionaire","Brad","DaveNorton","Devin","DevinSec01SMY","Dom","DrFriedlander","EdToh",
		"EnglishDave","EnglishDave2","Fabien","Floyd","Gustavo","Franklin","FranklinNew","Hacker","Hao","JayNorris","JimmyDisanto","JimmyDisanto2","LamarDavis","Lazlow",
		"Lazlow2","LesterCrest1","LesterCrest2","LesterCrest3","LifeInvad01","LifeInvad01SMM","LifeInvad02","Lildee","MartinMadrazoCutscene","MiguelMadrazo","MichaelTownley",
		"Moodyman","MrK","NervousRon","Nigel","Niko01","Rashkovsky","Pavel","PrologueDriver","PrologueHostage01AMM","PrologueMournMale01","PrologueSec01","PrologueSec01Cutscene",
		"PrologueSec02","PrologueHostage01","SiemonYetarian","Sol","Solomon","SteveHain","Stretch","TaoCheng","TaoCheng2","TaosTranslator","TaosTranslator2","TomCasino",
		"TonyPrince","Trevor","Vincent","Vincent2","Vincent3","Wade"}		,		{"ig_mp_agent14","ig_ary","ig_avischwartzman_02","ig_avon","ig_barry","ig_billionaire",
		"ig_brad","ig_davenorton","ig_devin","s_m_y_devinsec_01","ig_dom","ig_drfriedlander","u_m_m_edtoh","ig_englishdave","ig_englishdave_02","ig_fabien","ig_floyd",
		"ig_floyd","player_one","p_franklin_02","hc_hacker","ig_hao","ig_jay_norris","ig_jimmydisanto","ig_jimmydisanto2","ig_lamardavis","ig_lazlow","ig_lazlow_2",
		"ig_lestercrest","ig_lestercrest_2","ig_lestercrest_3","ig_lifeinvad_01","s_m_m_lifeinvad_01","ig_lifeinvad_02","ig_lildee","cs_martinmadrazo","ig_miguelmadrazo",
		"player_zero","ig_moodyman_02","ig_mrk","ig_nervousron","ig_nigel","mp_m_niko_01","ig_rashcosvki","ig_helmsmanpavel","u_m_y_proldriver_01","a_m_m_prolhost_01",
		"u_m_m_promourn_01","u_m_m_prolsec_01","csb_prolsec","ig_prolsec_02","a_m_m_prolhost_01","u_f_o_prolhost_01","ig_siemonyetarian","ig_sol","ig_solomon","ig_stevehains",
		"ig_stretch","ig_taocheng","ig_taocheng2","ig_taostranslator","ig_taostranslator2","ig_tomcasino","ig_tonyprince","player_two","ig_vincent","ig_vincent_2",
		"ig_vincent_3","ig_wade"}

local FChark,FCharv={"Autoshop","Abigail","Ashley","AirHostess01SFY","Bartender01SFY","BayWatch01SFY","Beach01AFM","Beach01AFY","Beach02AFY","Beachbarstaff_01","Beth",
		"BennyMP","BevHills01","BevHills02","BevHills1","Bevhills2","BevHills3","BevHills4","BevHills5","BikerChic","BoatStaff01F","BodyBuilder","Bride","Business01AFY",
		"Business02AFM","Business02AFY","Business03AFY","Business04AFY","Carol","CarDesign","CarClub","CasinoCash","CasinoShop","ClubCasino","ClubBar","ClubBar2","ClubBarMP",
		"Clubcust01","Clubcust02","Clubcust03","Clubcust04","ComJane","Cocaine","CorpseUFM01","CorpseUFY1","CorpseUFY2","Counterfeit_01","DanceBurl","DanceThr","DanceRave",
		"Debbie","Deadhooker","Drowned","EastSA01AFM","EastSA01AFY","EastSA02AFM","EastSA02AFY","EastSA03AFY","Eileen","ExecPA1","ExecPA2","Epsilon01AFY","Factory01SFY",
		"FatBla01AFM","FatCult01AFM","FatWhite01AFM","FemBarberSFM","Fitness01AFY","Fitness02AFY","Forgery","GenHot01AFY","Genstreet01AFY","Gencaspat01AFY","Golfer01AFY",
		"Gurk","Heli Staff","Hiker01AFY","Hippie01AFY","Hipster01AFY","Hipster02AFY","Hipster03AFY","Hipster04AFY","Hooker01SFY","Hooker02SFY","Hooker03SFY","HotPosh01",
		"ImportExport","Indian01AFO","Indian01AFY","Jacky","Janet","JewelAss01","JewelAss","Juggalo01AFY","KarenDaniels","Kaylee","KerryMcintosh","KerryMcintosh2",
		"KTown01AFM","KTown02AFM","KTown01AFO","Lauren","Maid","Magenta","Maid01SFM","Marnie","Maude","Meth","Michelle","Migrant01SFY","Mistress","Miranda","Miranda2",
		"Misty01","Molly","MovieStar","MovPrem01SFY","MrsThornhill","Natalia","Patricia","Patricia2","PoppyMich","PoppyMich2","Princess","PrologueMourn1","RetailStaff",
		"Runner01AFY","RurMeth01AFY","Salton01AFM","Salton01AFO","ScreenWriter","Scrubs","SCDressy01AFY","ShopHighSFM","ShopLowSFY","ShopMidSFY","Skater01AFY","Skidrow01AFM",
		"Smartcaspat01AFY","SouCent01AFM","SouCent02AFM","SouCent01AFO","SouCent01AFY","SouCent02AFO","SouCent02AFY","SouCent03AFY","SouCentMC01AFM","SpyActress",
		"Stripper01SFY","Stripper02SFY","StripperLite","StripperLiteMP","StudioAssistant","StudioParty1","StudioParty2","SweatShop01SFM","SweatShop01SFY","Talina",
		"Taylor","Tennis01AFY","Topless01AFY","Tourist01AFM","Tourist01AFY","Tourist02AFY","Tramp01AFM","TrampBeac01AFM","TranVest01AMM","TranVest02AMM","Vinewood01AFY",
		"Vinewood02AFY","Vinewood03AFY","Vinewood04AFY","Weed","Wendy","Yoga01AFY"}		,		{"s_f_m_autoshop_01","ig_abigail","ig_ashley","s_f_y_airhostess_01",
		"s_f_y_bartender_01","s_f_y_baywatch_01","a_f_m_beach_01","a_f_y_beach_01","a_f_y_beach_02","s_f_y_beachbarstaff_01","u_f_y_beth","mp_f_bennymech_01",
		"a_f_m_bevhills_01","a_f_m_bevhills_02","a_f_y_bevhills_01","a_f_y_bevhills_02","a_f_y_bevhills_03","a_f_y_bevhills_04","a_f_y_bevhills_05","u_f_y_bikerchic",
		"mp_f_boatstaff_01","a_f_m_bodybuild_01","ig_bride","a_f_y_business_01","a_f_m_business_02","a_f_y_business_02","a_f_y_business_03","a_f_y_business_04",
		"u_f_o_carol","mp_f_cardesign_01","a_f_y_carclub_01","u_f_m_casinocash_01","u_f_m_casinoshop_01","s_f_y_casino_01","s_f_y_clubbar_01","s_f_y_clubbar_02",
		"mp_f_chbar_01","a_f_y_clubcust_01","a_f_y_clubcust_02","a_f_y_clubcust_03","a_f_y_clubcust_04","u_f_y_comjane","mp_f_cocaine_01","u_f_m_corpse_01",
		"u_f_y_corpse_01","u_f_y_corpse_02","mp_f_counterfeit_01","u_f_y_danceburl_01","u_f_y_dancelthr_01","u_f_y_dancerave_01","u_f_m_debbie_01","mp_f_deadhooker",
		"u_f_m_drowned_01","a_f_m_eastsa_01","a_f_y_eastsa_01","a_f_m_eastsa_02","a_f_y_eastsa_02","a_f_y_eastsa_03","u_f_o_eileen","mp_f_execpa_01","mp_f_execpa_02",
		"a_f_y_epsilon_01","s_f_y_factory_01","a_f_m_fatbla_01","a_f_m_fatcult_01","a_f_m_fatwhite_01","s_f_m_fembarber","a_f_y_fitness_01","a_f_y_fitness_02",
		"mp_f_forgery_01","a_f_y_genhot_01","a_f_o_genstreet_01","a_f_y_gencaspat_01","a_f_y_golfer_01","cs_gurk","mp_f_helistaff_01","a_f_y_hiker_01","a_f_y_hippie_01",
		"a_f_y_hipster_01","a_f_y_hipster_02","a_f_y_hipster_03","a_f_y_hipster_04","s_f_y_hooker_01","s_f_y_hooker_02","s_f_y_hooker_03","u_f_y_hotposh_01",
		"g_f_importexport_01","a_f_o_indian_01","a_f_y_indian_01","ig_jackie","ig_janet","u_f_y_jewelass_01","ig_jewelass","a_f_y_juggalo_01","ig_karen_daniels","ig_kaylee",
		"ig_kerrymcintosh","ig_kerrymcintosh_02","a_f_m_ktown_01","a_f_m_ktown_02","a_f_o_ktown_01","u_f_y_lauren","s_f_m_maid_01","ig_magenta","s_f_m_maid_01","ig_marnie",
		"ig_maude","mp_f_meth_01","ig_michelle","s_f_y_migrant_01","u_f_y_mistress","u_f_m_miranda","u_f_m_miranda_02","mp_f_misty_01","ig_molly","u_f_o_moviestar",
		"s_f_y_movprem_01","ig_mrs_thornhill","ig_natalia","ig_patricia","ig_patricia_02","u_f_y_poppymich","u_f_y_poppymich_02","u_f_y_princess","u_f_m_promourn_01",
		"s_f_m_retailstaff_01","a_f_y_runner_01","a_f_y_rurmeth_01","a_f_m_salton_01","a_f_o_salton_01","ig_screen_writer","s_f_y_scrubs_01","a_f_y_scdressy_01",
		"s_f_m_shop_high","s_f_y_shop_low","s_f_y_shop_mid","a_f_y_skater_01","a_f_m_skidrow_01","a_f_y_smartcaspat_01","a_f_m_soucent_01","a_f_m_soucent_02",
		"a_f_o_soucent_01","a_f_y_soucent_01","a_f_o_soucent_02","a_f_y_soucent_02","a_f_y_soucent_03","a_f_m_soucentmc_01","u_f_y_spyactress","s_f_y_stripper_01",
		"s_f_y_stripper_02","s_f_y_stripperlite","mp_f_stripperlite","s_f_m_studioassist_01","a_f_y_studioparty_01","a_f_y_studioparty_02","s_f_m_sweatshop_01",
		"s_f_y_sweatshop_01","ig_talina","u_f_y_taylor","a_f_y_tennis_01","a_f_y_topless_01","a_f_m_tourist_01","a_f_y_tourist_01","a_f_y_tourist_02","a_f_m_trampbeac_01",
		"a_f_m_tramp_01","a_m_m_tranvest_01","a_m_m_tranvest_02","a_f_y_vinewood_01","a_f_y_vinewood_02","a_f_y_vinewood_03","a_f_y_vinewood_04","mp_f_weed_01","ig_wendy",
		"a_f_y_yoga_01"}

local MChark,MCharv={"Agent","Abner","Acult01AMM","Acult01AMO","Acult01AMY","Acult02AMO","Acult02AMY","AfriAmer01AMM","AirWorkerSMY","AlDiNapoli","AmmuCity01SMY",
		"AmmuCountrySMM","Andreas","AntonB","Autopsy01SMY","AutoShop01SMM","Autoshop02SMM","Autoshop03SMM","AviSchwartzman","Azteca01GMY","BabyD","Bankman01","Bankman",
		"Barman01SMY","Baygor","BayWatch01SMY","Beach01AMM","Beach01AMO","Beach02AMO","Beach01AMY","Beach02AMM","Beach02AMY","Beach03AMY","Beach04AMY","BeachVesp01AMY",
		"Beachvesp02AMY","Benny","Benny2","BestMen","Beverly","BevHills01AMM","BevHills01AMY","BevHills02AMM","BevHills02AMY","BikeHire01","BoatStaff01M","Bouncer01SMM",
		"Bouncer01SMM","BreakDance01AMY","Brucie2","BurgerDrug","BusBoy01SMY","Busicas01AMY","Business01AMM","Business01AMY","Business02AMY","Business03AMY","Busker01SMO",
		"CarClub","CarClubCustomer","CarClubCustomer2","CarClubCustomer3","CarClubCustomer4","Car3Guy1","Car3Guy2","CCrew01SMM","Chef01SMY","Celeb1","Chef2","Chef",
		"ChemWork01GMM","ChemSec01SMM","Chip","ChrisFormage","Claude01","Clay","ClayPain","Cletus","CntryBar01SMM","Construct01SMY","Construct02SMY","CrisFormage",
		"Cyclist01","Cyclist01amy","Dale","Dealer01SMY","Dean","DHill01AMY","DJBladamon","DJBlamRupert","DJBlamRyanh","DJBlamRyan","DJDixManager","DJGeneric","DJSolFotios",
		"DJSolJakob","DJSolManager","DJSolMike","DJSolRobot","DJtalaurelia","DJtalignazio","DJ1","DJ2","DJ3","DJ4","DJ5","DJ11","DJ22","DJ33","DoaMan","DockWork01SMM",
		"DockWork01SMY","Doctor01SMM","Doorman01SMY","DownTown01AMY","Dreyfuss","DrugDealer","DWService01SMY","DWService02SMY","EastSA01AMM","Eastsa01AMY","EastSa02AMM",
		"EastSA02AMY","EntourageA","EntourageB","Epsilon01AMY","Epsilon02AMY","Factory01SMY","FamCA01GMY","FamDD01","FamDNF01GMY","FamFor01GMY","Farmer01AMM",
		"FatLatin01AMM","FilmDirector","FilmNoir","FinGuru01","Fireman01SMY","G","Gaffer01SMM","GarbageSMY","Gardener01SMM","Gay01AMY","Gay02AMY","GenFat01AMM",
		"GenFat02AMM","GenStreet01AMO","GenStreet01AMY","GenStreet02AMY","GenTransportSMM","GlenStank01","Golfer01AMM","Golfer01AMY","GolferA","GolferB","Griff01",
		"Grip01SMY","Groom","Guido01","GunVend01","HairDress01SMM","Hao","Hao2","HasJew01AMM","HasJew01AMY","Hiker01AMY","HillBilly01AMM","HillBilly02AMM","Hippy01AMY",
		"Hippie01UMY","Hipster01AMY","Hipster02AMY","Hipster03AMY","HipsterRamp","HCDriver","Indian01AMM","Indian01AMY","JanitorSMM","JetSki01AMY","JewelSec01",
		"JewelThief","JimmyBoston","JimmyBoston2","Jio","Jio2","JoeMinuteman","Johnnyklebitz","Josef","Josh","Juggalo","Juanstrickler","Justin","KTown01AMM","KTown01AMO",
		"KTown01AMY","KTown02AMY","Lacey_jones2","Lathandy01SMM","Latino01AMY","LineCookSMM","LSMetro01SMM","MalC","Malibu01AMM","Mani","Manuel","Mariachi01SMM",
		"Markfost","MethHead01AMY","Migrant01SMM","Milton","Mjo","Mjo2","MovPrem01SMM","MusclBeac01AMY","MusclBeac02AMY","Musician","Paparazzi01AMM","Paper",
		"Paramedic01SMM","Party01","PartyPromo","PartyTarget","PestCont01SMY","PestContDriver","PestContGunman","Pilot","Pilot01SMM","Pilot01SMY","Pilot02SMM",
		"Polynesian01AMM","Polynesian01AMY","Popov","Postal01SMM","Postal02SMM","PrisMuscl01SMY","Prisoner01","Prisoner01SMY","PrologueHost1","RaceOrg","RampGang",
		"RampHic","Runner01AMY","Runner02AMY","RurMeth01AMM","RussianDrunk","Salton01AMM","Salton01AMO","Salton01AMY","Salton02AMM","Salton03AMM","Salton04AMM",
		"ShopKeep01","ShopMaskSMY","Skater01AMM","Skater01AMY","Skater02AMY","SkidRow01AMM","SmartCaspatAMY","SoCenLat01AMM","SouCent01AMM","SouCent01AMO","SouCent01AMY",
		"SouCent02AMM","SouCent02AMO","SouCent02AMY","SouCent03AMM","SouCent03AMO","SouCent03AMY","SouCent04AMM","SouCent04AMY","Soundeng","SpyActor","StagGrm01AMO",
		"StBla01AMY","Stbla02AMY","StLat01AMY","StLat02AMM","StrPerf01SMM","StrPreach01SMM","StrPunk01GMY","StrPunk02GMY","StrVend01SMM","StrVend01SMY","StudioAssistant",
		"StudioParty1","StudioParty2","StudioProd","StudioSoueng","StWhi01AMY","StWhi02AMY","SunBathe01AMY","Surfer01AMY","TapHillBilly","Tattoo01AMO","Tattoo01SMM",
		"TattooCustomer","Tennis01AMM","TennisCoach","Terry","TomEpsilon","Tourist01AMM","Tramp01","Tramp01AMM","Tramp01AMO","TrampBeac01AMM","TrampBeac01UMO",
		"Trucker01SMM","TylerDixon","UPS01SMM","UPS02SMM","USCG01SMY","Valet01SMY","Vernon","Vince","VineWood01AMY","VineWood02AMY","Vinewood03AMY","Vinewood04AMY",
		"Waiter01SMY","Weed","WeiCheng","WillyFist","WinClean01SMY","XMech01SMY","XMech02SMY","XMechMP02SMY","Yoga01AMY","Zimbor","Scientist01SMM","acult","acult2",
		"acult3","acult4","importexport","casrn","avery","gustavo","huang","oldrich","ortega","prolsec2","rampmex","sacha","sss","talcc","talmm","thorton","mexcntry",
		"mlcrisis","prolhost","TylerDix2","tylerDix","Zimbor","Pros1","HeadTrgt","AvonGoon","BogDanGoon","Coke","CounterF","ForG","Marston","ExecPA","waremech","weapexp",
		"weapwork","SecuroGuard","drugprocess","fieldworker","lifeinvad","casino","clubbar","devinsec","mime","waretech","blane","curtis","promourn","rivalpap","streetart",
		"caleb","danceburl","dancelthr","dancerave","fibmugger","gabriel","ushi","croupthief","smugmech","tranvest","tranvest2"}		,		{"ig_agent","u_m_y_abner",
		"a_m_m_acult_01","a_m_o_acult_01","a_m_y_acult_01","a_m_o_acult_02","a_m_y_acult_02","a_m_m_afriamer_01","s_m_y_airworker","u_m_m_aldinapoli","s_m_y_ammucity_01",
		"s_m_m_ammucountry","ig_andreas","u_m_y_antonb","s_m_y_autopsy_01","s_m_m_autoshop_01","s_m_m_autoshop_02","s_m_m_autoshop_03","ig_money","g_m_y_azteca_01",
		"u_m_y_babyd","u_m_m_bankman","ig_bankman","s_m_y_barman_01","u_m_y_baygor","s_m_y_baywatch_01","a_m_m_beach_02","a_m_o_beach_01","a_m_o_beach_02","a_m_y_beach_01",
		"a_m_m_beach_02","a_m_y_beach_02","a_m_y_beach_03","a_m_y_beach_04","a_m_y_beachvesp_01","a_m_y_beachvesp_02","ig_benny","ig_benny_02","ig_bestmen","ig_beverly",
		"a_m_m_bevhills_01","a_m_y_bevhills_01","a_m_m_bevhills_02","a_m_y_bevhills_02","u_m_m_bikehire_01","mp_m_boatstaff_01","s_m_m_bouncer_01","s_m_m_bouncer_02",
		"a_m_y_breakdance_01","ig_brucie2","u_m_y_burgerdrug_01","s_m_y_busboy_01","a_m_y_busicas_01","a_m_m_business_01","a_m_y_business_01","a_m_y_business_02",
		"a_m_y_business_03","s_m_o_busker_01","a_m_y_carclub_01","a_m_y_clubcust_01","a_m_y_clubcust_02","a_m_y_clubcust_03","a_m_y_clubcust_04","ig_car3guy1","ig_car3guy2",
		"s_m_m_ccrew_01","s_m_y_chef_01","ig_celeb_01","ig_chef2","ig_chef","g_m_m_chemwork_01","s_m_m_chemsec_01","u_m_y_chip","ig_chrisformage","mp_m_claude_01","ig_clay",
		"ig_claypain","ig_cletus","s_m_m_cntrybar_01","s_m_y_construct_01","s_m_y_construct_02","ig_chrisformage","u_m_y_cyclist_01","a_m_y_cyclist_01","ig_dale",
		"s_m_y_dealer_01","u_m_o_dean","a_m_y_dhill_01","ig_djblamadon","ig_djblamrupert","ig_djblamryanh","ig_djblamryans","ig_djdixmanager","ig_djgeneric_01",
		"ig_djsolfotios","ig_djsoljakob","ig_djsolmanager","ig_djsolmike","ig_djsolrobt","ig_djtalaurelia","ig_djtalignazio","ig_isldj_00","ig_isldj_01","ig_isldj_02",
		"ig_isldj_03","ig_isldj_04","ig_isldj_04_d_01","ig_isldj_04_d_02","ig_isldj_04_e_01","u_m_m_doa_01","s_m_m_dockwork_01","s_m_y_dockwork_01","s_m_m_doctor_01",
		"s_m_y_doorman_01","a_m_y_downtown_01","ig_dreyfuss","ig_drugdealer","s_m_y_dwservice_01","s_m_y_dwservice_02","a_m_m_eastsa_01","a_m_y_eastsa_01",
		"a_m_m_eastsa_02","a_m_y_eastsa_02","ig_entourage_a","ig_entourage_b","a_m_y_epsilon_01","a_m_y_epsilon_02","s_m_y_factory_01","g_m_y_famca_01","mp_m_famdd_01",
		"g_m_y_famdnf_01","g_m_y_famfor_01","a_m_m_farmer_01","a_m_m_fatlatin_01","u_m_m_filmdirector","u_m_o_filmnoir","u_m_o_finguru_01","s_m_y_fireman_01","ig_g",
		"s_m_m_gaffer_01","s_m_y_garbage","s_m_m_gardener_01","a_m_y_gay_01","a_m_y_gay_02","a_m_m_genfat_01","a_m_m_genfat_02","a_m_o_genstreet_01","a_m_y_genstreet_01",
		"a_m_y_genstreet_02","s_m_m_gentransport","u_m_m_glenstank_01","a_m_m_golfer_01","a_m_y_golfer_01","ig_golfer_a","ig_golfer_b","u_m_m_griff_01","s_m_y_grip_01",
		"ig_groom","u_m_y_guido_01","u_m_y_gunvend_01","s_m_m_hairdress_01","ig_hao","ig_hao_02","a_m_m_hasjew_01","a_m_y_hasjew_01","a_m_y_hiker_01","a_m_m_hillbilly_01",
		"a_m_m_hillbilly_02","a_m_y_hippy_01","u_m_y_hippie_01","a_m_y_hipster_01","a_m_y_hipster_02","a_m_y_hipster_03","ig_ramp_hipster","hc_driver","a_m_m_indian_01",
		"a_m_y_indian_01","s_m_m_janitor","a_m_y_jetski_01","u_m_m_jewelsec_01","u_m_m_jewelthief","ig_jimmyboston","ig_jimmyboston_02","ig_jio","ig_jio_02",
		"ig_joeminuteman","ig_johnnyklebitz","ig_josef","ig_josh","a_m_y_juggalo_01","ig_juanstrickler","u_m_y_justin","a_m_m_ktown_01","a_m_o_ktown_01","a_m_y_ktown_01",
		"a_m_y_ktown_02","ig_lacey_jones_02","s_m_m_lathandy_01","a_m_y_latino_01","s_m_m_linecook","s_m_m_lsmetro_01","ig_malc","a_m_m_malibu_01","u_m_y_mani","ig_manuel",
		"s_m_m_mariachi_01","u_m_m_markfost","mp_m_meth_01","s_m_m_migrant_01","ig_milton","ig_mjo","ig_mjo_02","s_m_m_movprem_01","a_m_y_musclbeac_01",
		"a_m_y_musclbeac_02","ig_musician_00","a_m_m_paparazzi_01","ig_paper","s_m_m_paramedic_01","u_m_y_party_01","ig_party_promo","u_m_m_partytarget",
		"s_m_y_pestcont_01","u_m_y_proldriver_01","hc_gunman","ig_pilot","s_m_m_pilot_01","s_m_y_pilot_01","s_m_m_pilot_02","a_m_m_polynesian_01","a_m_y_polynesian_01",
		"ig_popov","s_m_m_postal_01","s_m_m_postal_02","s_m_y_prismuscl_01","u_m_y_prisoner_01","s_m_y_prisoner_01","u_f_o_prolhost_01","s_m_m_raceorg_01","ig_ramp_gang",
		"ig_ramp_hic","a_m_y_runner_01","a_m_y_runner_02","a_m_m_rurmeth_01","ig_russiandrunk","a_m_m_salton_01","a_m_o_salton_01","a_m_y_salton_01","a_m_m_salton_02",
		"a_m_m_salton_03","a_m_m_salton_04","mp_m_shopkeep_01","s_m_y_shop_mask","a_m_m_skater_01","a_m_y_skater_01","a_m_y_skater_02","a_m_m_skidrow_01",
		"a_m_y_smartcaspat_01","a_m_m_socenlat_01","a_m_m_soucent_01","a_m_o_soucent_01","a_m_y_soucent_01","a_m_m_soucent_02","a_m_o_soucent_02","a_m_y_soucent_02",
		"a_m_m_soucent_03","a_m_o_soucent_03","a_m_y_soucent_03","a_m_m_soucent_04","a_m_y_soucent_04","ig_soundeng_00","u_m_m_spyactor","u_m_y_staggrm_01",
		"a_m_y_stbla_01","a_m_y_stbla_02","a_m_y_stlat_01","a_m_m_stlat_02","s_m_m_strperf_01","s_m_m_strpreach_01","g_m_y_strpunk_01","g_m_y_strpunk_02",
		"s_m_m_strvend_01","s_m_y_strvend_01","s_m_m_studioassist_02","a_m_m_studioparty_01","a_m_y_studioparty_01","s_m_m_studioprod_01","s_m_m_studiosoueng_02",
		"a_m_y_stwhi_01","a_m_y_stwhi_02","a_m_y_sunbathe_01","a_m_y_surfer_01","u_m_o_taphillbilly","u_m_y_tattoo_01","s_m_m_tattoo_01","a_m_y_tattoocust_01",
		"a_m_m_tennis_01","ig_tenniscoach","ig_terry","ig_tomepsilon","a_m_m_tourist_01","a_m_m_tramp_01","a_m_m_tramp_01","a_m_o_tramp_01","a_m_m_trampbeac_01",
		"u_m_o_tramp_01","s_m_m_trucker_01","ig_dix","s_m_m_ups_01","s_m_m_ups_02","s_m_y_uscg_01","s_m_y_valet_01","ig_vernon","u_m_m_vince","a_m_y_vinewood_01",
		"a_m_y_vinewood_02","a_m_y_vinewood_03","a_m_y_vinewood_04","s_m_y_waiter_01","mp_m_weed_01","ig_chengsr","u_m_m_willyfist","s_m_y_winclean_01","s_m_y_xmech_01",
		"s_m_y_xmech_02","s_m_y_xmech_02_mp","a_m_y_yoga_01","ig_zimbor","s_m_m_scientist_01","a_m_o_acult_01","a_m_o_acult_02","a_m_y_acult_01","a_m_y_acult_02",
		"g_m_importexport_01","g_m_m_casrn_01","ig_avery","ig_gustavo","ig_huang","ig_oldrichguy","ig_ortega","ig_prolsec_02","ig_ramp_mex","ig_sacha","ig_sss",
		"ig_talcc","ig_talmm","ig_thornton","a_m_m_mexcntry_01","a_m_m_mlcrisis_01","a_m_m_prolhost_01","ig_tylerdix_02","ig_tylerdix","ig_zimbor","mp_g_m_pros_01",
		"mp_headtargets","mp_m_avongoon","mp_m_bogdangoon","mp_m_cocaine_01","mp_m_counterfeit_01","mp_m_forgery_01","mp_m_marston_01","mp_m_execpa_01","mp_m_waremech_01",
		"mp_m_weapexp_01","mp_m_weapwork_01","mp_m_securoguard_01","s_m_m_drugprocess_01","s_m_m_fieldworker_01","s_m_m_lifeinvad_01","s_m_y_casino_01","s_m_y_clubbar_01",
		"s_m_y_devinsec_01","s_m_y_mime","s_m_y_waretech_01","u_m_m_blane","u_m_m_curtis","u_m_m_promourn_01","u_m_m_rivalpap","u_m_m_streetart_01","u_m_y_caleb",
		"u_m_y_danceburl_01","u_m_y_dancelthr_01","u_m_y_dancerave_01","u_m_y_fibmugger_01","u_m_y_gabriel","u_m_y_ushi","u_m_y_croupthief_01","u_m_y_smugmech_01",
		"a_m_m_tranvest_01","a_m_m_tranvest_02"}

local FCutSk,FCutSv={"AbigailCutscene","AgathaCutscene","AmandaTownleyCutscene","AnitaCutscene","Ashley","BrideCutscene","BryonyCutscene","DebraCutscene","DeniseCutscene",
		"GeorginaCutscene","GuadalopeCutscene","GurkCutscene","ImaniCutScene","MimiCutScene","SessantaCutScene","JewelAss01Cutscene","JewelAssCutscene","JanetCutscene",
		"KarenDanielsCutscene","MarnieCutscene","MaryannCutscene","MaudeCutscene","MichelleCutScene","MollyCutscene","Movpremf_01","MrsThornhillCutscene",
		"MrsPhillipsCutscene","MrsRCutscene","NataliaCutscene","PaigeCutscene","PatriciaCutscene","PatriciaCutscene2","ScreenWriterCutscene","Stripper01Cutscene",
		"Stripper02Cutscene","TanishaCutscene","TonyaCutscene","TracyDisantoCutScene","Wendy"}		,		{"csb_abigail","csb_agatha","cs_amandatownley","csb_anita",
		"cs_ashley","csb_bryony","csb_bride","cs_debra","cs_denise","csb_georginacheng","cs_guadalope","cs_gurk","csb_imani ","csb_mimi","csb_sessanta","cs_jewelass_01",
		"cs_jewelass","cs_janet","cs_karen_daniels","cs_marnie","cs_maryann","csb_maude","cs_michelle","cs_molly","cs_movpremf_01","cs_mrs_thornhill","cs_mrsphillips",
		"csb_mrs_r","cs_natalia","csb_paige","cs_patricia","cs_patricia_02","csb_screen_writer","csb_stripper_01","csb_stripper_02","cs_tanisha","csb_tonya",
		"cs_tracydisanto","csb_wendy"}

local MCutSk,MCutSv={"Agent14Cutscene","AgentCutscene","AlanCutscene","AryCutscene","AryCutscene2","AveryCutscene","AvonCutscene","AndreasCutscene","AntonCutscene",
		"AviSchwartzmanCuts","AviCutScene2","BallasLeaderCutscene","BallasOGCutscene","BankmanCutscene","BarryCutscene","BeverlyCutscene","BillonaireCutscene",
		"BradCadaverCutscene","BradCutscene","BurgerDrugCutscene","BogdanCutscene","Brucie2Cutscene","Car3Guy1Cutscene","Car3Guy2Cutscene","CarBuyerCutscene",
		"CaseyCutscene","CelebCutscene","ChefCutscene","Chef2Cutscene","ChinGoonCutscene","ClayCutscene","CletusCutscene","ClubCust1Cutscene","ClubCust2Cutscene",
		"ClubCust3Cutscene","ClubCust4Cutscene","CrisFormageCutscene","CustomerCutscene","Cop","DaleCutscene","DaveNortonCutscene","DevinCutscene","TylerDixonCutscene",
		"DJBlamadon","DJ0","DJ1","DJ2","DJ3","DJ4","DomCutscene","DreyfussCutscene","DrFriedlanderCutscene","DrugDealerCutscene","EnglishDave","EngDave2",
		"FabienCutscene","FBISuitCutS","FloydCutscene","FosRepCutscene","GCutscene","GolferACutS","GolferBCutS","GustavoCutscene","GroomCutscene","GroveStrDlrCutscene",
		"HaoCutscene","HaoCutscene2","HuangCutscene","HughCutscene","HunterCutscene","ImranCutscene","JackHowitzerCutscene","JanitorCutscene","JimmyBostonCutscene",
		"JimmyDisantoCutscene","JimmyDisanto2Cutscene","Jio2Cutscene","JoeMinutemanCutscene","JohnnyKlebitzCutscene","JohnnyGunsCutscene","JosefCutscene","JoshCutscene",
		"JuanCutscene","LamarDavisCutscene","LamarDavisCutscene2","LazlowCutscene","LazlowCutscene2","LesterCrestCutscene","LesterCrestCutscene2","LesterCrestCutscene3",
		"LifeInvad01Cutscene","MagentaCutscene","MarineCutS","MweatherCutS","ManuelCutscene","MartinMadrazoCutscene","MiguelCutscene","MiltonCutscene","MjoCutscene",
		"MjoCutscene2","MoodymanCutscene","MoviePremMaleCutscene","MrKCutscene","MusicianCutscene","NervousRonCutscene","NigelCutscene","OldMan1aCutscene",
		"OldMan2Cutscene","OmegaCutscene","OrleansCutscene","OrtegaCutScene","OscarCutscene","PaperCutscene","PartyPromoCutscene","PavelCutscene","PopovCutscene",
		"PornDudesCutscene","PriestCutscene","ProlDriverCutscene","PrologueSec01Cutscene","PrologueSec02Cutscene","RampGangCutscene","RampHicCutscene",
		"RampHipsterCutscene","RampMexCutscene","RashkovskyCutscene","ReqOfficerCutscene","RoccoPelosiCutscene","RussianDrunkCutscene","SecurityCutscene",
		"ScrnWriterCutscene","SiemonYetarianCutscene","SolCutscene","SolomonCutscene","SoundengCutscene","SSSCutScene","SteveHainsCutscene","StretchCutscene",
		"TaoChengCutscene","TalccCutscene","TalmCutscene","ThortonCutscene","TaoChengCutscene2","TaosTranslatorCutscene","TaosTranslatorCutS2","TennisCoachCutscene",
		"TerryCutscene","TomCutscene","TomCasinoCutscene","TomEpsilonCutscene","TonyPrinceCutscene","ReporterCutscene","TrafficWardenCutscene","UndercoverCopCutscene",
		"VagosLeaderCutscene","VagosSpeakCutscene","VernonCutscene","VinCentCutscene","VinCentCutscene2","WadeCutscene","WeiChengCutscene","ZimborCutscene","JioCutscene"
		}		,		{"csb_mp_agent14","csb_agent","csb_alan","csb_ary","csb_ary_02","csb_avery","csb_avon","cs_andreas","csb_anton","csb_money","csb_avischwartzman_02",
		"csb_ballas_leader","csb_ballasog","cs_bankman","cs_barry","cs_beverly","csb_billionaire","cs_bradcadaver","cs_brad","csb_burgerdrug","csb_bogdan","csb_brucie2",
		"csb_car3guy1","csb_car3guy2","cs_carbuyer","cs_casey","csb_celeb_01","csb_chef","csb_chef2","csb_chin_goon","cs_clay","csb_cletus","a_m_y_gencaspat_01",
		"a_m_y_gencaspat_02","a_m_y_gencaspat_03","a_m_y_gencaspat_04","cs_chrisformage","csb_customer","csb_cop","cs_dale","cs_davenorton","cs_devin","csb_dix",
		"csb_djblamadon","csb_isldj_00","csb_isldj_01","csb_isldj_02","csb_isldj_03","csb_isldj_04","cs_dom","cs_dreyfuss","cs_drfriedlander","csb_drugdealer",
		"csb_englishdave","csb_englishdave_02","cs_fabien","cs_fbisuit_01","cs_floyd","csb_fos_rep","csb_g","csb_golfer_a","csb_golfer_b","csb_gustavo","csb_groom",
		"csb_grove_str_dlr","csb_hao","csb_hao_02","csb_huang","csb_hugh","cs_hunter","csb_imran","csb_jackhowitzer","csb_janitor","cs_jimmyboston","cs_jimmydisanto",
		"cs_jimmydisanto2","csb_jio_02","cs_joeminuteman","cs_johnnyklebitz","csb_johnny_guns","cs_josef","cs_josh","csb_juanstrickler","cs_lamardavis","cs_lamardavis_02",
		"cs_lazlow","cs_lazlow_2","cs_lestercrest","cs_lestercrest_2","cs_lestercrest_3","cs_lifeinvad_01","cs_magenta","csb_ramp_marine","csb_mweather","cs_manuel",
		"csb_martinmadrazo","csb_miguelmadrazo","cs_milton","csb_mjo","csb_mjo_02","csb_moodyman_02","cs_movpremmale","cs_mrk","csb_musician_00","cs_nervousron",
		"cs_nigel","cs_old_man1a","cs_old_man2","cs_omega","cs_orleans","csb_ortega","csb_oscar","cs_paper","csb_party_promo","csb_helmsmanpavel","csb_popov",
		"csb_porndudes","cs_priest","csb_prologuedriver","csb_prolsec","cs_prolsec_02","csb_ramp_gang","csb_ramp_hic","csb_ramp_hipster","csb_ramp_mex","csb_rashcosvki",
		"csb_req_officer","csb_roccopelosi","cs_russiandrunk","csb_security_a","csb_screen_writer","cs_siemonyetarian","csb_sol","cs_solomon","csb_soundeng_00","csb_sss",
		"cs_stevehains","cs_stretch","cs_taocheng","csb_talcc","csb_talmm","csb_thornton","cs_taocheng2","cs_taostranslator","cs_taostranslator2","cs_tenniscoach",
		"cs_terry","cs_tom","csb_tomcasino","cs_tomepsilon","csb_tonyprince","csb_reporter","csb_trafficwarden","csb_undercover","csb_vagos_leader","csb_vagspeak",
		"csb_vernon","csb_vincent","csb_vincent_2","cs_wade","cs_chengsr","cs_zimbor","csb_jio"}

local FGangk,FGangv={"Ballas01GFY","DownTown01AFM","DownTown01AMY","Families1","Lost01GFY","Vagos01GFY"}		,		{"g_f_y_ballas_01","a_f_m_downtown_01",
		"a_m_y_downtown_01","g_f_y_families_01","g_f_y_lost_01","g_f_y_vagos_01"}

local MGangk,MGangv={"ArmBoss01GMM","ArmGoon01GMM","ArmGoon02GMY","ArmLieut01GMM","Armoured01","Armoured01SMM","Armoured02SMM","ArmyMech01SMY","BallaEast01GMY",
		"BallasLeader","BallaOrig01GMY","BallasOG","BallaSout01GMY","Cartelguards1","Cartelguards2","ChiBoss01GMM","ChiCold01GMM","ChiGoon01GMM","ChiGoon02GMM","Goons",
		"Hunter","Korean1","Korean2","KoreanLieut","KorBoss01GMM","Lost01GMY","Lost02GMY","Lost03GMY","MethHead01AMY","MexBoss01GMM","MexBoss02GMM","MexCntry01AMM",
		"MexGang01GMY","MexGoon01GMY","MexGoon02GMY","MexGoon03GMY","MexLabor01AMM","Mexthug01AMY","MilitaryBum","Motox01AMY","Motox02AMY","OGBoss01AMM","OldMan1A",
		"OldMan2","Omega","Oneil","PoloGoon","PoloGoon2","Prisoners","RivalPaparazzi","RoadCyc01AMY","Robber01SMY","RoccoPelosi","SalvaBoss01GMY","SalvaGoon01GMY",
		"SalvaGoon02GMY","SalvaGoon03GMY","SBikeAMO","Slasher","VagosLeader","VagosFun01","VagosSpeak","VinDouche01AMY"}		,		{"g_m_m_armboss_01",
		"g_m_m_armgoon_01","g_m_y_armgoon_02","g_m_m_armlieut_01","mp_s_m_armoured_01","s_m_m_armoured_01","s_m_m_armoured_02","s_m_y_armymech_01","g_m_y_ballaeast_01",
		"ig_ballas_leader","g_m_y_ballaorig_01","ig_ballasog","g_m_y_ballasout_01","g_m_m_cartelguards_01","g_m_m_cartelguards_02","g_m_m_chiboss_01","g_m_m_chicold_01",
		"g_m_m_chigoon_01","g_m_m_chigoon_02","g_m_m_goons_01","ig_hunter","g_m_y_korean_01","g_m_y_korean_02","g_m_y_korlieut_01","g_m_m_korboss_01","g_m_y_lost_01",
		"g_m_y_lost_02","g_m_y_lost_03","a_m_y_methhead_01","g_m_m_mexboss_01","g_m_m_mexboss_02","a_m_m_mexcntry_01","g_m_y_mexgang_01","g_m_y_mexgoon_01",
		"g_m_y_mexgoon_02","g_m_y_mexgoon_03","a_m_m_mexlabor_01","a_m_y_mexthug_01","u_m_y_militarybum","a_m_y_motox_01","a_m_y_motox_02","a_m_m_og_boss_01",
		"ig_old_man1a","ig_old_man2","ig_omega","ig_oneil","g_m_y_pologoon_01","g_m_y_pologoon_02","g_m_m_prisoners_01","u_m_y_paparazzi","a_m_y_roadcyc_01",
		"s_m_y_robber_01","ig_roccopelosi","g_m_y_salvaboss_01","g_m_y_salvagoon_01","g_m_y_salvagoon_02","g_m_y_salvagoon_03","u_m_y_sbike","g_m_m_slasher_01",
		"ig_vagos_leader","mp_m_g_vagfun_01","ig_vagspeak","a_m_y_vindouche_01"}

local LAWk,LAWv={"Sheriff01SFY","Sheriff01SMY","BlackOps01SMY","BlackOps02SMY","BlackOps03SMY","Casey","CIASec01SMM","Cop01SMY","Cop01SFY","CopCutscene","FBISuit01",
		"FemaleAgent","FIBArchitect","FIBMugger01","FIBOffice01SMM","FIBOffice02SMM","FIBSec01","FIBSec01SMM","HighSec01SMM","HighSec02SMM","HighSec03SMM",
		"HighSec04SMM","HighSec05SMM","HWayCop01SMY","Marine01SMM","Marine01SMY","Marine02SMM","Marine02SMY","Marine03SMY","MerryWeatherCutscene","MPros01",
		"PrisGuard01SMM","Ranger01SFY","Ranger01SMY","ReqOfficer","Security","Security01SMM","SnowCop01SMM","SWAT01SMY","UndercoverCopCutscene","trafficWarden",
		"ExArmy","FibSec1","armoured","armoured2","armoured3","ciasec","fiboffice","fiboffice2","fibsec","highsec","highsec2","highsec3","highsec4","marine1",
		"marine2","prisguard","security","snowcop","armymech","blackops","blackops2","blackops3","hwaycop","marine1","marine2","marine3","ranger","sheriff","swat",
		"westsec","westsec2","fibarchitect"}		,		{"s_f_y_sheriff_01","s_m_y_sheriff_01","s_m_y_blackops_01","s_m_y_blackops_02","s_m_y_blackops_03","ig_casey",
		"s_m_m_ciasec_01","s_m_y_cop_01","s_f_y_cop_01","csb_cop","ig_fbisuit_01","a_f_y_femaleagent","u_m_m_fibarchitect","u_m_y_fibmugger_01","s_m_m_fiboffice_01",
		"s_m_m_fiboffice_02","mp_m_fibsec_01","s_m_m_fibsec_01","s_m_m_highsec_01","s_m_m_highsec_02","s_m_m_highsec_03","s_m_m_highsec_04","s_m_m_highsec_05",
		"s_m_y_hwaycop_01","s_m_m_marine_01","s_m_y_marine_01","s_m_m_marine_02","s_m_y_marine_02","s_m_y_marine_03","csb_mweather","mp_g_m_pros_01","s_m_m_prisguard_01",
		"s_f_y_ranger_01","s_m_y_ranger_01","ig_req_officer","ig_security_a","s_m_m_security_01","s_m_m_snowcop_01","s_m_y_swat_01","csb_undercover","ig_trafficwarden",
		"mp_m_exarmy_01","mp_m_fibsec_01","mp_s_m_armoured_01","s_m_m_armoured_01","s_m_m_armoured_02","s_m_m_ciasec_01","s_m_m_fiboffice_01","s_m_m_fiboffice_02",
		"s_m_m_fibsec_01","s_m_m_highsec_01","s_m_m_highsec_02","s_m_m_highsec_03","s_m_m_highsec_04","s_m_m_marine_01","s_m_m_marine_02","s_m_m_prisguard_01",
		"s_m_m_security_01","s_m_m_snowcop_01","s_m_y_armymech_01","s_m_y_blackops_01","s_m_y_blackops_02","s_m_y_blackops_03","s_m_y_hwaycop_01","s_m_y_marine_01",
		"s_m_y_marine_02","s_m_y_marine_03","s_m_y_ranger_01","s_m_y_sheriff_01","s_m_y_swat_01","s_m_y_westsec_01","s_m_y_westsec_02","u_m_m_fibarchitect"}


ShpShft:add_array_item("Turn Back Into"		,	MPk		,function()return Sx	end,function(n)Sx	=n set_model_hash(joaat(MPv		[n]))localplayer:set_godmode(false)	end)
ShpShft:add_array_item("Become Animal"		,	ANMk	,function()return Ani	end,function(n)Ani	=n set_model_hash(joaat(ANMv	[n]))localplayer:set_godmode(true)	end)
ShpShft:add_array_item("Become Alien"		,	CosPk	,function()return Cos	end,function(n)Cos	=n set_model_hash(joaat(CosPv	[n]))localplayer:set_godmode(true)	end)
ShpShft:add_array_item("Become Bird"		,	BRDk	,function()return Birdy	end,function(n)Birdy=n set_model_hash(joaat(BRDv	[n]))								end)
ShpShft:add_array_item("Become Sea creature",	SCRek	,function()return Sea	end,function(n)Sea	=n set_model_hash(joaat(SCRev	[n]))								end)
ShpShft:add_array_item("Become Story Female",	FCHarStk,function()return FemSt	end,function(n)FemSt=n set_model_hash(joaat(FCHarStv[n]))								end)
ShpShft:add_array_item("Become Story Male"	,	MCHarStk,function()return mSt	end,function(n)mSt	=n set_model_hash(joaat(MCHarStv[n]))								end)
ShpShft:add_array_item("Become Female Ped"	,	FChark	,function()return FeC	end,function(n)FeC	=n set_model_hash(joaat(FCharv	[n]))								end)
ShpShft:add_array_item("Become Male Ped"	,	MChark	,function()return MaC	end,function(n)MaC	=n set_model_hash(joaat(MCharv	[n]))								end)
ShpShft:add_array_item("Female(CutScene)"	,	FCutSk	,function()return FCu	end,function(n)FCu	=n set_model_hash(joaat(FCutSv	[n]))								end)
ShpShft:add_array_item("Male(CutScene)"		,	MCutSk	,function()return MCu	end,function(n)MCu	=n set_model_hash(joaat(MCutSv	[n]))								end)
ShpShft:add_array_item("Female(GangMem)"	,	FGangk	,function()return FGn	end,function(n)FGn	=n set_model_hash(joaat(FGangv	[n]))								end)
ShpShft:add_array_item("Male(GangMem)"		,	MGangk	,function()return MGn	end,function(n)MGn	=n set_model_hash(joaat(MGangv	[n]))								end)
ShpShft:add_array_item("Become Law enforcer",	LAWk	,function()return Law	end,function(n)Law	=n set_model_hash(joaat(LAWv	[n]))								end)