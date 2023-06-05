ESX = nil
local PlayerData = {}
local isDead = false
local inwallet = false
Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        PlayerData = ESX.GetPlayerData()
        Citizen.Wait(100)
    end
end)


RegisterCommand('portfel', function(source, args, rawCommand)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    SendNUIMessage({
        type = "open",
        money = xPlayer.getMoney(),
        bank = xPlayer.getAccount('bank').money,
        black = xPlayer.getAccount('black_money').money
    })
    inwallet = true
    --SetNuiFocus(false, true)
    local money = xPlayer.getMoney()
    local bank = xPlayer.getAccount('bank').money
    local black = xPlayer.getAccount('black_money').money
    TriggerClientEvent('esx:showNotification', _source, 'Stan konta: ~g~$'..money..'~s~\nStan konta bankowego: ~b~$'..bank..'~s~\nStan konta brudnego: ~r~$'..black..'~s~')
    if inwallet == true then
        SetNuiFocus(true, true)
    else 
        SetNuiFocus(false, false)
        SendNuiMessage({
            type = "close"
        })
    end
end, false)
