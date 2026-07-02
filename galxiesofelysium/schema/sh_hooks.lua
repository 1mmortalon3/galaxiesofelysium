-- Shared (client + server) schema-wide gamemode hooks.

function SCHEMA:GetDefaultAttributePoints(client, count)
	return 30 -- starting attribute points every new character gets to spend
end

-- Cosmetic: recolor the HUD scoreboard slightly toward the "Elysiyum" purple/blue theme.
function SCHEMA:GetPlayerIcon(client)
	-- return a material path here if you add a custom scoreboard icon set
end
