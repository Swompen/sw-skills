local QBCore = exports['qb-core']:GetCoreObject()

FetchSkills = function()
    QBCore.Functions.TriggerCallback("skillsystem:fetchStatus", function(data)
		if data then
            for status, value in pairs(data) do
                if Config.Skills[status] then
                    Config.Skills[status]["Current"] = value["Current"]
                else
                    print("Removing: " .. status)
                end
            end
	end
        RefreshSkills()
    end)
end

GetCurrentSkill = function(skill)
    return Config.Skills[skill]
end

--exports('GetCurrentSkill')

UpdateSkill = function(skill, amount)
    if not Config.Skills[skill] then
        return
    end
    local SkillAmount = Config.Skills[skill]["Current"]
    if SkillAmount + tonumber(amount) < 0 then
        Config.Skills[skill]["Current"] = 0
    elseif SkillAmount + tonumber(amount) > 250000 then
        Config.Skills[skill]["Current"] = 100
    else
        Config.Skills[skill]["Current"] = SkillAmount + tonumber(amount)
    end
    -- QBCore.Functions.GetPlayerData(function(PlayerData)
    --     print(PlayerData.gang.name)
    -- if PlayerData.gang.name ~= "none" then
    --     if skill == "Street Reputation" and SkillAmount == 30 then
    --         TriggerServerEvent('qb-phone:server:sendNewMail', {
    --             sender = "Anonymt",
    --             subject = "Erbjudande",
    --             message = "Ditt namn börjar dyka upp i mina kretsar och du verkar vara en person med driv... <br><br> Jag har jobb till dig... <br> Kom och prata med mig bakom den gamla syfabriken!",
    --             button = {}
    --         })
    --     elseif skill == "Drug Manufacture" and SkillAmount == 400 then
    --         TriggerServerEvent('qb-phone:server:sendNewMail', {
    --             sender = "Anonymt",
    --             subject = "Erbjudande",
    --             message = "Nu vet jag att jag kan lita på dig, vill du ta dig vidare till nästa steg? <br>Då har jag mer jobb till dig. <br><br>Hitta min bror i området jag skickade till din telefon så kommer han gå igenom detaljerna.",
    --             button = {}
    --         })
    --         local v = vector4(-1361.861, -758.8419, 21.500741, 307.14639)
    --         local blip = Citizen.InvokeNative(0x46818D79B1F7499A,v.x + math.random(0.0,150.0), v.y + math.random(0.0,80.0), v.z + math.random(0.0,5.0) , 300.0)
    --         SetBlipHighDetail(blip, true)
    --         SetBlipColour(blip, 68)
    --         SetBlipAsShortRange(blip, true)
    --         SetBlipAlpha(blip, 128)
    --         blipDisplay = blip
    --     elseif skill == "Drug Manufacture" and SkillAmount == 800 then
    --         TriggerServerEvent('qb-phone:server:sendNewMail', {
    --             sender = "Anonymt",
    --             subject = "Erbjudande",
    --             message = "Du har verkligen legat i och gjort ett namn för dig själv! <br>Med det sagt vill jag erbjuda dig sista delen i knarkvärlden som du kan ta över. <br><br>Hitta min bror i området jag skickade till din telefon så kommer han gå igenom detaljerna.",
    --             button = {}
    --         })
    --         local v = vector4(-2926.289, 51.719268, 11.041227, 338.57937)
    --         local blip = Citizen.InvokeNative(0x46818D79B1F7499A,v.x + math.random(0.0,150.0), v.y + math.random(0.0,80.0), v.z + math.random(0.0,5.0) , 300.0)
    --         SetBlipHighDetail(blip, true)
    --         SetBlipColour(blip, 68)
    --         SetBlipAsShortRange(blip, true)
    --         SetBlipAlpha(blip, 128)
    --         blipDisplay = blip
    --     end
    --end
-- end)
    RefreshSkills()
    --QBCore.Functions.Notify("+" .. amount .. " XP to " .. skill, "success", 3500)
	TriggerServerEvent("skillsystem:update", json.encode(Config.Skills))
end

function round(num)
    return math.floor(num+.5)
end

function round1(num)
    return math.floor(num+1)
end

RefreshSkills = function()
    for type, value in pairs(Config.Skills) do
        if Config.Debug then
            print(type .. ": " .. value['Current'])
        elseif Config.Debug and not Config.Skills[skill] then
            print("something went wrong")
        end
        if value["Stat"] then
            StatSetInt(value["Stat"], round(value["Current"]), true)
        end
    end
end

exports('CheckSkill', function(skill, val, hasskill)
    if Config.Skills[skill] then
        if Config.Skills[skill]["Current"] >= tonumber(val) then
            hasskill(true)
        else
            hasskill(false)
        end
    else
        print("Skill " .. skill .. " doesn't exist")
        hasskill(false)
    end
end)

MessageBox = function(text, alpha)
    if alpha > 255 then
        alpha = 255
    elseif alpha < 0 then
        alpha = 0
    end
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, math.floor(alpha))
    SetTextEdge(2, 0, 0, 0, math.floor(alpha))
    SetTextDropShadow()
    SetTextEntry("STRING")
    SetTextCentre(1)
    SetTextScale(0.31, 0.31)
    AddTextComponentString(text)
    local factor = (string.len(text)) / 350
    local x = 0.015
    local y = 0.5
    local width = 0.05
    local height = 0.025
    DrawText(x + (width / 2.0), y + (height / 2.0) - 0.01)
    DrawRect(x + (width / 2.0), y + (height / 2.0), width, height, 25, 25, 25, math.floor(alpha))
end

Notification = function(message)
    local alpha = 185

    for time = 1, 250 do
        Citizen.Wait(1)

        if time >= 150 then
            alpha = alpha - 2
            if alpha <= 0 then
                alpha = 0
            end
        end
        MessageBox(message, alpha)
    end
end