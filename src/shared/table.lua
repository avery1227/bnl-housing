---Map table values like in javascript
---@param list table
---@param func function
---@param noIndex boolean?
---@return table
function table.map(list, func, noIndex)
    local ret = {}

    for key, value in pairs(list) do
        local data = func(value, key)
        if data ~= nil then
            if noIndex then
                table.insert(ret, data)
            else
                ret[key] = data
            end
        end
    end

    return ret
end

---Find all values in the table by function
---@param list table
---@param func function
---@param keepIndex boolean?
---@return table
function table.find(list, func, keepIndex)
    keepIndex = keepIndex == true and true or false
    local ret = {}
    for key, value in pairs(list) do
        if func(value, key) then
            if keepIndex then
                ret[key] = value
            else
                table.insert(ret, value)
            end
        end
    end
    return ret
end

---Find a value in the table by function
---@param list table
---@param func function
---@return unknown?
---@return unknown?
function table.findOne(list, func)
    if not list then return nil end
    for key, value in pairs(list) do
        if func(value, key) then
            return value, key
        end
    end
end

---Merge two tables
---@param t1 table
---@param t2 table
---@param ignoreKeys boolean?
---@return any
function table.merge(t1, t2, ignoreKeys)
    local ret = t1
    if ignoreKeys then
        for key, value in pairs(t2) do
            table.insert(ret, value)
        end
    else
        for key, value in pairs(t2) do
            ret[key] = value
        end
    end
    return ret
end

---Convert a table to a vec4
---@param list table
---@return vector4
function table.tovector(list)
    return vec4(list.x, list.y, list.z, list.w)
end

---Get the amount of values in a table.
---@param list table
---@return number
function table.count(list)
    local count = 0
    for _, _ in pairs(list) do
        count = count + 1
    end
    return count
end

---@param list table
---@param func function
---@return table
function table.filter(list, func)
    local ret = {}
    for key, value in pairs(list) do
        if func(value, key) then
            ret[key] = value
        end
    end
    return ret
end
