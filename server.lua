--[[
    FiveM Scripts
	The Official HackerGeo Script 
	Credits - HackerGeo
	Website - www.HackerGeo.com
	GitHub - GITHUB.com/HackerGeo-sp1ne
	Steam - SteamCommunity.com/id/HackerGeo1
	Copyright 2019 ©HackerGeo. All rights served
]]

------------------------------------------------------WARNING-----------------------------------------------------
---------------------Do not reupload/re release any part of this script without my permission---------------------
------------------------------------------------------------------------------------------------------------------


local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","HG_OnlineAdmins")

local onlineAdms = 0
local staff_grades = {
    "supremowner",
    "fondator",
    "co-fondator",
    "owner",
    "co-owner",
    "superadmin",
    "admin",
    "mod",
    "helper"
}

AddEventHandler("vRP:playerSpawn",function(user_id,source,first_spawn)
    if first_spawn then
        for _, v in pairs(staff_grades) do
            if vRP.hasGroup({user_id, v}) then
                onlineAdms = onlineAdms + 1
                vRPclient.notifyPicture(-1 ,{"CHAR_ALL_PLAYERS_CONF",1,"~g~StayFrosty System",false,"Un membru ~r~staff ~w~s-a ~g~conectat."})
                TriggerClientEvent("HG:updateOnlineAdmins", -1, onlineAdms)
                break
            end
        end
    end
end)

AddEventHandler("vRP:playerLeave",function(user_id, source) -- asta cred ca mere
--AddEventHandler("playerLeave", function() -- asta nu merge
    local user_id = vRP.getUserId({source})
    for _, v in pairs(staff_grades) do 
        if vRP.hasGroup({user_id, v}) then
            onlineAdms = onlineAdms - 1
            TriggerClientEvent("HG:updateOnlineAdmins", -1, onlineAdms)
            break
        end
    end
end)