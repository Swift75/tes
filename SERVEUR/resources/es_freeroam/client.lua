-- Spawn override
AddEventHandler('onClientMapStart', function()
    exports.spawnmanager:setAutoSpawn(true)
    exports.spawnmanager:forceRespawn()
end)

-- Allows the server to spawn the player
RegisterNetEvent('es_freeroam:spawnPlayer')
AddEventHandler('es_freeroam:spawnPlayer', function(x, y, z)
    exports.spawnmanager:spawnPlayer({x = x, y = y, z = z})
end)

  AddEventHandler("playerSpawned", function(spawn)
    -- Send notifications
    Citizen.CreateThread(function()
    while true do
      Wait(0)

      SetNotificationTextEntry("STRING");
      AddTextComponentString("Bienvenue sur le serveur ~g~communautaire N3MTV !.\n ~y~Pour plus d'informations tapez /help");
      SetNotificationMessage("CHAR_ALL_PLAYERS_CONF", "CHAR_ALL_PLAYERS_CONF", true, 1, "Discord: ", "https://discord.gg/v9aKGuc");
      DrawNotification(false, true);
	  TriggerEvent("chatMessage", 'INFO', { 0, 255, 255}, "Utilisez /help et /rules pour voir les commandes et infos serveur , Bon jeu.")
      Wait(10000000)
	  
    end
 end)



   -- give the player some weapons
   Citizen.CreateThread(function()
     GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_KNIFE"), true, true)
   end)
 end)

 RegisterNetEvent("es_freeroam:wanted")
 AddEventHandler("es_freeroam:wanted", function()
   Citizen.CreateThread(function()
       SetPlayerWantedLevel(PlayerId(), 0, 0)
       SetPlayerWantedLevelNow(PlayerId(), 0)
     end)
 end)

  -- Display text
    RegisterNetEvent("es_freeroam:displaytext")
    AddEventHandler("es_freeroam:displaytext", function(text, time)
      ClearPrints()
    	SetTextEntry_2("STRING")
    	AddTextComponentString(text)
    	DrawSubtitleTimed(time, 1)
    end)

    -- Display notification
    RegisterNetEvent("es_freeroam:notify")
    AddEventHandler("es_freeroam:notify", function(icon, type, sender, title, text)
      Citizen.CreateThread(function()
        Wait(1)
        SetNotificationTextEntry("STRING");
        AddTextComponentString(text);
        SetNotificationMessage(icon, icon, true, type, sender, title, text);
        DrawNotification(false, true);
      end)
    end)
