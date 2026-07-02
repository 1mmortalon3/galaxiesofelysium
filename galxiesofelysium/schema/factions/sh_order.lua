FACTION.name = "The Seraphic Order"
FACTION.description = "Protectors of the Elysian Keys across the ages, scattered thin across every " ..
	"galaxy. Few remain, but their purpose never fades."
FACTION.color = Color(230, 230, 245)
FACTION.isDefault = false -- whitelist-only; grant access with the plywhitelist admin command
FACTION.models = {
	"models/player/police.mdl"
}
FACTION.weapons = {}
FACTION.pay = 55

-- Strengths: guardianship, ancient training, unwavering purpose.
-- Goal: ensure the Keys are used only when the time is right.

function FACTION:GetDefaultName(client)
	return "Seraph " .. tostring(math.random(100, 999))
end

function FACTION:OnCharacterCreated(client, character)
	local inventory = character:GetInventory()
	inventory:Add("seraphic_ward")
end

FACTION_ORDER = FACTION.index
