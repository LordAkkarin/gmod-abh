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

-- Register Classes
include ("player_class/player_abh.lua")

-- Register gamemode baseclass
DEFINE_BASECLASS ("gamemode_base")

-- Set gamemode properties
GM.Name 	= "ABH"
GM.Author 	= "Johannes Donath"
GM.Email 	= "johannesd@evil-co.com"
GM.Website 	= "https://github.com/LordAkkarin/gm-abh"

--[[---------------------------------------------------------
   Name: gamemode:PlayerSpawn( )
   Desc: Called when a player spawns
-----------------------------------------------------------]]
function GM:PlayerSpawn (pl)
	-- set player class
	player_manager.SetPlayerClass (pl, "player_abh")
	
	-- disable collisions
	pl:SetNoCollideWithTeammates (true)
	pl:SetTeam (1)
	
	-- call parent
	BaseClass.PlayerSpawn (self, pl)
end