local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
	Citizen.CreateThread(function()
		FetchSkills()
		while true do
			local seconds = Config.UpdateFrequency * 1000
			Wait(seconds)
			for skill, value in pairs(Config.Skills) do
				UpdateSkill(skill, value["RemoveAmount"])
			end
			TriggerServerEvent("skillsystem:update", json.encode(Config.Skills))
		end
	end)

RegisterNetEvent('QBCore:Client:OnPlayerUnload', function()
	for skill, value in pairs(Config.Skills) do
		Config.Skills[skill]["Current"] = 0
	end
end)
end)

AddEventHandler('onResourceStart', function(resource)
   if resource == GetCurrentResourceName() then
	  Wait(100)
	  FetchSkills()
   end
end)

Citizen.CreateThread(function()
    while true do
        Wait(25000)
        local ped = PlayerPedId()
        local vehicle = GetVehiclePedIsUsing(ped)
        local isDead = QBCore.Functions.GetPlayerData().metadata["isdead"]
        local islaststand = QBCore.Functions.GetPlayerData().metadata["islaststand"]
        if LocalPlayer.state.isLoggedIn and not isDead and not islaststand then
            if IsPedInMeleeCombat(ped) then
                local isTargetting, targetEntity = GetPlayerTargetEntity(PlayerId())
                if isTargetting and not IsEntityDead(targetEntity) and GetMeleeTargetForPed(ped) ~= 0 then
                    UpdateSkill("Strength", 0.2)
                end
            elseif IsPedSwimmingUnderWater(ped) then
                UpdateSkill("Lung Capacity", 0.5)
            elseif DoesEntityExist(vehicle) and GetPedInVehicleSeat(vehicle, -1) == ped then
                local speed = GetEntitySpeed(vehicle) * 3.6
                if speed >= 80 then
                    UpdateSkill("Driving", 0.1)
                end
            end
        end
    end
end)

CreateThread(function()
    while true do
        Wait(25000)
        local ped = PlayerPedId()
        if IsPedRunning(ped) then
            UpdateSkill("Stamina", 0.1)
        end
    end
end)