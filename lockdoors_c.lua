

local lockedDoors = {}

RegisterNetEvent('lockdoors:toggleLock')
AddEventHandler('lockdoors:toggleLock', function(doorId, isLocked)
    local door = GetClosestObjectOfType(GetEntityCoords(PlayerPedId()), 2.0, GetHashKey('prop_door_wood01'), false, false, false)
    
    if door ~= 0 then
        local lockedState = isLocked or false
        NetworkRequestControlOfEntity(door)
        
        while not NetworkHasControlOfEntity(door) do
            Wait(100)
        end

        if lockedState then
            FreezeEntityPosition(door, true)
            SetEntityHeading(door, GetEntityHeading(door) + 30.0) 
        else
            FreezeEntityPosition(door, false)
        end
    end
end)
