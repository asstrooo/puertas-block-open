-- lockdoors_s.lua

local lockedDoors = {}
local discordWebhook = 'TU_URL_DEL_WEBHOOK'

RegisterServerEvent('lockdoors:toggleLock')
AddEventHandler('lockdoors:toggleLock', function(doorId)
    local source = source

    if not lockedDoors[doorId] then
        lockedDoors[doorId] = source
        TriggerClientEvent('lockdoors:toggleLock', -1, doorId, true)
        TriggerClientEvent('chatMessage', source, 'Sistema de bloqueo', {255, 255, 0}, 'Puerta ' .. doorId .. ' cerrada.')

        SendDiscordNotification('Puerta ' .. doorId .. ' cerrada por el jugador ' .. GetPlayerName(source))
    elseif lockedDoors[doorId] == source then
        lockedDoors[doorId] = nil
        TriggerClientEvent('lockdoors:toggleLock', -1, doorId, false)
        TriggerClientEvent('chatMessage', source, 'Sistema de bloqueo', {255, 255, 0}, 'Puerta ' .. doorId .. ' abierta.')

        SendDiscordNotification('Puerta ' .. doorId .. ' abierta por el jugador ' .. GetPlayerName(source))
    else
        TriggerClientEvent('chatMessage', source, 'Sistema de bloqueo', {255, 0, 0}, 'Esta puerta ya está cerrada por otro jugador.')
    end
end)

function SendDiscordNotification(message)
    PerformHttpRequest(discordWebhook, function(err, text, headers) end, 'POST', json.encode({content = message}), { ['Content-Type'] = 'application/json' })
end
