local QBCore = exports['qb-core']:GetCoreObject()
local missionState = 0
local missionData = {}

Citizen.CreateThread(function()
    local npcModel = Config.NPC.model
    RequestModel(npcModel)
    while not HasModelLoaded(npcModel) do
        Wait(10)
    end
    
    local npc = CreatePed(4, npcModel, Config.NPC.position.x, Config.NPC.position.y, Config.NPC.position.z, Config.NPC.position.w, false, true)
    SetEntityInvincible(npc, true)
    FreezeEntityPosition(npc, true)
    TaskStartScenarioInPlace(npc, Config.NPC.scenario, 0, true)
    
    Citizen.Wait(1000)
    
    exports['qb-target']:AddTargetEntity(npc, {
        options = {{
            type = "client",
            event = "startMission",
            icon = "fas fa-tasks",
            label = "Start Mission",
        }},
        distance = 2.5
    })
end)

-- Görev Başlatma
RegisterNetEvent('startMission')
AddEventHandler('startMission', function()
    if missionState == 0 then
        missionState = 1
        
        QBCore.Functions.Notify(Config.Notification.missionStart, 'primary', 5000) -- Config'den mesaj çekiliyor

        local randomIndex = math.random(1, #Config.TargetVectors)
        missionData.targetPos = Config.TargetVectors[randomIndex]
        missionData.radius = 50.0

        missionData.blip = AddBlipForRadius(missionData.targetPos.x, missionData.targetPos.y, missionData.targetPos.z, missionData.radius)
        SetBlipColour(missionData.blip, 1)
        SetBlipAlpha(missionData.blip, 128)
        
        missionData.centerBlip = AddBlipForCoord(missionData.targetPos.x, missionData.targetPos.y, missionData.targetPos.z)
        SetBlipSprite(missionData.centerBlip, Config.BlipSettings.sprite)
        SetBlipColour(missionData.centerBlip, Config.BlipSettings.color)
        SetBlipScale(missionData.centerBlip, Config.BlipSettings.scale)
        SetBlipAsShortRange(missionData.centerBlip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(Config.BlipSettings.label)
        EndTextCommandSetBlipName(missionData.centerBlip)
        exports['qb-target']:AddCircleZone("missionTarget", missionData.targetPos, 1.0, {
            name = "missionTarget",
            useZ = true,
            debugPoly = false
        }, {
            options = {{
                type = "client",
                event = "stealPhone",
                icon = "fas fa-phone",
                label = "Steal Phone",
            }},
            distance = 2.5
        })
        
    end
end)

RegisterNetEvent('stealPhone')
AddEventHandler('stealPhone', function()
    if missionState == 1 then
        QBCore.Functions.Progressbar("steal_phone", "Stealing Phone...", Config.Timers.stealTime, false, true, {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        }, {
            animDict = 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@',
            anim = 'machinic_loop_mechandplayer',
            flags = 49
        }, {}, {}, function()
            TriggerServerEvent('addItem', Config.Items.stolenPhone, 1)
            QBCore.Functions.Notify(Config.Notification.steal.success, 'success')
            if missionData.blip then RemoveBlip(missionData.blip) end
            if missionData.centerBlip then RemoveBlip(missionData.centerBlip) end
            exports['qb-target']:RemoveZone("missionTarget")
            missionState = 2
            
            exports['qb-target']:AddCircleZone("resetTarget", Config.ResetLocation, 1.0, {
                name = "resetTarget",
                useZ = true,
            }, {
                options = {{
                    type = "client",
                    event = "resetPhone",
                    icon = "fas fa-tools",
                    label = "Reset Phone",
                }},
                distance = 2.5
            })
            local resetBlip = AddBlipForCoord(Config.ResetLocation.x, Config.ResetLocation.y, Config.ResetLocation.z)
            SetBlipSprite(resetBlip, 1)
            SetBlipColour(resetBlip, 2)
            SetBlipScale(resetBlip, 1.0)
            SetBlipAsShortRange(resetBlip, true)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString("Reset Point")
            EndTextCommandSetBlipName(resetBlip)
            missionData.resetBlip = resetBlip
        end, function()
            QBCore.Functions.Notify(Config.Notification.steal.cancel, 'error')
        end)
    end
end)

-- Telefon Sıfırlama
RegisterNetEvent('resetPhone')
AddEventHandler('resetPhone', function()
    if missionState == 2 then
        QBCore.Functions.Progressbar("reset_phone", "Resetting Phone...", Config.Timers.resetTime, false, true, {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        }, {
            animDict = 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@',
            anim = 'machinic_loop_mechandplayer',
            flags = 49
        }, {}, {}, function()
            TriggerServerEvent('resetPhoneItem')
            QBCore.Functions.Notify(Config.Notification.reset.success, 'success')
            exports['qb-target']:RemoveZone("resetTarget")
            RemoveBlip(missionData.resetBlip)
            missionState = 3
            
            exports['qb-target']:AddCircleZone("imeiTarget", Config.IMEILocation, 1.0, {
                name = "imeiTarget",
                useZ = true,
            }, {
                options = {{
                    type = "client",
                    event = "registerIMEI",
                    icon = "fas fa-sim-card",
                    label = "Register IMEI",
                }},
                distance = 2.5
            })
            local imeiBlip = AddBlipForCoord(Config.IMEILocation.x, Config.IMEILocation.y, Config.IMEILocation.z)
            SetBlipSprite(imeiBlip, 1)
            SetBlipColour(imeiBlip, 3)
            SetBlipScale(imeiBlip, 1.0)
            SetBlipAsShortRange(imeiBlip, true)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString("IMEI Registration Point")
            EndTextCommandSetBlipName(imeiBlip)
            missionData.imeiBlip = imeiBlip
        end, function()
            QBCore.Functions.Notify(Config.Notification.reset.cancel, 'error')
        end)
    end
end)

RegisterNetEvent('registerIMEI')
AddEventHandler('registerIMEI', function()
    if missionState == 3 then
        QBCore.Functions.Progressbar("register_imei", "Registering IMEI...", Config.Timers.imeiTime, false, true, {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        }, {
            animDict = 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@',
            anim = 'machinic_loop_mechandplayer',
            flags = 49
        }, {}, {}, function()
            TriggerServerEvent('registerIMEIItem') 
            exports['qb-target']:RemoveZone("imeiTarget")
            if missionData.imeiBlip then RemoveBlip(missionData.imeiBlip) end
            missionState = 0
            missionData = {}
        end, function()
            QBCore.Functions.Notify(Config.Notification.imei.cancel, 'error')
        end)
    end
end)