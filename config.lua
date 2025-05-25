Config = {}

Config.NPC = {
    model = 'a_m_m_business_01',
    position = vector4(-236.9, -256.59, 38.12, 4.95), -- NPC location
    scenario = 'WORLD_HUMAN_STAND_IMPATIENT'
}

Config.TargetVectors = {
    vector3(148.82, -1960.65, 19.46),
    vector3(144.33, -1969.02, 18.86),
    vector3(128.34, -1896.94, 23.67),
    vector3(161.01, -1902.8, 22.97),

    vector3(1207.37, -620.38, 66.44),
    vector3(1201.04, -575.61, 69.14),
    vector3(1204.89, -557.64, 69.62),
    vector3(1221.64, -669.16, 63.5),

    -- You can add more vectors
}

Config.ResetLocation = vector3(-424.89, 186.1, 80.81)
Config.IMEILocation = vector3(-360.48, 20.87, 47.86)

Config.Items = {
    stolenPhone = 'stolen_phone',
    resetPhone = 'reset_phone',
    registeredPhone = 'registered_phone'
}

Config.Timers = {
    stealTime = 5000,   -- Phone stealing time (5 seconds)
    resetTime = 7000,   -- Phone reset time (7 seconds)
    imeiTime = 9000     -- IMEI registration time (9 seconds)
}

Config.BlipSettings = {
    sprite = 1,
    color = 1,
    scale = 0.7,
    label = 'Stolen Phone Area'
}

Config.Notification = {
    missionStart = "Mission started! Go and find the target house to steal the phone.",
    steal = {
        success = "Phone stolen successfully! Go to the reset location.",
        cancel = "Phone stealing cancelled."
    },
    reset = {
        success = "Phone reset successfully! Go to the IMEI registration location.",
        cancel = "Reset cancelled."
    },
    imei = {
        success = "IMEI registered successfully! Mission completed!",
        cancel = "IMEI registration cancelled."
    },
    noItem = {
        stolenPhone = "You don't have a stolen phone!",
        resetPhone = "You don't have a reset phone!"
    }
}