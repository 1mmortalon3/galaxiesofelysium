-- A self-contained base for single-use consumable items. Any item that should use this base must be
-- placed in a subfolder of items/ that matches this file's name minus the "sh_" prefix and extension -
-- in this case, items/consumables/.

ITEM.name = "Consumable"
ITEM.description = "A single-use item."
ITEM.width = 1
ITEM.height = 1

ITEM.functions.use = {
	name = "Use",
	tip = "useTip",
	icon = "icon16/heart.png",
	OnRun = function(item)
		return true -- returning true removes one from the stack / deletes the item
	end,
	OnCanRun = function(item)
		return not IsValid(item.entity)
	end
}
