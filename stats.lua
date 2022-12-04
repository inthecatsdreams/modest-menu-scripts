-- reference https://vespura.com/fivem/gta-stats/

local function mpx()
    return stats.get_int("MPPLY_LAST_MP_CHAR")
end

local function Text(text)
    menu.add_action(text, function() end)
end

Text(">Player stats Increase<")

menu.add_int_range("Stamina", 1, 0, 100, function()
    return stats.get_int("MP"..mpx().."_script_increase_stam")
end, function(value)
    stats.set_int(("MP")..mpx().."_script_increase_stam", value)
end)

menu.add_int_range("Srength", 1, 0, 100, function()
    return stats.get_int("MP"..mpx().."_script_increase_strn")
end, function(value)
    stats.set_int(("MP")..mpx().."_script_increase_strn", value)
end)

menu.add_int_range("Lung Capacity", 1, 0, 100, function()
    return stats.get_int("MP"..mpx().."_script_increase_lung")
end, function(value)
    stats.set_int(("MP")..mpx().."_script_increase_lung", value)
end)

menu.add_int_range("Driving", 1, 0, 100, function()
    return stats.get_int("MP"..mpx().."_script_increase_driv")
end, function(value)
    stats.set_int(("MP")..mpx().."_script_increase_driv", value)
end)

menu.add_int_range("Flying", 1, 0, 100, function()
    return stats.get_int("MP"..mpx().."_script_increase_fly")
end, function(value)
    stats.set_int(("MP")..mpx().."_script_increase_fly", value)
end)
menu.add_int_range("Shooting", 1, 0, 100, function()
    return stats.get_int("MP"..mpx().."_script_increase_sho")
end, function(value)
    stats.set_int(("MP")..mpx().."_script_increase_sho", value)
end)

menu.add_int_range("Mechanic", 1, 0, 100, function()
    return stats.get_int("MP"..mpx().."_script_increase_mech")
end, function(value)
    stats.set_int(("MP")..mpx().."_script_increase_mech", value)
end)

menu.add_int_range("Stealth", 1, 0, 100, function()
    return stats.get_int("MP"..mpx().."_script_increase_stl")
end, function(value)
    stats.set_int(("MP")..mpx().."_script_increase_stl", value)
end)

