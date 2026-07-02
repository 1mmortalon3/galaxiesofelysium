FACTION.name = "The AI Collectives"
FACTION.description = "Advanced synthetic civilizations spread throughout the galaxies, with agendas " ..
	"beyond organic understanding. Some seek harmony, others transcendence."
FACTION.color = Color(90, 150, 255)
FACTION.isDefault = false -- whitelist-only; these are meant to be rare
FACTION.models = {
	"models/player/combine_super_soldier.mdl"
}
FACTION.weapons = {}
FACTION.pay = 30

-- Strengths: computation, unity, transcendence.
-- Goal: evolve beyond limitations and understand existence.

function FACTION:GetDefaultName(client)
	return "Unit-" .. tostring(math.random(1000, 9999))
end

function FACTION:OnCharacterCreated(client, character)
	local inventory = character:GetInventory()
	inventory:Add("collective_core")
end

FACTION_COLLECTIVE = FACTION.index
