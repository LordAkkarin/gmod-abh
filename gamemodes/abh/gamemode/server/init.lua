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
-- TODO: This is kinda dirty but there is currently no other way to set convars
RunConsoleCommand ("sv_sticktoground", "0") -- Disable Garry's fun killer
RunConsoleCommand ("sv_gravity", "800") -- You may want to disable this depending on your map
RunConsoleCommand ("sv_maxvelocity", "100000") -- Ensure ABH feels right

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