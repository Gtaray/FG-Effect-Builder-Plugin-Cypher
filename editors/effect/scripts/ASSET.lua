local function createAbilityEffectString()
    return parentcontrol.window.effect.getStringValue() .. ": " .. number_value.getStringValue()
end

local function createAbilityCheckEffectString()
    return "CHECK: " .. number_value.getStringValue() .. " " .. DataCommon.ability_stol[parentcontrol.window.effect.getStringValue()]
end


function createEffectString()
    return "ASSET: "
end
