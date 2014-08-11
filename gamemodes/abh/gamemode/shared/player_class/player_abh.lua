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

-- Load player class
AddCSLuaFile ()
DEFINE_BASECLASS ("player_default")

-- Prepare class variable
local PLAYER = {}

-- Empty out player loadout
function PLAYER:Loadout ()
	self.Player:StripWeapons ()
end

local JUMPING
function PLAYER:StartMove (move)
	
	-- Only apply the jump boost in FinishMove if the player has jumped during this frame
	-- Using a global variable is safe here because nothing else happens between SetupMove and FinishMove
	if bit.band (move:GetButtons(), IN_JUMP) ~= 0 and bit.band (move:GetOldButtons(), IN_JUMP) == 0 and self.Player:OnGround () then
		JUMPING = true
	end
end

function PLAYER:FinishMove (move)
	-- If the player has jumped this frame
	if JUMPING then
		-- Get their orientation
		local forward = self.Player:EyeAngles ()
		forward.p = 0
		forward = forward:Forward ()
		
		-- Compute the speed boost
		
		-- HL2 normally provides a much weaker jump boost when sprinting
		-- For some reason this never applied to GMod, so we won't perform
		-- this check here to preserve the "authentic" feeling
		local speedBoostPerc = ((not self.Player:Crouching()) and 0.5) or 0.1
		
		local speedAddition = math.abs (move:GetForwardSpeed() * speedBoostPerc)
		local maxSpeed = move:GetMaxSpeed () * (1 + speedBoostPerc)
		local newSpeed = speedAddition + move:GetVelocity ():Length2D ()
		
		-- Clamp it to make sure they can't bunnyhop to ludicrous speed
		if newSpeed > maxSpeed then
			speedAddition = speedAddition - (newSpeed - maxSpeed)
		end
		
		-- Reverse it if the player is running backwards
		if move:GetForwardSpeed () < 0 then
			speedAddition = -speedAddition
		end
		
		-- Apply the speed boost
		move:SetVelocity (forward * speedAddition + move:GetVelocity ())
	end

	JUMPING = nil	
end

player_manager.RegisterClass ("player_abh", PLAYER, "player_default")