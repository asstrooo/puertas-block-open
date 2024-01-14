

local lockedDoors = {}

RegisterServerEvent('lockdoors:toggleLock')
AddEventHandler('lockdoors:toggleLock', function(doorId)
    local source = source

    if not lockedDoors[doorId] then
        lockedDoors[doorId] = source
        TriggerClientEvent('lockdoors:toggleLock', -1, doorId, true)
        TriggerClientEvent('chatMessage', source, 'Sistema de bloqueo', {255, 255, 0}, 'Puerta ' .. doorId .. ' cerrada.')
    elseif lockedDoors[doorId] == source then
        lockedDoors[doorId] = nil
        TriggerClientEvent('lockdoors:toggleLock', -1, doorId, false)
        TriggerClientEvent('chatMessage', source, 'Sistema de bloqueo', {255, 255, 0}, 'Puerta ' .. doorId .. ' abierta.')
    else
        TriggerClientEvent('chatMessage', source, 'Sistema de bloqueo', {255, 0, 0}, 'Esta puerta ya está cerrada por otro jugador.')
    end
end)
