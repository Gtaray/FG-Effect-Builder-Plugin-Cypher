function createEffectString()
	return string.format("CONVERT(%s, %s): %s",
		effect[1],
		source_stat.getStringValue() or "",
		result_stat.getStringValue() or "");
end