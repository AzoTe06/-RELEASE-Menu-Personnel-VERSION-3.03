local options = {
    x = 0.1,
    y = 0.2,
    width = 0.2,
    height = 0.04,
    scale = 0.4,
    font = 0,
    menu_title = "McDonald",
    menu_subtitle = "Categories",
    color_r = 255,
    color_g = 51,
    color_b = 102,
}

RegisterNetEvent("mp:firstspawn")
AddEventHandler("mp:firstspawn",function()
	Main() -- Menu to draw
    Menu.hidden = not Menu.hidden -- Hide/Show the menu
    Menu.renderGUI(options) -- Draw menu on each tick if Menu.hidden = false
end)

function changemodel(model)
	
	local modelhashed = GetHashKey(model)

	RequestModel(modelhashed)
	while not HasModelLoaded(modelhashed) do 
	    RequestModel(modelhashed)
	    Citizen.Wait(0)
	end

	SetPlayerModel(PlayerId(), modelhashed)
	local a = "" -- nil doesnt work
	SetPedRandomComponentVariation(GetPlayerPed(-1), true)
	SetModelAsNoLongerNeeded(modelhashed)
end

function Notify(text)
    SetNotificationTextEntry('STRING')
    AddTextComponentString(text)
    DrawNotification(false, false)
end

function DisplayHelpText(str)
	SetTextComponentFormat("STRING")
	AddTextComponentString(str)
	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

function Main()
    options.menu_subtitle = "Choisissez votre menu"
    ClearMenu()
    Menu.addButton("Hamburger (80€)", "Hamburger", nil)
    Menu.addButton("Frites (125€)", "Frite", nil)
    Menu.addButton("Coca zero (50€)", "Cocazero", nil)
end

------------------------------
--FONCTIONS
-------------------------------
local twentyfourseven_shops = {
	{ ['x'] = -1177.7861328125, ['y'] = -891.105041503906, ['z'] = 13.7767362594604 },
}

Citizen.CreateThread(function()
	for k,v in ipairs(twentyfourseven_shops)do
		local blip = AddBlipForCoord(v.x, v.y, v.z)
		SetBlipSprite(blip, 78)
		SetBlipScale(blip, 0.8)
		SetBlipAsShortRange(blip, true)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString("McDonald")
		EndTextCommandSetBlipName(blip)
	end
end)

RegisterNetEvent("Hamburger")
AddEventHandler("Hamburger", function()
    TriggerEvent("player:receiveItem", 30, 1)
	Menu.hidden = false  
end)

function Hamburger()
    TriggerServerEvent("Hamburgers")
	Menu.hidden = false
end

RegisterNetEvent("Frite")
AddEventHandler("Frite", function()
    TriggerEvent("player:receiveItem", 25, 1)
	Menu.hidden = false  
end)

function Frite()
    TriggerServerEvent("Frites")
	Menu.hidden = false
end

RegisterNetEvent("Coca zero")
AddEventHandler("Coca zero", function()
    TriggerEvent("player:receiveItem", 35, 1)
	Menu.hidden = false  
end)

function Cocazero()
    TriggerServerEvent("Cocazeros")
	Menu.hidden = false
end

-------------------------
---INVENTAIRE
-------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Press F2 to open menu
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local pos = GetEntityCoords(GetPlayerPed(-1), false)
		for k,v in ipairs(twentyfourseven_shops) do
			if(Vdist(v.x, v.y, v.z, pos.x, pos.y, pos.z) < 20.0)then
				DrawMarker(1, v.x, v.y, v.z - 1, 0, 0, 0, 0, 0, 0, 2.001, 2.0001, 0.5001, 0, 155, 255, 200, 0,0, 0,0)
				if(Vdist(v.x, v.y, v.z, pos.x, pos.y, pos.z) < 2.0)then
					DisplayHelpText("Appuyer sur ~g~F~s~ pour ouvrir le menu.")
					if IsControlJustPressed(1, 23) then
                        Main()
                        Menu.hidden = not Menu.hidden
				    end
                  Menu.renderGUI(options)
                end
            end
		end
	end
end)
