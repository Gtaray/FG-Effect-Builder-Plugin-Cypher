local index = 0
local emptyField = nil
local fields = {}
local fieldWidth = 100

local function createField()
    index = index + 1
    local newField = createControl(control[1], prefix[1] .. index)
    fields[newField] = true
    return newField
end

local function getFieldWidth(field)
    return field.getSize() + field.anchored[1].left[1].offset[1]
end

function onInit()
    emptyField = createField()
    fieldWidth = getFieldWidth(emptyField)
end

function selectionUpdated(updatedField)
	-- If the control has the <single /> element, then don't add
	if parentcontrol.single then
		return;
	end

    if updatedField == emptyField then
        if not updatedField.isEmpty() then
            emptyField = createField()
            local width = getSize()
            parentcontrol.setAnchoredWidth(width + fieldWidth)
        end
    else
        if updatedField.isEmpty() then
            emptyField.destroyCombobox()
            fields[emptyField] = nil
            emptyField = updatedField
            local width = getSize()
            parentcontrol.setAnchoredWidth(width - fieldWidth)
        end
    end
    getFieldWidth(emptyField)
end

function getStringValue()
    local fieldList = {}
    for field in pairs(fields) do
        if not field.isEmpty() then
            table.insert(fieldList, field.getValue())
        end
    end
    return table.concat(fieldList, ", ")
end