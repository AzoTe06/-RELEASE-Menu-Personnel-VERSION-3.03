require "resources/essentialmode/lib/MySQL"
MySQL:open("127.0.0.1", "gta5_gamemode_essential", "root", "1202")

RegisterServerEvent("Hamburgers")
AddEventHandler("Hamburgers", function()
	TriggerEvent("es:getPlayerFromId", source, function(target)
	    if (tonumber(target.money) >= 80) then
		TriggerClientEvent("Hamburger", source)
		target:removeMoney(80)
		TriggerClientEvent("es_freeroam:notify", source, "CHAR_PROPERTY_BAR_MIRROR_PARK", 1, "McDonald", false, "Hamburger ~g~+1 !\n")
		else
		TriggerClientEvent("es_freeroam:notify", source, "CHAR_PROPERTY_BAR_MIRROR_PARK", 1, "McDonald", false, "~r~Tu n'as pas suffisamment d'argent !\n")
		end
	end)
end)

RegisterServerEvent("Frites")
AddEventHandler("Frites", function()
	TriggerEvent("es:getPlayerFromId", source, function(target)
	    if (tonumber(target.money) >= 125) then
		TriggerClientEvent("Frite", source)
		target:removeMoney(125)
		TriggerClientEvent("es_freeroam:notify", source, "CHAR_PROPERTY_BAR_MIRROR_PARK", 1, "McDonald", false, "Hamburger ~g~+1 !\n")
		else
		TriggerClientEvent("es_freeroam:notify", source, "CHAR_PROPERTY_BAR_MIRROR_PARK", 1, "McDonald", false, "~r~Tu n'as pas suffisamment d'argent !\n")
		end
	end)
end)

RegisterServerEvent("Cocazeros")
AddEventHandler("Cocazeros", function()
	TriggerEvent("es:getPlayerFromId", source, function(target)
	    if (tonumber(target.money) >= 50) then
		TriggerClientEvent("Coca zero", source)
		target:removeMoney(50)
		TriggerClientEvent("es_freeroam:notify", source, "CHAR_PROPERTY_BAR_MIRROR_PARK", 1, "McDonald", false, "Hamburger ~g~+1 !\n")
		else
		TriggerClientEvent("es_freeroam:notify", source, "CHAR_PROPERTY_BAR_MIRROR_PARK", 1, "McDonald", false, "~r~Tu n'as pas suffisamment d'argent !\n")
		end
	end)
end)
