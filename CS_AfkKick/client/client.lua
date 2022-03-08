
--
--░█████╗░███████╗██╗░░██╗██╗░░██╗██╗░█████╗░██╗░░██╗
--██╔══██╗██╔════╝██║░██╔╝██║░██╔╝██║██╔══██╗██║░██╔╝
--███████║█████╗░░█████═╝░█████═╝░██║██║░░╚═╝█████═╝░
--██╔══██║██╔══╝░░██╔═██╗░██╔═██╗░██║██║░░██╗██╔═██╗░
--██║░░██║██║░░░░░██║░╚██╗██║░╚██╗██║╚█████╔╝██║░╚██╗
--╚═╝░░╚═╝╚═╝░░░░░╚═╝░░╚═╝╚═╝░░╚═╝╚═╝░╚════╝░╚═╝░░╚═╝
-- Created and designed by Collective Studios

-- CONFIGURATION --

-- AFK Kick Time Limit (in seconds)
secondsUntilKick = 1000

-- Warn players if 3 quarters of the time is up
kickWarning = true

-- CODE --

Citizen.CreateThread(function()
	while true do
		Wait(1000)

		playerPed = GetPlayerPed(-1)
		if playerPed then
			currentPos = GetEntityCoords(playerPed, true)

			if currentPos == prevPos then
				if time > 0 then
					if kickWarning and time == math.ceil(secondsUntilKick / 4) and not IsAceAllowed('your_input goes here!', PlayerPedId(-1)) then   -- enter an ace perm to ignore afkkick
						TriggerEvent("chatMessage", "WARNING", {255, 0, 0}, "^1You'll be kicked in " .. time .. " seconds for being AFK! ^7Hold W!")  -- you can alter this code how you see fit !
					end

					time = time - 1
				else
					TriggerServerEvent("CSAfkKick")
				end
			else
				time = secondsUntilKick
			end

			prevPos = currentPos
		end
	end
end)