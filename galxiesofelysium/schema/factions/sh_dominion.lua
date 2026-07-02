FACTION.name = "The Imperium Dominion"
FACTION.description = "A militaristic empire from the Orionis Cluster driven by control, order, and " ..
	"superiority. It seeks to unify the galaxies under one rule - by force if necessary."
FACTION.color = Color(180, 40, 40)
FACTION.isDefault = true
FACTION.models = {
	"models/player/combine_soldier.mdl",
	"models/player/combine_super_soldier.mdl"
}
FACTION.weapons = {} -- add default spawn weapon classnames here, e.g. {"weapon_pistol"}
FACTION.pay = 45 -- salary paid out per pay cycle (see ix.config "salaryInterval")

-- Strengths: military might, discipline, advanced war technology.
-- Goal: control the Elysian Keys and reshape the universe in the Dominion's image.

function FACTION:GetDefaultName(client)
	return "Legionnaire " .. tostring(math.random(1000, 9999))
end

function FACTION:OnCharacterCreated(client, character)
	local inventory = character:GetInventory()
	inventory:Add("dominion_sidearm")
end

FACTION_DOMINION = FACTION.index
