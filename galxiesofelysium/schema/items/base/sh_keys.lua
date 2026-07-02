-- Base for the six Elysian Keys. Items using this base must live in items/keys/ (matching this file's
-- name, sh_keys.lua, minus the "sh_" prefix and extension).
--
-- Each Key item should set ITEM.galaxy to the galaxy it belongs to (used by the Elysian Keys plugin
-- to track which faction currently holds it).

ITEM.name = "Elysian Key"
ITEM.description = "A key to Elysiyum. Use it to claim it for your faction."
ITEM.width = 1
ITEM.height = 1
ITEM.price = 0
ITEM.galaxy = "unknown"

ITEM.functions.claim = {
	name = "Claim for Faction",
	tip = "claimTip",
	icon = "icon16/star.png",
	OnRun = function(item)
		local client = item.player
		local character = IsValid(client) and client:GetCharacter()

		if (SERVER and character) then
			ELYSIYUM.ClaimKey(item.galaxy, character)
		end

		return true -- consumes the key item once claimed
	end,
	OnCanRun = function(item)
		return not IsValid(item.entity)
	end
}
