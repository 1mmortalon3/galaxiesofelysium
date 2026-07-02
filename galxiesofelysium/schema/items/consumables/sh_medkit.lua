ITEM.name = "Field Medkit"
ITEM.description = "A cross-galactic standard trauma kit. Restores health when used."
ITEM.model = "models/healthkit.mdl"
ITEM.width = 1
ITEM.height = 1
ITEM.price = 60

ITEM.functions.use.OnRun = function(item)
	local client = item.player

	if (IsValid(client)) then
		client:SetHealth(math.min(client:Health() + 50, client:GetMaxHealth()))
	end

	return true
end
