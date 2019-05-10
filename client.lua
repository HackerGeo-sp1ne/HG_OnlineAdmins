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



local staffonline = 0
RegisterNetEvent('HG:updateOnlineAdmins')
AddEventHandler('HG:updateOnlineAdmins', function(stfOnl)
    staffonline = stfOnl
end)

local function RGBRainbow( frequency )
	local result = {}
	local curtime = GetGameTimer() / 1000

	result.r = math.floor( math.sin( curtime * frequency + 0 ) * 127 + 128 )
	result.g = math.floor( math.sin( curtime * frequency + 2 ) * 127 + 128 )
	result.b = math.floor( math.sin( curtime * frequency + 4 ) * 127 + 128 )
	
	return result
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        local rainbow = RGBRainbow( 1 )
        OAstatus(0.19, 0.88 + 0.06, 1.0,1.0,0.35, "online staff: "..staffonline, rainbow.r, rainbow.g, rainbow.b, 225)
    end
end)

function OAstatus(x,y ,width,height,scale, text, r,g,b,a, outline)
    SetTextFont(7)
    SetTextProportional(0)
    SetTextScale(scale, scale)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    if(outline)then
	    SetTextOutline()
	end
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x, y)
end