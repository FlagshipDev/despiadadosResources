RegisterCommand("jailmenu", function(source, args)

	if PlayerData.job.name == "police" then
		OpenJailMenu()
	else
		ESX.ShowNotification("You are not an officer!")
	end
end)

function LoadAnim(animDict)
	RequestAnimDict(animDict)

	while not HasAnimDictLoaded(animDict) do
		Citizen.Wait(10)
	end
end

function LoadModel(model)
	RequestModel(model)

	while not HasModelLoaded(model) do
		Citizen.Wait(10)
	end
end

function HideHUDThisFrame()
	HideHelpTextThisFrame()
	HideHudAndRadarThisFrame()
	HideHudComponentThisFrame(1)
	HideHudComponentThisFrame(2)
	HideHudComponentThisFrame(3)
	HideHudComponentThisFrame(4)
	HideHudComponentThisFrame(6)
	HideHudComponentThisFrame(7)
	HideHudComponentThisFrame(8)
	HideHudComponentThisFrame(9)
	HideHudComponentThisFrame(13)
	HideHudComponentThisFrame(11)
	HideHudComponentThisFrame(12)
	HideHudComponentThisFrame(15)
	HideHudComponentThisFrame(18)
	HideHudComponentThisFrame(19)
end

function Cutscene()
	DoScreenFadeOut(100)

	Citizen.Wait(250)

	ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jailSkin)
		if skin.sex == 0 then
			SetPedComponentVariation(GetPlayerPed(-1), 3, 67, 0, 0)--Torso1 (Ped, componente, numero1, numero2, ni idea) 0: Face\ 1: Mask\ 2: Hair\ 3: Torso\ 4: Leg\ 5: Parachute / bag\ 6: Shoes\ 7: Accessory\ 8: Undershirt\ 9: Kevlar\ 10: Badge\ 11: Torso 2
			SetPedComponentVariation(GetPlayerPed(-1), 4, 9, 40, 0)--Pantalones 1
			SetPedComponentVariation(GetPlayerPed(-1), 6, 36, 0, 0)--Zapatos
			SetPedComponentVariation(GetPlayerPed(-1), 11, 0, 0, 0)--Veste
		elseif skin.sex == 1 then
			SetPedComponentVariation(GetPlayerPed(-1), 3, 68, 0, 0)--Torso1 (Ped, componente, numero1, numero2, ni idea) 0: Face\ 1: Mask\ 2: Hair\ 3: Torso\ 4: Leg\ 5: Parachute / bag\ 6: Shoes\ 7: Accessory\ 8: Undershirt\ 9: Kevlar\ 10: Badge\ 11: Torso 2
			SetPedComponentVariation(GetPlayerPed(-1), 4, 9, 37, 0)--Pantalones 1
			SetPedComponentVariation(GetPlayerPed(-1), 6, 35, 0, 0)--Zapatos
			SetPedComponentVariation(GetPlayerPed(-1), 11, 0, 0, 0)--Veste
		else
			TriggerEvent('skinchanger:loadClothes', skin, jailSkin.skin_female)
		end
					
	end)

	LoadModel(-1320879687)

	local PolicePosition = Config.Prision.Cutscene["PolicePosition"]
	local Police = CreatePed(5, -1320879687, PolicePosition["x"], PolicePosition["y"], PolicePosition["z"], PolicePosition["h"], false)
	TaskStartScenarioInPlace(Police, "WORLD_HUMAN_PAPARAZZI", 0, false)

	local PlayerPosition = Config.Prision.Cutscene["PhotoPosition"]
	local PlayerPed = PlayerPedId()
	SetEntityCoords(PlayerPed, PlayerPosition["x"], PlayerPosition["y"], PlayerPosition["z"] - 1)
	SetEntityHeading(PlayerPed, PlayerPosition["h"])
	FreezeEntityPosition(PlayerPed, true)

	Cam()

	Citizen.Wait(1000)

	DoScreenFadeIn(100)

	Citizen.Wait(10000)

	DoScreenFadeOut(250)

	local JailPosition = Config.Prision.JailPositions["Cell"]
	SetEntityCoords(PlayerPed, JailPosition["x"], JailPosition["y"], JailPosition["z"])
	DeleteEntity(Police)
	SetModelAsNoLongerNeeded(-1320879687)

	Citizen.Wait(1000)

	DoScreenFadeIn(250)

	TriggerServerEvent("InteractSound_SV:PlayOnSource", "cell", 0.3)

	RenderScriptCams(false,  false,  0,  true,  true)
	FreezeEntityPosition(PlayerPed, false)
	DestroyCam(Config.Prision.Cutscene["CameraPos"]["cameraId"])

	InJail()
end

function Cam()
	local CamOptions = Config.Prision.Cutscene["CameraPos"]

	CamOptions["cameraId"] = CreateCam("DEFAULT_SCRIPTED_CAMERA", true)

    SetCamCoord(CamOptions["cameraId"], CamOptions["x"], CamOptions["y"], CamOptions["z"])
	SetCamRot(CamOptions["cameraId"], CamOptions["rotationX"], CamOptions["rotationY"], CamOptions["rotationZ"])

	RenderScriptCams(true, false, 0, true, true)
end

function TeleportPlayer(pos)

	local Values = pos

	if #Values["goal"] > 1 then

		local elements = {}

		for i, v in pairs(Values["goal"]) do
			table.insert(elements, { label = v, value = v })
		end

		ESX.UI.Menu.Open(
			'default', GetCurrentResourceName(), 'teleport_jail',
			{
				title    = "Choose Position",
				align    = 'center',
				elements = elements
			},
		function(data, menu)

			local action = data.current.value
			local position = Config.Prision.Teleports[action]

			if action == "Boiling Broke" or action == "Security" then

				if PlayerData.job.name ~= "police" then
					ESX.ShowNotification("You don't have an key to go here!")
					return
				end
			end

			menu.close()

			DoScreenFadeOut(100)

			Citizen.Wait(250)

			SetEntityCoords(PlayerPedId(), position["x"], position["y"], position["z"])

			Citizen.Wait(250)

			DoScreenFadeIn(100)
			
		end,

		function(data, menu)
			menu.close()
		end)
	else
		local position = Config.Prision.Teleports[Values["goal"][1]]

		DoScreenFadeOut(100)

		Citizen.Wait(250)

		SetEntityCoords(PlayerPedId(), position["x"], position["y"], position["z"])

		Citizen.Wait(250)

		DoScreenFadeIn(100)
	end
end
