function OpenShopMenu()
    TriggerEvent('animations:client:EmoteCommandStart', { "tablet2" })

    SendNUIMessage({
		message		= "show",
		clear = true
	})
    for _, v in  pairs(Config.Skills) do

       local currentProcent = math.floor((v['Current'] / 12800) * 100)

        SendNUIMessage({
			message		= "add",
			label      	= v.nameInTablet,
            current     = v.Current,
            color       = v.pBarColor,
            procent     = currentProcent,
            xp          = math.floor(v['Current'])
        })
    end
		SetNuiFocus(true, true)
end

local function closeGui()
    SetNuiFocus(false, false)
    SendNUIMessage({ message = "hide" })
end

RegisterNUICallback('quit', function(_, cb)
    TriggerEvent('animations:client:EmoteCommandStart', { "c" })
    closeGui()
    cb('ok')
end)

RegisterCommand("skills", function()
    OpenShopMenu()
end)