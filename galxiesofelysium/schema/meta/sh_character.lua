-- Extend the character meta table here. Kept intentionally minimal - add helper methods as your
-- schema grows (e.g. character:GetGalaxy(), character:GetReputation(), etc).

local character = ix.meta.character or {}

function character:GetHomeFactionName()
	local faction = ix.faction.indices[self:GetFaction()]
	return faction and faction.name or "Unknown"
end

ix.meta.character = character
