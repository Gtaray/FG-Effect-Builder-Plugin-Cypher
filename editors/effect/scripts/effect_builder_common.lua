function createEffectString()
	local aFilters = {};
	if stat_value then
		local sStat = stat_value.getStringValue()
		if (sStat or "") ~= "" then
			table.insert(aFilters, sStat)
		end
	end

	if rolltype_value then
		local sRollType = rolltype_value.getStringValue();
		if (sRollType or "") ~= "" then
			table.insert(aFilters, sRollType)
		end
	end

	if attackrange_value then
		local sAttackRange = attackrange_value.getStringValue();
		if (sAttackRange or "") ~= "" then
			table.insert(aFilters, sAttackRange);
		end
	end

	if weapontype_value then
		local sWeaponType = weapontype_value.getStringValue();
		if (sWeaponType or "") ~= "" then
			table.insert(aFilters, sWeaponType);
		end
	end

	if skill then
		local sSkill = skill.getValue();
		if (sSkill or "") ~= "" then
			table.insert(aFilters, sSkill);
		end
	end

	if damage_types then
		local sDmgTypes = damage_types.getStringValue();
		if (sDmgTypes or "") ~= "" then
			table.insert(aFilters, sDmgTypes)
		end
	end

	if overflow and overflow.getValue() == 0 then
		table.insert(aFilters, "single");
	end

	if pierce and pierce.getValue() == 1 then
		table.insert(aFilters, "pierce");
	end

	if not (effect and effect[1]) then
		return "";
	end

	local sEffect = effect[1];
	local sNumber = "";

	if number_value then
		sNumber = number_value.getStringValue()
	end

	if sNumber ~= "" or #aFilters > 0 then
		sEffect = sEffect .. ":"

		if sNumber ~= "" then
			sEffect = string.format("%s %s", sEffect, sNumber); 
		end
		if #aFilters > 0 then
			sEffect= string.format("%s %s", 
				sEffect,
				table.concat(aFilters, ", ") or "");
		end
	end

	return sEffect;
end
