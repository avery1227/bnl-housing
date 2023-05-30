lib.locale()
Properties = {}

function SetupProperties()
    for _, property in pairs(Properties) do
        property.point:remove()
    end

    Properties = table.map(
        lib.callback.await("bnl-housing:server:getProperties"),
        function(data)
            local property = Property.new(data)
            property:createEntrancePoint()
            property:createBlip()

            return property
        end)
end

function SetupInPropertyPoints(property_id)
    local property = table.findOne(Properties, function(property)
        return property.id == property_id
    end)

    property:createInPropertyPoints()
end

function RemoveInPropertyPoints(property_id)
    local property = table.findOne(Properties, function(property)
        return property.id == property_id
    end)

    property:removeInPropertyPoints()
end

Bridge.onReady(SetupProperties)
