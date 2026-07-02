FACTION.name = "The Zhyrin Enclaves"
FACTION.description = "Ancient custodians of secrets older than memory, hidden within the Zhyrin " ..
	"Nebula. Their motives are mysterious; their knowledge is beyond measure."
FACTION.color = Color(70, 200, 140)
FACTION.isDefault = true
FACTION.models = {
	"models/player/gman_high.mdl"
}
FACTION.weapons = {}
FACTION.pay = 38

-- Strengths: ancient technology, mysteries, deep foresight.
-- Goal: protect the ancient balance and the truths of the past.

function FACTION:GetDefaultName(client)
	return "Warden " .. tostring(math.random(1000, 9999))
end

function FACTION:OnCharacterCreated(client, character)
	local inventory = character:GetInventory()
	inventory:Add("enclave_relic_shard")
end

FACTION_ENCLAVES = FACTION.index
