ESX = nil
local PlayerData = {}
local isDead = false
while ESX == nil do
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    Citizen.Wait(100)
    PlayerData = ESX.GetPlayerData()
end
