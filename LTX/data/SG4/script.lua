-- Copyright (c) 2007-2020 Freeciv21 and Freeciv contributors. This file is
--   part of Freeciv21. Freeciv21 is free software: you can redistribute it
--   and/or modify it under the terms of the GNU General Public License
--   as published by the Free Software Foundation, either version 3
--   of the License,  or (at your option) any later version.
--   You should have received a copy of the GNU General Public License
--   along with Freeciv21. If not, see https://www.gnu.org/licenses/.

-- This file is for lua-functionality that is specific to a given
-- ruleset. When freeciv loads a ruleset, it also loads script
-- file called 'default.lua'. The one loaded if your ruleset
-- does not provide an override is default/default.lua.


-- Place Ruins at the location of the destroyed city.
function city_destroyed_callback(city, loser, destroyer)
  city.tile:create_extra("Ruins", NIL)
  -- continue processing
  return false
end

signal.connect("city_destroyed", "city_destroyed_callback")

-- Check if there is certain terrain in ANY CAdjacent tile.
function adjacent_to(tile, terrain_name)
  for adj_tile in tile:circle_iterate(1) do
    if adj_tile.id ~= tile.id then
      local adj_terr = adj_tile.terrain
      local adj_name = adj_terr:rule_name()
      if adj_name == terrain_name then
        return true
      end
    end
  end
  return false
end

-- Check if there is certain terrain in ALL CAdjacent tiles.
function surrounded_by(tile, terrain_name)
  for adj_tile in tile:circle_iterate(1) do
    if adj_tile.id ~= tile.id then
      local adj_terr = adj_tile.terrain
      local adj_name = adj_terr:rule_name()
      if adj_name ~= terrain_name then
        return false
      end
    end
  end
  return true
end

-- Add random labels to the map.
function place_map_labels()
  local rivers = 0
  local deeps = 0
  local oceans = 0
  local lakes = 0
  local swamps = 0
  local glaciers = 0
  local tundras = 0
  local deserts = 0
  local plains = 0
  local grasslands = 0
  local jungles = 0
  local forests = 0
  local hills = 0
  local mountains = 0

  local selected_river = 0
  local selected_deep = 0
  local selected_ocean = 0
  local selected_lake = 0
  local selected_swamp = 0
  local selected_glacier = 0
  local selected_tundra = 0
  local selected_desert = 0
  local selected_plain = 0
  local selected_grassland = 0
  local selected_jungle = 0
  local selected_forest = 0
  local selected_hill = 0
  local selected_mountain = 0

  -- Count the tiles that has a terrain type that may get a label.
  for place in whole_map_iterate() do
    local terr = place.terrain
    local tname = terr:rule_name()

    if place:has_extra("River") then
      rivers = rivers + 1
    elseif tname == "Deep Ocean" then
      deeps = deeps + 1
    elseif tname == "Ocean" then
      oceans = oceans + 1
    elseif tname == "Lake" then
      lakes = lakes + 1
    elseif tname == "Swamp" then
      swamps = swamps + 1
    elseif tname == "Glacier" then
      glaciers = glaciers + 1
    elseif tname == "Tundra" then
      tundras = tundras + 1
    elseif tname == "Desert" then
      deserts = deserts + 1
    elseif tname == "Plains" then
      plains = plains + 1
    elseif tname == "Grassland" then
      grasslands = grasslands + 1
    elseif tname == "Jungle" then
      jungles = jungles + 1
    elseif tname == "Forest" then
      forests = forests + 1
    elseif tname == "Hills" then
      hills = hills + 1
    elseif tname == "Mountains" then
      mountains = mountains + 1
    end
  end

  -- Decide if a label should be included and, in case it should, where.
    if random(1, 100) <= rivers then
      selected_river = random(1, rivers)
    end
    if random(1, 100) <= deeps then
      selected_deep = random(1, deeps)
    end
    if random(1, 100) <= oceans then
      selected_ocean = random(1, oceans)
    end
    if random(1, 100) <= lakes then
      selected_lake = random(1, lakes)
    end
    if random(1, 100) <= swamps then
      selected_swamp = random(1, swamps)
    end
    if random(1, 100) <= glaciers then
      selected_glacier = random(1, glaciers)
    end
    if random(1, 100) <= tundras then
      selected_tundra = random(1, tundras)
    end
    if random(1, 100) <= deserts then
      selected_desert = random(1, deserts)
    end
    if random(1, 100) <= plains then
      selected_plain = random(1, plains)
    end
    if random(1, 100) <= grasslands then
      selected_grassland = random(1, grasslands)
    end
    if random(1, 100) <= jungles then
      selected_jungle = random(1, jungles)
    end
    if random(1, 100) <= forests then
      selected_forest = random(1, forests)
    end
    if random(1, 100) <= hills then
      selected_hill = random(1, hills)
    end
    if random(1, 100) <= mountains then
      selected_mountain = random(1, mountains)
    end

  -- Place the included labels at the location determined above.
  for place in whole_map_iterate() do
    local terr = place.terrain
    local tname = terr:rule_name()

    if place:has_extra("River") then
      selected_river = selected_river - 1
      if selected_river == 0 then
        if tname == "Hills" then
          place:set_label(_("Grand Canyon"))
        elseif tname == "Mountains" then
          place:set_label(_("Deep Gorge"))
        elseif tname == "Tundra" then
          place:set_label(_("Fjords"))
        elseif random(1, 100) <= 50 then
          place:set_label(_("Waterfalls"))
        else
          place:set_label(_("Travertine Terraces"))
        end
      end
    elseif tname == "Deep Ocean" then
      selected_deep = selected_deep - 1
      if selected_deep == 0 then
        if random(1, 100) <= 50 then
          place:set_label(_("Deep Trench"))
        else
          place:set_label(_("Thermal Vent"))
        end
      end
    elseif tname == "Ocean" then
      selected_ocean = selected_ocean - 1
      if selected_ocean == 0 then
        if surrounded_by(place, "Ocean") then
          place:set_label(_("Atoll Chain"))
        elseif adjacent_to(place, "Deep Ocean") then
          place:set_label(_("Great Barrier Reef"))
        else
          -- Coast
          place:set_label(_("Great Blue Hole"))
        end
      end
    elseif tname == "Lake" then
      selected_lake = selected_lake - 1
      if selected_lake == 0 then
        if surrounded_by(place, "Lake") then
          place:set_label(_("Great Lakes"))
        elseif not adjacent_to(place, "Lake") then
          -- Isolated
          place:set_label(_("Dead Sea"))
        else
          place:set_label(_("Rift Lake"))
        end
      end
    elseif tname == "Swamp" then
      selected_swamp = selected_swamp - 1
      if selected_swamp == 0 then
        if not adjacent_to(place, "Swamp") then
          place:set_label(_("Grand Prismatic Spring"))
        elseif adjacent_to(place, "Ocean") then
          place:set_label(_("Mangrove Forest"))
        else
          place:set_label(_("Cenotes"))
        end
      end
    elseif tname == "Glacier" then
      selected_glacier = selected_glacier - 1
      if selected_glacier == 0 then
        if surrounded_by(place, "Glacier") then
          place:set_label(_("Ice Sheet"))
        elseif not adjacent_to(place, "Glacier") then
          place:set_label(_("Frozen Lake"))
        elseif adjacent_to(place, "Ocean") then
          place:set_label(_("Glacier Bay"))
        else
          place:set_label(_("Advancing Glacier"))
        end
      end
    elseif tname == "Tundra" then
      selected_tundra = selected_tundra - 1
      if selected_tundra == 0 then
          place:set_label(_("Geothermal Area"))
      end
    elseif tname == "Desert" then
      selected_desert = selected_desert - 1
      if selected_desert == 0 then
        if surrounded_by(place, "Desert") then
          place:set_label(_("Sand Sea"))
        elseif not adjacent_to(place, "Desert") then
          place:set_label(_("Salt Flat"))
        elseif random(1, 100) <= 50 then
          place:set_label(_("Singing Dunes"))
        else
          place:set_label(_("White Desert"))
        end
      end
    elseif tname == "Plains" then
      selected_plain = selected_plain - 1
      if selected_plain == 0 then
        if adjacent_to(place, "Ocean") then
          place:set_label(_("Long Beach"))
        elseif random(1, 100) <= 50 then
          place:set_label(_("Mud Volcanoes"))
        else
          place:set_label(_("Rock Pillars"))
        end
      end
    elseif tname == "Grassland" then
      selected_grassland = selected_grassland - 1
      if selected_grassland == 0 then
        if adjacent_to(place, "Ocean") then
          place:set_label(_("White Cliffs"))
        elseif random(1, 100) <= 50 then
          place:set_label(_("Giant Cave"))
        else
          place:set_label(_("Rock Formation"))
        end
      end
    elseif tname == "Jungle" then
      selected_jungle = selected_jungle - 1
      if selected_jungle == 0 then
        if surrounded_by(place, "Jungle") then
          place:set_label(_("Rainforest"))
        elseif adjacent_to(place, "Ocean") then
          place:set_label(_("Subterranean River"))
        else
          place:set_label(_("Sinkholes"))
        end
      end
    elseif tname == "Forest" then
      selected_forest = selected_forest - 1
      if selected_forest == 0 then
        if adjacent_to(place, "Mountains") then
          place:set_label(_("Stone Forest"))
        elseif random(1, 100) <= 50 then
          place:set_label(_("Sequoia Forest"))
        else
          place:set_label(_("Millenary Trees"))
        end
      end
    elseif tname == "Hills" then
      selected_hill = selected_hill - 1
      if selected_hill == 0 then
        if not adjacent_to(place, "Hills") then
          if adjacent_to(place, "Mountains") then
            place:set_label(_("Table Mountain"))
          else
            place:set_label(_("Inselberg"))
          end
        elseif random(1, 100) <= 50 then
          place:set_label(_("Karst Landscape"))
        else
          place:set_label(_("Valley of Geysers"))
        end
      end
    elseif tname == "Mountains" then
      selected_mountain = selected_mountain - 1
      if selected_mountain == 0 then
        if surrounded_by(place, "Mountains") then
          place:set_label(_("Highest Peak"))
        elseif not adjacent_to(place, "Mountains") then
          place:set_label(_("Sacred Mount"))
        elseif adjacent_to(place, "Ocean") then
          place:set_label(_("Cliff Coast"))
        elseif random(1, 100) <= 50 then
          place:set_label(_("Active Volcano"))
        else
          place:set_label(_("High Summit"))
        end
      end
    end
  end
  return false
end

signal.connect("map_generated", "place_map_labels")

-- Utils

LuaUtils = {}

function LuaUtils:log(level, fmt, ...)
  log.base(level, string.format("LuaUtils: " .. fmt, ...))
end

function LuaUtils:debug(fmt, ...)
  self:log(log.level.DEBUG, "[DEBUG] " .. fmt, ...)
end

function LuaUtils:info(fmt, ...)
  self:log(log.level.NORMAL, "[INFO] " .. fmt, ...)
end

function LuaUtils.dump(obj)
  local result = "{ "
  for key, value in pairs(obj) do
    result = result .. "[" .. tostring(key) .. "] = " .. tostring(value) .. ", "
  end
  result = result .. "}"
  return result
end

function LuaUtils.find_city(player, city_name)
  if not player then return nil end
  if not city_name then return nil end
  for city in player:cities_iterate() do
    if city.name == city_name then
      return city
    end
  end
  return nil
end

function LuaUtils.find_player_unit(player, unit_type)
  if not player then return nil end
  for unit in player:units_iterate() do
    if unit.utype:rule_name() == unit_type then
      return unit
    end
  end
  return nil
end

function LuaUtils:populate_transport(transport, unit_list)
  self:debug("Populating transport %s with %s", transport, unit_list)
  local player = transport.owner
  local tile = transport.tile
  local full_hp = -1
  local full_moves = -1
  local green = 0
  for i, unit_data in ipairs(unit_list) do
    local unit_type = find.unit_type(unit_data.utype)
    local count = unit_data.count or 1
    local veteran = unit_data.veteran or green
    local homecity = self.find_city(player, unit_data.homecity)
    local moves_left = unit_data.moves_left or full_moves
    local hp_left = unit_data.hp or full_hp
    for j = 1, count do
      local unit = edit.create_unit_full(player, tile, unit_type, veteran,
        homecity, moves_left, hp_left, transport)
      self:debug("Spawned passenger %s", unit)
    end
  end
  self:debug("Transport populated")
end

function LuaUtils:spawn_units(owner, unit_list, tile)
  self:debug("Spawning %s for %s at (%d, %d)",
    unit_list, owner, tile.x, tile.y)
  local full_hp = -1
  local full_moves = -1
  local green = 0
  for i, unit_data in ipairs(unit_list) do
    local unit_type = find.unit_type(unit_data.utype)
    local count = unit_data.count or 1
    local veteran = unit_data.veteran or green
    local homecity = self.find_city(owner, unit_data.homecity)
    local moves_left = unit_data.moves_left or full_moves
    local hp_left = unit_data.hp or full_hp
    local passengers = unit_data.passengers or {}
    for j = 1, count do
      local unit = edit.create_unit_full(owner, tile, unit_type, veteran,
        homecity, moves_left, hp_left, nil)
      self:debug("Spawned %s", unit)
      if passengers then
        self:populate_transport(unit, passengers)
      else
        self:debug("No passengers")
      end
    end
  end
  self:debug("Finished spawning units")
end

-- SG4-specific scripts

SG4 = {
  spawn_tiles = {
    Blauwal = { 1, 106 },
    Houroftheowl = { 3, 108 },
    Sketlux = { 5, 110 },
    XHawk87 = { 7, 112 },
    Corbeau = { 9, 114 },
    El_perdedor = { 11, 116 },
    Shoilf = { 13, 118 },
    L1meE = { 15, 120 },
    Blabber = { 17, 122 },
    Croupier = { 19, 124 }
  },
  initial_wave = {
    {
      utype = "Galleon",
      count = 4,
      moves_left = 650,
      passengers = {
        { utype = "Settlers" },
        { utype = "Workers" },
        { utype = "Migrants" },
        { utype = "Musketeers" }
      }
    }
  },
  migrant_wave = {
    {
      utype = "Galleon",
      count = 4,
      moves_left = 750,
      passengers = {
        { utype = "Immigrants" },
        { utype = "Immigrants" },
        { utype = "Workers",   veteran = 1 },
        { utype = "Workers",   veteran = 1 }
      }
    }
  }
}

function SG4:log(level, fmt, ...)
  log.base(level, string.format("SG4: " .. fmt, ...))
end

function SG4:debug(fmt, ...)
  self:log(log.level.DEBUG, "[DEBUG] " .. fmt, ...)
end

function SG4:info(fmt, ...)
  self:log(log.level.NORMAL, "[INFO] " .. fmt, ...)
end

function SG4:make_room_for_migrant_ship(player, tile)
  if tile:is_enemy(player) then
    for unit in tile:units_iterate() do
      self:info("%s was killed for blocking migrant spawn at (%d, %d)",
        unit, tile.x, tile.y)
      notify.event(unit.owner, unit.tile, E.UNIT_LOST_MISC,
        _("Your unit accidentally collided with a migrant vessel and sunk."))
      unit:kill("killed")
    end
  end
  if tile.terrain.rule_name ~= "Deep Ocean" then
    tile:change_terrain(find.terrain("Deep Ocean"))
  end
end

function SG4:spawn_player_migrant_wave(player, wave, tile)
  self:debug("Spawning migrant wave for %s", player)
  self:make_room_for_migrant_ship(player, tile)
  LuaUtils:spawn_units(player, wave, tile)
  notify.event(player, tile, E.UNIT_RELOCATED,
    _("A group of immigrants are arriving from home."))
end

function SG4:spawn_migrant_wave(wave)
  self:info("Spawning migrant wave")
  for player in players_iterate() do
    local tile = self:get_spawn_tile(player)
    if tile and player.is_alive then
      self:spawn_player_migrant_wave(player, wave, tile)
      self:info("Migrant wave spawned at (%d, %d)", tile.x, tile.y)
    else
      self:info("%s has no spawn tile. Skipping!", player)
    end
  end
  self:info("Migrant wave spawn complete")
end

function SG4:set_spawn_tile(player, tile)
  if not player then return end
  if not tile then return end
  _G[string.format("sg4_spawn_tile_%d", player.id)] = tile.id
end

function SG4:get_spawn_tile(player)
  if not player then return nil end
  self:debug("Get spawn tile for %s name=%s", player, player.name)
  local spawn_tile = _G[string.format("sg4_spawn_tile_%d", player.id)] or
      self.spawn_tiles[player.name]
  if type(spawn_tile) == "number" then
    self:debug("Found stored tile ID %d", spawn_tile)
    return find.tile(spawn_tile)
  elseif type(spawn_tile) == "table" then
    self:debug("Found default tile %s", LuaUtils.dump(spawn_tile))
    return find.tile(spawn_tile[1], spawn_tile[2])
  end
  self:debug("Didn't find a valid tile %s", spawn_tile)
  return nil
end

function SG4:clean_up_excess_start_units()
  for tile in whole_map_iterate() do
    for unit in tile:units_iterate() do
      if unit.utype:rule_name() == "Diplomat" then
        unit:kill("editor")
      end
    end
  end
end

function SG4:turn_events(turn)
  if turn == 1 then
    self:debug("spawn_tiles = %s", LuaUtils.dump(self.spawn_tiles))
    self:spawn_migrant_wave(self.initial_wave)
    self:clean_up_excess_start_units()
  elseif turn == 10 then
    self:spawn_migrant_wave(self.migrant_wave)
  end
end

function SG4OnTurnBegin(turn, year)
  SG4:turn_events(turn)
end

signal.connect("turn_begin", "SG4OnTurnBegin")
