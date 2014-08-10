------------------------------------------------------------------------------
-- Copyright (C) 2014 Johannes Donath <johannesd@evil-co.com>               --
--                                                                          --
-- Licensed under the Apache License, Version 2.0 (the "License");          --
-- you may not use this file except in compliance with the License.         --
-- You may obtain a copy of the License at                                  --
--                                                                          --
--     http://www.apache.org/licenses/LICENSE-2.0                           --
--                                                                          --
-- Unless required by applicable law or agreed to in writing, software      --
-- distributed under the License is distributed on an "AS IS" BASIS,        --
-- WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. --
-- See the License for the specific language governing permissions and      --
-- limitations under the License.                                           --
------------------------------------------------------------------------------

-- Client Logic
AddCSLuaFile ("cl_init.lua") -- Required by gmod
AddCSLuaFile ("shared/init.lua")
AddCSLuaFile ("client/init.lua")
AddCSLuaFile ("shared/player_class/player_abh.lua")

-- Server logic
include ("shared/init.lua")
include ("server/init.lua")

-- Load base
DEFINE_BASECLASS( "gamemode_base" )