lib.callback.register("bnl-housing:server:entrance:enter", function(source, property_id)
    local property = GetPropertyById(property_id)
    return property:enter(source)
end)
