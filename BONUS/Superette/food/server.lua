require "resources/essentialmode/lib/MySQL"
MySQL:open("127.0.0.1", "gta5_gamemode_essential", "root", "1202")

RegisterServerEvent("eaus")
AddEventHandler("eaus", function()
	TriggerEvent("es:getPlayerFromId", source, function(target)
	    if (tonumber(target.money) >= 25) then
		TriggerClientEvent("eau", source)
		target:removeMoney(25)
		TriggerClientEvent("es_freeroam:notify", source, "CHAR_PROPERTY_BAR_MIRROR_PARK", 1, "Magasin", false, "Eau ~g~+1 !\n")
		else
		TriggerClientEvent("es_freeroam:notify", source, "CHAR_PROPERTY_BAR_MIRROR_PARK", 1, "Magasin", false, "~r~Tu n'as pas suffisamment d'argent !\n")
		end
	end)
end)

RegisterServerEvent("Sandwichs")
AddEventHandler("Sandwichs", function()
	TriggerEvent("es:getPlayerFromId", source, function(target)
	    if (tonumber(target.money) >= 35) then
		TriggerClientEvent("Sandwich", source)
		target:removeMoney(35)
		TriggerClientEvent("es_freeroam:notify", source, "CHAR_PROPERTY_BAR_MIRROR_PARK", 1, "Magasin", false, "Sandwich ~g~+1 !\n")
		else
		TriggerClientEvent("es_freeroam:notify", source, "CHAR_PROPERTY_BAR_MIRROR_PARK", 1, "Magasin", false, "~r~Tu n'as pas suffisamment d'argent !\n")
		end
	end)
end)

