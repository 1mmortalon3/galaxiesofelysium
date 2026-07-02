FACTION.name = "The Thalorian Clans"
FACTION.description = "Fierce, independent, and unpredictable warriors of the Thalorian Descent. They " ..
	"respect strength, loyalty, and the code of survival above all else."
FACTION.color = Color(200, 90, 30)
FACTION.isDefault = true
FACTION.models = {
	"models/player/breen.mdl"
}
FACTION.weapons = {}
FACTION.pay = 35

-- Strengths: combat prowess, resilience, resourcefulness.
-- Goal: freedom, honor, and the right to forge their own fate.

function FACTION:GetDefaultName(client)
	return "Clanborn " .. tostring(math.random(1000, 9999))
end

function FACTION:OnCharacterCreated(client, character)
	local inventory = character:GetInventory()
	inventory:Add("thalorian_blade")
end

FACTION_CLANS = FACTION.index
