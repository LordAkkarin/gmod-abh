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

-- Includes
include ("../shared/init.lua")

-- Load base
DEFINE_BASECLASS( "gamemode_base" )

--
-- Initializes the Gamemode
--
function GM:Initialize()
	surface.CreateFont ("Speed", {
		font = "Verdana",
		size = 60,
		weight = 0,
		antialias = true,
		additive = true
	})
	
	surface.CreateFont ("SpeedGlow", {
		font = "Verdana",
		size = 60,
		weight = 0,
		blursize = 8,
		scanlines = 2,
		antialias = true,
		aditive = true
	})
	
	surface.CreateFont ("SpeedHeadline", {
		font = "Verdana",
		size = 30,
		weight = 0,
		antialias = true,
		additive = true
	})
	
	surface.CreateFont ("SpeedHeadlineGlow", {
		font = "Verdana",
		size = 30,
		weight = 0,
		blursize = 8,
		scanlines = 2,
		antialias = true,
		aditive = true
	})
end

--
-- HUD
--
function GM:HUDPaint()
	-- Draw all of the default stuff
	-- BaseClass.HUDPaint (self)
	
	-- draw UPS
	self:DrawUPS ()
end

--
-- Draws the UPS panel
--
function GM:DrawUPS ()
	-- get player & velocity
	local ply = Player (LocalPlayer ():UserID ())
	local velocity = ply:GetVelocity ():Length ();
	
	-- create text
	local text = "" .. math.Round (velocity)
	
	-- calculate position
	local x = (ScrW () / 2)
	local y = ScrH ()
	local margin = 20
	
	local colorA = Color (255, 255, 255, 80)
	local colorB = Color (255, 255, 255, 150)
	
	-- calculate size
	surface.SetFont ("SpeedHeadlineGlow")
	surface.SetFont ("SpeedGlow")
	
	-- draw text
	draw.DrawText ("Speed", "SpeedHeadlineGlow", x, (y - (margin * 4)), colorA, TEXT_ALIGN_CENTER)
	draw.DrawText (text, "SpeedGlow", x, (y - margin - 40), colorA, TEXT_ALIGN_CENTER)
	
	-- calculate size
	surface.SetFont ("SpeedHeadline")
	surface.SetFont ("Speed")
	
	-- draw text
	draw.DrawText ("Speed", "SpeedHeadline", x, (y - (margin * 4)), colorB, TEXT_ALIGN_CENTER)
	draw.DrawText (text, "Speed", x, (y - margin - 40), colorB, TEXT_ALIGN_CENTER)
end

function GM:HUDShouldDraw (name)
	for k, v in pairs({"CHudHealth", "CHudBattery", "CHudAmmo", "CHudSecondaryAmmo", })do
		if name == v then return false end
	end
	
	return true
end