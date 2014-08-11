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

-- Set convars

-- Ensure that garry doesn't fuck us over
RunConsoleCommand ("sv_sticktoground", "0")

-- Fix gravity settings
if GetConVar ("abh_fixgravity"):GetBool () then RunConsoleCommand ("sv_gravity", "800") end -- Fix gravity

-- Ensure the max speed is close to Half_life 2's defaults (Note: Half-Life 2 uses 3500 however this seems to be slightly too slow for gmod)
if GetConVar ("abh_fixmaxvelocity"):GetBool () then RunConsoleCommand ("sv_maxvelocity", "4000") end

--
-- Disables fall damage
--
function GM:GetFallDamage (ply, speed)
	return 0
end

--
-- Handles team switches
--
function GM:PlayerButtonDown (ply, btn)
	if btn == 58 then
		if ply:Team () == TEAM_SPECTATOR then
			ply:SetTeam (TEAM_RUNNERS)
			ply:Spawn ()
		else
			ply:SetTeam (TEAM_SPECTATOR)
			GAMEMODE:PlayerSpawnAsSpectator (ply)
		end
	end
end