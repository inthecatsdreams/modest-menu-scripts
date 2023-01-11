-- https://dsc.gg/l7neg-
--©️ 2023 L7NEG#0743
require_game_build(2802)
local WH = script("am_mp_warehouse")
local function Cloop(bool)
	while bool do
		if WH:is_active() then
			menu.send_key_up(83)
			menu.send_key_press(69)
			sleep(3)
			if not WH:is_active() then
				menu.send_key_press(13)
				menu.send_key_down(83)
			end
		end
	end
end
menu.add_toggle("Automatic Sell Crate Afk", function()
	return boolcl
end, function()
	boolcl = not boolcl
	Cloop(boolcl)
	
end)


