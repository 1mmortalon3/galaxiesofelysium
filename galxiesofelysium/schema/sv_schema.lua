-- Server-only miscellaneous schema functions.

-- Load saved Key standings on startup so a server restart doesn't reset progress.
function SCHEMA:InitializedSchema()
	ELYSIYUM.holders = ix.data.Get("elysiyum_keyHolders", {}, false, true)

	ix.command.Add("keys", {
		description = "Shows which faction currently holds each of the six Elysian Keys.",
		OnRun = function(self, client)
			client:ChatNotify("--- Elysian Key Standings ---")

			for _, galaxy in ipairs(ELYSIYUM.galaxies) do
				local holderIndex = ELYSIYUM.holders[galaxy.id]
				local faction = holderIndex and ix.faction.indices[holderIndex]
				local holderName = faction and faction.name or "Unclaimed"

				client:ChatNotify(galaxy.name .. ": " .. holderName)
			end
		end
	})
end

local function SaveKeyHolders()
	ix.data.Set("elysiyum_keyHolders", ELYSIYUM.holders, false, true)
end

-- Called from the Elysian Key item (schema/items/base/sh_keys.lua) when a character uses one.
-- galaxyID is one of the ids in ELYSIYUM.galaxies; character is the ix character claiming it.
function ELYSIYUM.ClaimKey(galaxyID, character)
	local factionIndex = character:GetFaction()
	local faction = ix.faction.indices[factionIndex]

	if (not faction) then return end

	ELYSIYUM.holders[galaxyID] = factionIndex
	SaveKeyHolders()

	ix.chat.Send(nil, "raw", faction.name .. " has claimed the Key of " .. galaxyID:upper() .. "!" ..
		" (" .. character:GetName() .. ")")

	ELYSIYUM.CheckConvergence()
end

-- If a single faction ever holds every Key at once, the "Convergence" fires: a server-wide event and
-- a credit reward for every online member of that faction, then the board resets for a new Age.
function ELYSIYUM.CheckConvergence()
	local total = #ELYSIYUM.galaxies
	local counts = {}

	for _, held in pairs(ELYSIYUM.holders) do
		counts[held] = (counts[held] or 0) + 1
	end

	for factionIndex, count in pairs(counts) do
		if (count >= total) then
			local faction = ix.faction.indices[factionIndex]
			if (not faction) then continue end

			ix.chat.Send(nil, "raw", "*** CONVERGENCE *** The " .. faction.name ..
				" now hold every Elysian Key. A new Age begins.")

			for client, character in ix.util.GetCharacters() do
				if (character:GetFaction() == factionIndex) then
					character:SetMoney(character:GetMoney() + 500)
				end
			end

			-- Reset the board for a new Age. Comment this out if you'd rather the winning
			-- faction keep permanent control instead of starting a new cycle.
			ELYSIYUM.holders = {}
			SaveKeyHolders()

			break
		end
	end
end

