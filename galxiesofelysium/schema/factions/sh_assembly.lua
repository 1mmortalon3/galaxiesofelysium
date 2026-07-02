FACTION.name = "The Vyralis Assembly"
FACTION.description = "A coalition of frontier worlds from the Vyralis Expanse bound by innovation, " ..
	"exploration, and adaptation. They value freedom and progress above all."
FACTION.color = Color(140, 90, 220)
FACTION.isDefault = true
FACTION.models = {
	"models/player/alyx.mdl"
}
FACTION.weapons = {}
FACTION.pay = 42

-- Strengths: innovation, adaptability, frontier resilience.
-- Goal: push beyond limits and carve out a future without chains.

function FACTION:GetDefaultName(client)
	return "Pathfinder " .. tostring(math.random(1000, 9999))
end

function FACTION:OnCharacterCreated(client, character)
	local inventory = character:GetInventory()
	inventory:Add("assembly_scanner")
end

FACTION_ASSEMBLY = FACTION.index
