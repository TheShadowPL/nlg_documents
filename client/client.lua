ESX = nil
local PlayerData = {}
local isDead = false
local inwallet = 'none'
local isUIVisible = false
Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        PlayerData = ESX.GetPlayerData()
        Citizen.Wait(100)
        print(json.encode(PlayerData))
    end
end)

RegisterNUICallback("closewallet", function(data, cb)
    HideUI()
    cb("ok")
end)



function HideUI()
    --print("Hiding UI")
    isUIVisible = false
    inwallet = 'none'
    local data = {
        action = "modifyBodyClass",
        className = "none"
    }
    SendNUIMessage(data)
    SetNuiFocus(false, false)
end


RegisterCommand('portfel', function(source, args, rawCommand)
    local _source = source
   -- local xPlayer = ESX.GetPlayerFromId(_source)
    if inwallet == 'none' then
      local data = {
        action = "modifyBodyClass",
        className = "flex"
      }
      inwallet = 'flex'
      SendNUIMessage(data)
      SetNuiFocus(true, true)
    else
      local data = {
        action = "modifyBodyClass",
        className = "none"
      }
      inwallet = 'none'
      SendNUIMessage(data)
      SetNuiFocus(false, false)
    end
end, false)
