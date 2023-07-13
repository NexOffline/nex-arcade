local QBCore = exports['qb-core']:GetCoreObject()

CreateThread(function()

    exports["qb-target"]:AddBoxZone("minigamemenu", vector3(-1660.337524, -1070.67, 12.13), 2.0, 2.0, {
        name = "minigamemenu",
        heading = 140.0,
        debugPoly = false,
        minZ = 10.52,
        maxZ = 13.12,
    }, {
        options = {
            {
                type = "client",
                event = "nex-arcade:client:minigamemenu",
                icon = "fas fa-computer",
                label = "Practice Minigames",
            },
        },
    distance = 2.5
    })
end) 