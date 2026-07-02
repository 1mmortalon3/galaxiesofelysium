FACTION.name = "The Luminari Synod"
FACTION.description = "A council of scholars, priests, and visionaries from the Xandrale Belt who " ..
	"preserve knowledge and guide many worlds through wisdom."
FACTION.color = Color(220, 180, 90)
FACTION.isDefault = true
FACTION.models = {
	"models/player/kleiner.mdl",
	"models/player/eli.mdl"
}
FACTION.weapons = {}
FACTION.pay = 40

-- Strengths: knowledge, diplomacy, spiritual insight.
-- Goal: preserve balance and ensure knowledge is never misused.

function FACTION:GetDefaultName(client)
	return "Envoy " .. tostring(math.random(1000, 9999))
end

function FACTION:OnCharacterCreated(client, character)
	local inventory = character:GetInventory()
	inventory:Add("synod_datapad")
end

FACTION_SYNOD = FACTION.index
