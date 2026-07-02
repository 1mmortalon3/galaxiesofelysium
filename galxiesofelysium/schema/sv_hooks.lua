-- Server-only schema-wide gamemode hooks.

-- Give every fresh character a starting credit stipend regardless of faction.
function SCHEMA:OnCharacterCreated(client, character)
	character:SetMoney(character:GetMoney() + 250)
end

-- Simple welcome message pointing new players at the lore.
function SCHEMA:PlayerLoadedCharacter(client, character, lastChar)
	client:ChatNotify("Welcome to the Galaxies of Elysiyum. Type /factions to see the seven civilizations.")
end
