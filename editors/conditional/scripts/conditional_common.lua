function createEffectString()
	if not (effect and effect[1]) then
		return "";
	end

	local sInvert = "";
	if effect_invert.getValue() == 1 then
		sInvert = "NOT ";
	end

	local sConditions = ""
	if operation_value then
		local sOp = operation_value.getStringValue()
		local sVal = number_value.getStringValue();

		if operand_type and operand_type.getStringValue() == "max" then
			sVal = "max";
		end

		if sOp then
			sConditions = string.format("(%s%s)", sOp, sVal);
		end
	end

	return string.format("%s: %s%s%s", 
		conditional_value.getStringValue(), 
		sInvert, 
		effect[1],
		sConditions);
end