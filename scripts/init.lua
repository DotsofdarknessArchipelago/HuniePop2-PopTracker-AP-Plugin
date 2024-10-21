-- entry point for all lua code of the pack
-- more info on the lua API: https://github.com/black-sliver/PopTracker/blob/master/doc/PACKS.md#lua-interface
ENABLE_DEBUG_LOG = true
-- get current variant
local variant = Tracker.ActiveVariantUID
-- check variant info
IS_ITEMS_ONLY = variant:find("itemsonly")

print("-- Example Tracker --")
print("Loaded variant: ", variant)
if ENABLE_DEBUG_LOG then
    print("Debug logging is enabled!")
end

-- Utility Script for helper functions etc.
ScriptHost:LoadScript("scripts/utils.lua")

-- Logic
ScriptHost:LoadScript("scripts/logic/logic.lua")

-- Custom Items
ScriptHost:LoadScript("scripts/custom_items/class.lua")
ScriptHost:LoadScript("scripts/custom_items/progressiveTogglePlus.lua")
ScriptHost:LoadScript("scripts/custom_items/progressiveTogglePlusWrapper.lua")

-- Items
Tracker:AddItems("items/items.jsonc")

if not IS_ITEMS_ONLY then -- <--- use variant info to optimize loading
    -- Maps
    Tracker:AddMaps("maps/maps.jsonc")
    -- Locations
    Tracker:AddLocations("locations/abia.json")
    Tracker:AddLocations("locations/ashley.json")
    Tracker:AddLocations("locations/brooke.json")
    Tracker:AddLocations("locations/candace.json")
    Tracker:AddLocations("locations/jessie.json")
    Tracker:AddLocations("locations/lailani.json")
    Tracker:AddLocations("locations/lillian.json")
    Tracker:AddLocations("locations/lola.json")
    Tracker:AddLocations("locations/nora.json")
    Tracker:AddLocations("locations/polly.json")
    Tracker:AddLocations("locations/sarah.json")
    Tracker:AddLocations("locations/zoey.json")
end

-- Layout
Tracker:AddLayouts("layouts/items.jsonc")
Tracker:AddLayouts("layouts/pairs.json")
Tracker:AddLayouts("layouts/girls.json")
Tracker:AddLayouts("layouts/unique.json")
Tracker:AddLayouts("layouts/shoes.json")
Tracker:AddLayouts("layouts/wings.json")
Tracker:AddLayouts("layouts/outfit.json")
Tracker:AddLayouts("layouts/misc.json")
Tracker:AddLayouts("layouts/tracker.jsonc")
Tracker:AddLayouts("layouts/broadcast.jsonc")

-- AutoTracking for Poptracker
if PopVersion and PopVersion >= "0.18.0" then
    ScriptHost:LoadScript("scripts/autotracking.lua")
end
