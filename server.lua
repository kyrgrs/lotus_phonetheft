local QBCore = exports['qb-core']:GetCoreObject()

-- Item Ekleme
RegisterNetEvent('addItem')
AddEventHandler('addItem', function(item, amount)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.AddItem(item, amount)
end)

RegisterNetEvent('resetPhoneItem')
AddEventHandler('resetPhoneItem', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local stolenPhone = Config.Items.stolenPhone
    if Player.Functions.GetItemByName(stolenPhone) and Player.Functions.GetItemByName(stolenPhone).amount >= 1 then
        Player.Functions.RemoveItem(stolenPhone, 1)
        Player.Functions.AddItem(Config.Items.resetPhone, 1)
        TriggerClientEvent('QBCore:Notify', src, Config.Notification.reset.success, 'success')
    else
        TriggerClientEvent('QBCore:Notify', src, Config.Notification.noItem.stolenPhone, 'error')
    end
end)

RegisterNetEvent('registerIMEIItem')
AddEventHandler('registerIMEIItem', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local resetPhone = Config.Items.resetPhone
    local item = Player.Functions.GetItemByName(resetPhone)
    
    if item and item.amount >= 1 then
        Player.Functions.RemoveItem(resetPhone, 1)
        Player.Functions.AddItem(Config.Items.registeredPhone, 1)
        TriggerClientEvent('QBCore:Notify', src, Config.Notification.imei.success, 'success')
    else
        TriggerClientEvent('QBCore:Notify', src, Config.Notification.noItem.resetPhone, 'error')
    end
end)