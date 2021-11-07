-------------------------------------------------
-- Created by Flagship Dev
-------------------------------------------------------

local Keys = {
    ["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
    ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
    ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
    ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
    ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
    ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
    ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
    ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
    ["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

local DataJob = {}

local CurrentAction, CurrentActionMsg, CurrentActionData = nil, '', {}
local HasAlreadyEnteredMarker, LastHospital, LastPart, LastPartNum
local isBusy, deadPlayers, deadPlayerBlips, isOnDuty = false, {}, {}, false
isInShopMenu = false
local PlayerData, CurrentActionData, handcuffTimer, dragStatus, blipsCops, currentTask, spawnedVehicles = {}, {}, {}, {}, {}, {}, {}
local HasAlreadyEnteredMarker, isDead, IsHandcuffed, hasAlreadyJoined, playerInService, isInShopMenu = false, false, false, false, false, false
local LastStation, LastPart, LastPartNum, LastEntity, CurrentAction, CurrentActionMsg
local chasePed = nil
local chaseVehicle =  nil
local chasePed2 = nil
local chaseVehicle2 = nil
dragStatus.isDragged = false
local name
local vip
local expire
ESX = nil
blip = nil




Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)

RegisterNetEvent('esx_phone:loaded')
AddEventHandler('esx_phone:loaded', function(phoneNumber, contacts)
	local specialContact = {
		name       = 'Downtown Cab Co.',
		number     = 'taxi',
		base64Icon = 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAABHNCSVQICAgIfAhkiAAAAAlwSFlzAAALEwAACxMBAJqcGAAABp5JREFUWIW1l21sFNcVhp/58npn195de23Ha4Mh2EASSvk0CPVHmmCEI0RCTQMBKVVooxYoalBVCVokICWFVFVEFeKoUdNECkZQIlAoFGMhIkrBQGxHwhAcChjbeLcsYHvNfsx+zNz+MBDWNrYhzSvdP+e+c973XM2cc0dihFi9Yo6vSzN/63dqcwPZcnEwS9PDmYoE4IxZIj+ciBb2mteLwlZdfji+dXtNU2AkeaXhCGteLZ/X/IS64/RoR5mh9tFVAaMiAldKQUGiRzFp1wXJPj/YkxblbfFLT/tjq9/f1XD0sQyse2li7pdP5tYeLXXMMGUojAiWKeOodE1gqpmNfN2PFeoF00T2uLGKfZzTwhzqbaEmeYWAQ0K1oKIlfPb7t+7M37aruXvEBlYvnV7xz2ec/2jNs9kKooKNjlksiXhJfLqf1PXOIU9M8fmw/XgRu523eTNyhhu6xLjbSeOFC6EX3t3V9PmwBla9Vv7K7u85d3bpqlwVcvHn7B8iVX+IFQoNKdwfstuFtWoFvwp9zj5XL7nRlPXyudjS9z+u35tmuH/lu6dl7+vSVXmDUcpbX+skP65BxOOPJA4gjDicOM2PciejeTwcsYek1hyl6me5nhNnmwPXBhjYuGC699OpzoaAO0PbYJSy5vgt4idOPrJwf6QuX2FO0oOtqIgj9pDU5dCWrMlyvXf86xsGgHyPeLos83Brns1WFXLxxgVBorHpW4vfQ6KhkbUtCot6srns1TLPjNVr7+1J0PepVc92H/Eagkb7IsTWd4ZMaN+yCXv5zLRY9GQ9xuYtQz4nfreWGdH9dNlkfnGq5/kdO88ekwGan1B3mDJsdMxCqv5w2Iq0khLs48vSllrsG/Y5pfojNugzScnQXKBVA8hrX51ddHq0o6wwIlgS8Y7obZdUZVjOYLC6e3glWkBBVHC2RJ+w/qezCuT/2sV6Q5VYpowjvnf/iBJJqvpYBgBS+w6wVB5DLEOiTZHWy36nNheg0jUBs3PoJnMfyuOdAECqrZ3K7KcACGQp89RAtlysCphqZhPtRzYlcPx+ExklJUiq0le5omCfOGFAYn3qFKS/fZAWS7a3Y2wa+GJOEy4US+B3aaPUYJamj4oI5LA/jWQBt5HIK5+JfXzZsJVpXi/ac8+mxWIXWzAG4Wb4g/jscNMp63I4U5FcKaVvsNyFALokSA47Kx8PVk83OabCHZsiqwAKEpjmfUJIkoh/R+L9oTpjluhRkGSPG4A7EkS+Y3HZk0OXYpIVNy01P5yItnptDsvtIwr0SunqoVP1GG1taTHn1CloXm9aLBEIEDl/IS2W6rg+qIFEYR7+OJTesqJqYa95/VKBNOHLjDBZ8sDS2998a0Bs/F//gvu5Z9NivadOc/U3676pEsizBIN1jCYlhClL+ELJDrkobNUBfBZqQfMN305HAgnIeYi4OnYMh7q/AsAXSdXK+eH41sykxd+TV/AsXvR/MeARAttD9pSqF9nDNfSEoDQsb5O31zQFprcaV244JPY7bqG6Xd9K3C3ALgbfk3NzqNE6CdplZrVFL27eWR+UASb6479ULfhD5AzOlSuGFTE6OohebElbcb8fhxA4xEPUgdTK19hiNKCZgknB+Ep44E44d82cxqPPOKctCGXzTmsBXbV1j1S5XQhyHq6NvnABPylu46A7QmVLpP7w9pNz4IEb0YyOrnmjb8bjB129fDBRkDVj2ojFbYBnCHHb7HL+OC7KQXeEsmAiNrnTqLy3d3+s/bvlVmxpgffM1fyM5cfsPZLuK+YHnvHELl8eUlwV4BXim0r6QV+4gD9Nlnjbfg1vJGktbI5UbN/TcGmAAYDG84Gry/MLLl/zKouO2Xukq/YkCyuWYV5owTIGjhVFCPL6J7kLOTcH89ereF1r4qOsm3gjSevl85El1Z98cfhB3qBN9+dLp1fUTco+0OrVMnNjFuv0chYbBYT2HcBoa+8TALyWQOt/ImPHoFS9SI3WyRajgdt2mbJgIlbREplfveuLf/XXemjXX7v46ZxzPlfd8YlZ01My5MUEVdIY5rueYopw4fQHkbv7/rZkTw6JwjyalBCHur9iD9cI2mU0UzD3P9H6yZ1G5dt7Gwe96w07dl5fXj7vYqH2XsNovdTI6KMrlsAXhRyz7/C7FBO/DubdVq4nBLPaohcnBeMr3/2k4fhQ+Uc8995YPq2wMzNjww2X+vwNt1p00ynrd2yKDJAVN628sBX1hZIdxXdStU9G5W2bd9YHR5L3f/CNmJeY9G8WAAAAAElFTkSuQmCC'
	}
	TriggerEvent('esx_phone:addSpecialContact', specialContact.name, specialContact.number, specialContact.base64Icon)
end)


local blipColourAct = 5
local blipColourTrab = 32
local blipActividad = 47
local blipTrabajo = 280

local blipsAct = {
--	{id = blipTrabajo, color = blipColourTrab, name = 'Actividad: Basureros', x = -318.05, y= -1538.93, z = 27.7}, -- Basureros
	--{id = blipTrabajo, color = blipColourTrab, name = 'Actividad: Viñadores', x = -1904.26, y= 2067.56, z = 140.5}, -- Viñador
	{id = blipActividad, color = blipColourAct, name = 'Actividad: Motocross', x = 831.55, y = 2359.78, z = 52.34}, -- Motocross
--	{id = blipTrabajo, color = blipColourTrab, name = 'Actividad: Mineros', x = 2570.37, y = 2718.59, z = 42.8}, -- Mineros
	{id = blipActividad, color = blipColourAct, name = 'Actividad: Alquiler de motos de agua', x = -1604.45, y = -1130.42, z = 2.14}, -- Alquiler Vehículos Acuáticos
	{id = blipActividad, color = blipColourAct, name = 'Actividad: Alquiler de motos de agua', x = 426.69, y = 3622.76, z = 31.76}, -- Alquiler Vehículos Acuáticos
	{id = blipActividad, color = blipColourAct, name = 'Actividad: Alquiler de motos de agua', x = 714.28, y = 4093.99, z = 34.73}, -- Alquiler Vehículos Acuáticos
	{id = blipActividad, color = blipColourAct, name = 'Actividad: Alquiler de motos de agua', x = 3368.3, y = 5185.01, z = 1.46}, -- Alquiler Vehículos Acuáticos
	{id = blipActividad, color = blipColourAct, name = 'Actividad: Alquiler de motos de agua', x = 2829.3, y = -637.14, z = 1.9}, -- Alquiler Vehículos Acuáticos
	{id = blipActividad, color = blipColourAct, name = 'Actividad: Alquiler de motos de agua', x = -192.96, y = 789.88, z = 198.11}, -- Alquiler Vehículos Acuáticos
--	{id = blipTrabajo, color = blipColourTrab, name = 'Actividad: Leñadores', x = -569.35, y = 5253.96, z = 70.47}, -- Leñador
	{id = blipActividad, color = blipColourAct, name = 'Actividad: Paracaidista', x = 431.4, y = 5618.33, z = 765.91}, -- Paracaidismo
--	{id = blipTrabajo, color = blipColourTrab, name = 'Actividad: Camioneros', x = 156.72, y = -3190.5, z = 6.03}, -- Camioneros
	{id = blipActividad, color = blipColourAct, name = "Actividad: Alquiler de bicis", x = -507.58, y = -256.43, z = 34.77}, -- Alquiler de bicis
	{id = blipActividad, color = blipColourAct, name = "Actividad: Alquiler de bicis", x = 215.21, y = -817.55, z = 30.65, h = 0.0}, -- Alquiler de bicis
	{id = blipActividad, color = blipColourAct, name = "Actividad: Alquiler de bicis", x = -41.3, y = -1117.65, z = 26.43, h = 0.0}, -- Alquiler de bicis
	{id = blipActividad, color = blipColourAct, name = "Actividad: Alquiler de bicis", x = 310.09, y = -231.8, z = 54.07, h = 0.0}, -- Alquiler de bicis
	{id = blipActividad, color = blipColourAct, name = "Actividad: Alquiler de bicis", x = -1199.1164,y = -1584.5972,z = 3.371159, h = 0.0}, -- Alquiler de bicis
	{id = blipActividad, color = blipColourAct, name = "Actividad: Alquiler de bicis", x = -7.42,y = -1716.93,z = 28.471159, h = 26.15}, -- Alquiler de bicis
	{id = blipTrabajo, color = blipColourTrab, name = "Actividad: Transportista", x = 787.0050, y = -2975.77441, z = 5.033}, -- Transportista
	{id = blipActividad, color = blipColourAct, name = "Actividad: Coches teledirigidos", x = 1139.5, y = 259.55, z = 79.99}, -- Coches teledirigidos
	{id = blipActividad, color = blipColourAct, name = "Actividad: F1", x = 221.78, y = 371.32, z = 105.32}, -- F1
	{id = blipActividad, color = blipColourAct, name = "Actividad: Alquiler de embarcaciones", x = -3426.7, y = 955.66, z = 7.35}, -- Alquiler de barcos
	{id = blipActividad, color = blipColourAct, name = "Actividad: Alquiler de embarcaciones", x = -732.9, y = -1309.76, z = 4.0}, -- Alquiler de barcos
	{id = blipActividad, color = blipColourAct, name = "Actividad: Alquiler de embarcaciones", x = -1607.6, y = 5252.8, z = 105.32}, -- Alquiler de barcos
	{id = blipActividad, color = blipColourAct, name = "Actividad: Alquiler de embarcaciones", x = 3855.0, y = 4463.7, z = 105.32}, -- Alquiler de barcos
	{id = blipActividad, color = blipColourAct, name = "Actividad: Alquiler de embarcaciones", x = 1330.8, y = 4226.6, z = 105.32}, -- Alquiler de barcos
	{id = blipTrabajo, color = blipColourTrab, name = "Actividad: Pesca", x = -3258.33, y = 983.98, z = 12.61}, -- Venta de pescado
	{id = blipTrabajo, color = blipColourTrab, name = "Actividad: Repartidor", x = -314.0, y = -1035.21, z = 30.53}, -- Deliveries
--	{id = blipTrabajo, color = blipColourTrab, name = "Actividad: Comprar minerales", x = 1905.96, y = 3718.96, z = 31.76}, -- Venta minerales
	{id = 313, color = 17, name = "Ammu-Nation", x = 18.43, y = -1112.11, z = 29.8}, -- Ammu
	{id = 311, color = 27, name = "Gym - Vespucci Beach", x = -1202.22, y = -1565.73, z = 4.61}, -- Gym
	{id = 311, color = 47, name = "Gym - Paleto Bay", x = -384.01, y = 6051.53, z = 31.46}, -- Gym
	{id = blipActividad, color = blipColourAct, name = "Actividad: Karting", x = -160.8, y = -2130.32, z = 16.02}, -- Alquiler de barcos
	{id = blipActividad, color = blipColourAct, name = "Actividad: Basketball", x = -52.77, y = -1387.2, z = 28.82}, -- Baloncesto
	{id = blipActividad, color = blipColourAct, name = "Actividad: Surf", x = -1518.04, y = -1352.68, z = 1.0}, -- Baloncesto
}

local blips = {
	--{id = 72, color = 5, name = 'LS Customs: Hawick Avenue', x = -351.26, y = -136.272, z = 39.009}, -- Mecánicos
	--{id = 311, color = 7, name = 'Gimnasio', x = -1201.2257, y = -1568.8670, z = 4.6101}, -- Gimnasio
}

local peds = {
--	{hash = GetHashKey('a_m_m_prolhost_01'), x = -318.05, y= -1538.93, z = 26.65, h = 308.67, msg = "Presiona ~y~E~s~ para trabajar como basurero", job = 'garbage', act = ''}, -- Basureros
	--{hash = GetHashKey('a_m_m_prolhost_01'), x = -1904.26, y= 2067.56, z = 139.82, h = 141.36, msg = "Presiona ~y~E~s~ para trabajar como viñador", job = 'vigne', act = ''}, -- Viñador
	{hash = GetHashKey('a_m_y_motox_01'), x = 831.55, y = 2359.78, z = 51.34, h = 262.42, msg = "Presiona ~y~E~s~ para alquilar una moto", job = '', act = 'motocross'}, -- Motocross
--	{hash = GetHashKey('a_m_y_salton_01'), x = 2570.37, y = 2718.59, z = 41.8, h = 211.67, msg = "Presiona ~y~E~s~ para trabajar como minero", job = 'miner', act = ''}, -- Mineros
	{hash = GetHashKey('a_f_y_beach_01'), x = -1604.45, y = -1130.42, z = 1.12, h = 224.25, msg = "Presiona ~y~E~s~ para alquilar una moto de agua", job = '', act = 'motoagua1'}, -- Alquiler Vehículos Acuáticos
	{hash = GetHashKey('a_f_y_beach_01'), x = 426.69, y = 3622.76, z = 30.77, h = 75.13, msg = "Presiona ~y~E~s~ para alquilar una moto de agua", job = '', act = 'motoagua2'}, --2
	{hash = GetHashKey('a_f_y_beach_01'), x = 714.28, y = 4093.99, z = 33.72, h = 91.37, msg = "Presiona ~y~E~s~ para alquilar una moto de agua", job = '', act = 'motoagua3'}, --3
	{hash = GetHashKey('a_f_y_beach_01'), x = 3368.3, y = 5185.01, z = 0.45, h = 178.04, msg = "Presiona ~y~E~s~ para alquilar una moto de agua", job = '', act = 'motoagua4'}, --4
	{hash = GetHashKey('a_f_y_beach_01'), x = 2829.3, y = -637.14, z = 0.89, h = 201.57, msg = "Presiona ~y~E~s~ para alquilar una moto de agua", job = '', act = 'motoagua5'}, --5
	{hash = GetHashKey('a_f_y_beach_01'), x = -192.96, y = 789.88, z = 197.10, h = 319.83, msg = "Presiona ~y~E~s~ para alquilar una moto de agua", job = '', act = 'motoagua6'}, --6
--	{hash = GetHashKey('a_m_m_prolhost_01'), x = -569.35, y = 5253.96, z = 69.47, h = 66.81, msg = "Presiona ~y~E~s~ para trabajar como leñador", job = 'lumberjack', act = ''}, -- Leñador
	{hash = GetHashKey('u_m_y_guido_01'), x = 431.4, y = 5618.33, z = 764.91, h = 254.68, msg = "Presiona ~y~E~s~ para hacer paracaidismo", job = '', act = 'paracaidismo'}, -- Paracaidismo
--	{hash = GetHashKey('a_m_m_prolhost_01'), x = 156.72, y = -3190.5, z = 6.03, h = 272.1, msg = "Presiona ~y~E~s~ para trabajar como camionero", job = 'trucker', act = ''}, -- Camioneros
	{hash = GetHashKey('a_m_y_hipster_03'), x = -508.12, y = -255.5, z = 34.63, h = 200.61, msg = '', job = '', act = ''}, -- Alquiler de bicis
	{hash = GetHashKey('a_m_y_hipster_03'), x = 215.45, y = -816.81, z = 29.65, h = 162.86, msg = '', job = '', act = ''}, -- Alquiler de bicis
	{hash = GetHashKey('a_m_y_hipster_03'), x = -40.93, y = -1118.38, z = 25.43, h = 14.25, msg = '', job = '', act = ''}, -- Alquiler de bicis
	{hash = GetHashKey('a_m_y_hipster_03'), x = 309.61, y = -231.23, z = 53.07, h = 160.24, msg = '', job = '', act = ''}, -- Alquiler de bicis
	{hash = GetHashKey('a_m_y_hipster_03'), x = -1199.1164,y = -1584.5972,z = 3.331159, h = 120.55, msg = '', job = '', act = ''}, -- Alquiler de bicis
	{hash = GetHashKey('a_m_y_hipster_03'), x = 787.0050, y = -2975.77441, z = 5.033, h = 87.4387, msg = "Presiona ~y~E~s~ para trabajar como transportista", job = '', act = ''}, -- Transportista
	{hash = GetHashKey('a_m_y_musclbeac_02'), x = -1195.6551,y = -1577.7689,z = 3.591155, h = 132.68, msg = '', job = '', act = ''}, -- Gym
	{hash = GetHashKey('u_m_y_sbike'), x = 1139.5, y = 259.55, z = 79.99, h = 56.59, msg = "Presiona ~y~E~s~ para conducir un coche teledirigido", job = '', act = 'teledirigidos'}, -- Coches teledirigidos
	{hash = GetHashKey('a_m_m_socenlat_01'), x = 221.78, y = 371.32, z = 105.29, h = 75.66, msg = "Presiona ~y~E~s~ para conducir un F1", job = '', act = 'f1'}, -- F1
	{hash = GetHashKey('a_m_y_beach_01'), x = -3426.7, y = 955.66, z = 7.35, h = 262.41, msg = "Presiona ~y~E~s~ para alquilar una embarcación", job = '', act = ''}, -- Alquiler de embarcaciones
	{hash = GetHashKey('a_m_y_beach_02'), x = -732.9, y = -1309.76, z = 4.0, h = 42.78, msg = "Presiona ~y~E~s~ para alquilar una embarcación", job = '', act = ''}, -- Alquiler de embarcaciones
	{hash = GetHashKey('a_m_y_clubcust_01'), x = -1607.6, y = 5252.8, z = 2.97, h = 210.77, msg = "Presiona ~y~E~s~ para alquilar una embarcación", job = '', act = ''}, -- Alquiler de embarcaciones
	{hash = GetHashKey('a_m_y_epsilon_02'), x = 3855.0, y = 4463.7, z = 1.73, h = 89.95, msg = "Presiona ~y~E~s~ para alquilar una embarcación", job = '', act = ''}, -- Alquiler de embarcaciones
	{hash = GetHashKey('a_m_y_golfer_01'), x = 1330.8, y = 4226.6, z = 32.92, h = 81.55, msg = "Presiona ~y~E~s~ para alquilar una embarcación", job = '', act = ''}, -- Alquiler de embarcaciones
	{hash = GetHashKey('s_m_m_migrant_01'), x = -3258.33, y = 983.98, z = 11.60, h = 273.41, msg = "Presiona ~y~E~s~ para hablar...", job = '', act = 'sellfish'}, -- Pescador
	{hash = GetHashKey('A_M_O_Tramp_01'), x = 1905.96, y = 3718.96, z = 31.76, h = 40.1, msg = "", job = '', act = ''}, -- Venta minerales
	{hash = GetHashKey('A_M_O_Tramp_01'), x = 1041.91, y = -3196.01, z = -39.16, h = 191.91, msg = "Presiona ~y~E~s~ para hablar...", job = '', act = 'weedshop'}, -- Venta weed
	{hash = GetHashKey('a_m_y_hipster_03'), x = -160.8, y = -2130.32, z = 15.70, h = 200.45, msg = "Presiona ~y~E~s~ para hablar...", job = '', act = 'karting'}, -- Karting
	{hash = GetHashKey('cs_lazlow'), x = -319.36, y = -1032.42, z = 29.50, h = 341.05, msg = "", job = '', act = ''}, -- Deliveries
	{hash = GetHashKey('cs_natalia'), x = -323.16, y = -1030.68, z = 29.50, h = 339.74, msg = "", job = '', act = ''}, -- Deliveries
	{hash = GetHashKey('cs_martinmadrazo'), x = -326.74, y = -1029.08, z = 29.50, h = 339.74, msg = "", job = '', act = ''}, -- Deliveries
	{hash = GetHashKey('cs_martinmadrazo'), x = 2556.14, y = 4661.66, z = 33.10, h = 204.58, msg = "", job = '', act = ''}, -- Black Market
	{hash = GetHashKey('cs_martinmadrazo'), x = -7.42,y = -1716.93,z = 28.471159, h = 26.15, msg = "", job = '', act = ''}, -- Alquiler bicis
	{hash = GetHashKey('cs_martinmadrazo'), x = -667.68, y = 5835.0, z = 16.34, h = 314.68, msg = "Presiona ~y~E~s~ para hablar...", job = '', act = 'blackshop'}, -- Black Market Objetos
	{hash = GetHashKey('u_f_y_lauren'), x =  -52.77, y = -1387.2, z = 28.49, h = 175.58, msg = "Presiona ~y~E~s~ para jugar al basket", job = '', act = 'basketball'}, --Basket
	{hash = GetHashKey('a_m_m_beach_02'), x = -1518.04, y = -1352.68, z = 0.6, h = 295.9, msg = "Presiona ~y~E~s~ para alquilar una tabla de surf", job = '', act = 'surf'}, --6
}

local toggleBlipsBool = false

Citizen.CreateThread(function()
	local toggleBlips = {}
	local blipsDrawn = false
	while true do
		Citizen.Wait(2000)
		if not toggleBlipsBool and not blipsDrawn then
			for k,v in pairs(blipsAct) do
				local blip = AddBlipForCoord(v.x, v.y, v.z)
				SetBlipSprite(blip, v.id)
				SetBlipDisplay(blip, 4)
				SetBlipScale(blip, 0.7)
				SetBlipColour(blip, v.color)
				SetBlipAsShortRange(blip, true)
				BeginTextCommandSetBlipName("STRING")
				AddTextComponentString(v.name)
				EndTextCommandSetBlipName(blip)
				table.insert(toggleBlips, blip)
			end
			blipsDrawn = true
		end

		if toggleBlipsBool then
			for i, blip in pairs(toggleBlips) do
				RemoveBlip(blip)
				table.remove(toggleBlips, i)
			end
			blipsDrawn = false
		end
	end
end)


--[[Citizen.CreateThread(function()
    for _, info in pairs(blips) do
		info.blip = AddBlipForCoord(info.x, info.y, info.z)
		SetBlipSprite(info.blip, info.id)
		SetBlipDisplay(info.blip, 4)
		SetBlipScale(info.blip, 0.7)
	 	SetBlipColour(info.blip, info.color)
		SetBlipAsShortRange(info.blip, true)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString(info.name)
		EndTextCommandSetBlipName(info.blip)
    end
end)]]--

Citizen.CreateThread(function()
	local playerCoords = GetEntityCoords(PlayerPedId())
		
	for _, inf in pairs(peds) do 
		--while GetDistanceBetweenCoords(playerCoords,inf.x, inf.y, inf.z,true) > 200 do
		--	Citizen.Wait(100)
		--	playerCoords = GetEntityCoords(PlayerPedId())
		--end

		local modelped = inf.hash
		RequestModel(modelped)
    	while not HasModelLoaded(modelped) do
        	Wait(1)
    	end
		local ped = CreatePed(1, modelped, inf.x, inf.y, inf.z, inf.h, false, true)
		SetModelAsNoLongerNeeded(modelped)
		SetBlockingOfNonTemporaryEvents(ped, true)
		SetPedDiesWhenInjured(ped, false)
		SetPedCanPlayAmbientAnims(ped, true)
		SetPedCanRagdollFromPlayerImpact(ped, false)
		SetEntityInvincible(ped, true)
		FreezeEntityPosition(ped, true)
		RequestAnimDict("amb@world_human_smoking@male@male_b@base")
		while not HasAnimDictLoaded("amb@world_human_smoking@male@male_b@base") do
		Citizen.Wait(1000)
		end
	--		
		Citizen.Wait(200)	
		TaskPlayAnim(ped,"amb@world_human_smoking@male@male_b@base","base",1.0, 1.0, -1, 9, 1.0, 0, 0, 0)
	end
end)

Citizen.CreateThread(function()

	while true do
		Citizen.Wait(0)
		local playerPed = PlayerPedId()
		local playerX, playerY, playerZ = table.unpack(GetEntityCoords(playerPed))
		local coords    = GetEntityCoords(playerPed)
		local sleep = true
		for _, v in pairs(peds) do
			if v.msg ~= '' then
				local distance = GetDistanceBetweenCoords(coords, v.x, v.y, v.z, true)
				if distance < 2 then
					sleep = false
					ESX.ShowFloatingHelpNotification(v.msg, vector3(v.x, v.y, v.z+1.93))
					if IsControlJustReleased(1,38) and v.job ~= '' then
						TriggerServerEvent('flag_masterjob:dartrabajo', v.job)
						ESX.ShowNotification('Has sido <span style="color:yellow">contratado</span>')
					elseif IsControlJustReleased(1,38) and v.act ~= '' then
						TriggerEvent('flag_actividad:open', v.act)
					end
				end
			end
		end

		if sleep then
			Wait(2000)
		end
	end
end)

Citizen.CreateThread(function()
	while vip == nil and name == nil do
		TriggerServerEvent('flag_menupersonal:esvip')
		TriggerServerEvent('flag_menupersonal:getnombre')
		Citizen.Wait(0)
	end
end)



RegisterNetEvent('flag_menupersonal:esvipClient')
AddEventHandler('flag_menupersonal:esvipClient', function(_vip, _time)
	vip = _vip
	expire = _time
end)

RegisterNetEvent('flag_menupersonal:getnombreClient')
AddEventHandler('flag_menupersonal:getnombreClient', function(_name)
  name = _name
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
  	PlayerData = xPlayer
end)

AddEventHandler('playerSpawned', function()
	Wait(60000)
	TriggerEvent('skinchanger:getSkin', function(skin)
		if skin.sex == 1 and not IsEntityDead(PlayerPedId()) then
			SetEntityHealth(PlayerPedId(), 200)
		end
	end)
end)



RegisterNetEvent('esx:setjob')
AddEventHandler('esx:setjob', function(job)
  PlayerData.job = job
end)


function OpenLicensesInformation()
  ESX.UI.Menu.Close()

  ESX.UI.Menu.Open('default',GetCurrentResourceName(),'more_info',
  { 
  title = _U('titleInfo'), 
  align = 'bottom-right', 
  elements = {
      {label = _U('showid'), value = 'showid'},
      {label = _U('seeid'), value = 'seeid'},
      {label = _U('seedriver'), value = 'seeDriver'},
      {label = _U('showdriver'), value = 'showDriver'},
      {label = _U('seeguns'), value = 'seeGuns'},
      {label = _U('showguns'), value = 'showGuns'},
    },
  }, function(data, menu)

    local player, distance = ESX.Game.GetClosestPlayer()
    
    if data.current.value == 'seeDriver' then
      TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(PlayerId()), 'driver')
    elseif data.current.value == 'showDriver' then
      if distance ~= -1 and distance <= 3.0 then
        TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(player), 'driver')
      else
        ESX.ShowNotification(_U('nearbyplayers'))
      end
    elseif data.current.value == 'showid' then
      local player, distance = ESX.Game.GetClosestPlayer()
      if distance ~= -1 and distance <= 3.0 then
        TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(player))
      else
        ESX.ShowNotification(_U('nearbyplayers'))
      end
    elseif data.current.value == 'seeid' then
      TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(PlayerId()))
    elseif data.current.value == 'seeGuns' then
      TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(PlayerId()), 'weapons')
    elseif data.current.value == 'showGuns' then
      if distance ~= -1 and distance <= 3.0 then
        TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(player), 'weapons')
      else
        ESX.ShowNotification(_U('nearbyplayers'))
      end
    end
  end, function(data, menu) 
  menu.close() 
  end)
end

function OpenLicensesInformation()
  ESX.UI.Menu.Close()

  ESX.UI.Menu.Open('default',GetCurrentResourceName(),'more_info',
  { 
  title = _U('titleInfo'), 
  align = 'bottom-right', 
  elements = {
      {label = _U('showid'), value = 'showid'},
      {label = _U('seeid'), value = 'seeid'},
      {label = _U('seedriver'), value = 'seeDriver'},
      {label = _U('showdriver'), value = 'showDriver'},
      {label = _U('seeguns'), value = 'seeGuns'},
      {label = _U('showguns'), value = 'showGuns'},
    },
  }, function(data, menu)

    local player, distance = ESX.Game.GetClosestPlayer()
    
    if data.current.value == 'seeDriver' then
      TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(PlayerId()), 'driver')
    elseif data.current.value == 'showDriver' then
      if distance ~= -1 and distance <= 3.0 then
        TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(player), 'driver')
      else
        ESX.ShowNotification(_U('nearbyplayers'))
      end
    elseif data.current.value == 'showid' then
      local player, distance = ESX.Game.GetClosestPlayer()
      if distance ~= -1 and distance <= 3.0 then
        TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(player))
      else
        ESX.ShowNotification(_U('nearbyplayers'))
      end
    elseif data.current.value == 'seeid' then
      TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(PlayerId()))
    elseif data.current.value == 'seeGuns' then
      TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(PlayerId()), 'weapons')
    elseif data.current.value == 'showGuns' then
      if distance ~= -1 and distance <= 3.0 then
        TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(player), 'weapons')
      else
        ESX.ShowNotification(_U('nearbyplayers'))
      end
    end
  end, function(data, menu) 
  menu.close() 
  end)
end

function OpenHUDMenu()
  ESX.UI.Menu.Close()

  local hud = true
  local cinematica = false
  ESX.UI.Menu.Open('default',GetCurrentResourceName(),'hud_menu',
  { 
  title = _U('hudtitle'), 
  align = 'bottom-right', 
  elements = {
    {label = _U('toggleHUD'), value = 'togglehud'},
    {label = _U('cinematic'), value = 'cinematica'},
    {label = _U('clearChat'), value = 'clearChat'},
    {label = _U('rockstar'), value = 'rockstar_interaction'}
    },
  }, function(data, menu)
    if data.current.value == 'togglehud' then
      if hud then
        HideHudComponentThisFrame(7)
        HideHudComponentThisFrame(8)
        HideHudComponentThisFrame(9)
        HideHudComponentThisFrame(6)
        HideHudComponentThisFrame(19)
        HideHudAndRadarThisFrame()
      --  ExecuteCommand("nohud")
        ESX.ShowNotification(_U('hudoff'))
        hud = false
      else
     --   ExecuteCommand("verhud")
        ESX.ShowNotification(_U('hudon'))
        hud = true
      end
    elseif data.current.value == 'cinematica' then
      if cinematica then 
        ExecuteCommand("cinematica")
        ESX.ShowNotification(_U('cinematicmodeoff'))
        cinematica = false
      else
        ExecuteCommand("cinematica")
        ESX.ShowNotification(_U('cinematicmodeon'))
        cinematica = true
      end
    elseif data.current.value == 'clearChat' then
      ExecuteCommand("clear")
      ESX.ShowNotification(_U('cleanchat'))
    elseif data.current.value == 'rockstar_interaction' then
      ActivateRockstarEditor()
    end
  end, function(data, menu) 
  menu.close() 
  end)
end

RegisterNetEvent('flag_masterjob:gunrackNot')
AddEventHandler('flag_masterjob:gunrackNot', function(gun)
	local name
	if gun == 'weapon_carbinerifle' then
		name = "AR-15"
	elseif gun == 'weapon_smg' then
		name = "MP5"
	elseif gun == 'weapon_pumpshotgun' then
		name = "Remington-870"
	end
	ExecuteCommand('me abrió el gunrack y guardó su '..name..'.')

end)

RegisterNetEvent('flag_masterjob:gunrackNYes')
AddEventHandler('flag_masterjob:gunrackNYes', function(gun)
	local name
	if gun == 'weapon_carbinerifle' then
		name = "AR-15"
	elseif gun == 'weapon_smg' then
		name = "MP5"
	elseif gun == 'weapon_pumpshotgun' then
		name = "Remington-870"
	end
	ExecuteCommand('me tomó una '..name..'  del gunrack.')
end)

function OpenEquiparpd()
	local ped = PlayerPedId()
	local elements = {}
	
	if not IsEntityPlayingAnim(PlayerPedId(), 'mini@repair', 'fixing_a_player', 3) then
        ESX.Streaming.RequestAnimDict('mini@repair', function()
            TaskPlayAnim(PlayerPedId(), 'mini@repair', 'fixing_a_player', 8.0, -8, -1, 49, 0, 0, 0, 0)
        end)
    end
	
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), "esx_policeArmory_kevlar_menu",
			{
				title    = "Equipar PD",
				align    = "bottom-right",
				elements = {
					{label = "Chaleco Ligero", armor = 25},
					{label = "Chaleco Normal", armor = 50},
					{label = "Chaleco Táctico", armor = 100},
				--	{label = "Casco Antidisturbios", armor = 1},
				--	{label = "Casco Táctico", armor = 2},
				--	{label = "Guantes látex", armor = 3},
					{label = "Quitar accesorios", armor = 0},
			}
			},
		function(data, menu)
			TriggerEvent('skinchanger:getSkin', function(skin)
				
				if skin.sex == 0 then		
					if data.current.armor == 0 then
						SetPedArmour(ped,data.current.armor)
						SetPedComponentVariation(PlayerPedId(), 9, 0, 0, 0)
						SetPedComponentVariation(PlayerPedId(), 1, 0, 0, 0)
					else
						if data.current.armor == 25 then
							SetPedArmour(ped,data.current.armor)
							SetPedComponentVariation(ped, Config.VestVariation1.componentId, Config.VestVariation1.drawableId, Config.VestVariation1.textureId, Config.VestVariation1.paletteId)
						elseif data.current.armor == 50 then
							SetPedArmour(ped,data.current.armor)
							SetPedComponentVariation(ped, Config.VestVariation2.componentId, Config.VestVariation2.drawableId, Config.VestVariation2.textureId, Config.VestVariation2.paletteId)
						elseif data.current.armor == 100 then
							SetPedArmour(ped,data.current.armor)
							SetPedComponentVariation(ped, Config.VestVariation3.componentId, Config.VestVariation3.drawableId, Config.VestVariation3.textureId, Config.VestVariation3.paletteId)
						elseif data.current.armor == 1 then
							SetPedComponentVariation(ped, Config.VestVariation4.componentId, Config.VestVariation4.drawableId, Config.VestVariation4.textureId, Config.VestVariation4.paletteId)
						elseif data.current.armor == 2 then
							SetPedComponentVariation(ped, Config.VestVariation5.componentId, Config.VestVariation5.drawableId, Config.VestVariation5.textureId, Config.VestVariation5.paletteId)
						elseif data.current.armor == 3 then
							SetPedComponentVariation(ped, Config.VestVariation6.componentId, Config.VestVariation6.drawableId, Config.VestVariation6.textureId, Config.VestVariation6.paletteId)
						end
					end
				else
					if data.current.armor == 0 then
						SetPedArmour(ped,data.current.armor)
						SetPedComponentVariation(PlayerPedId(), 9, 0, 0, 0)
						SetPedComponentVariation(PlayerPedId(), 1, 0, 0, 0)
					else
						if data.current.armor == 25 then
							SetPedArmour(ped,data.current.armor)
							SetPedComponentVariation(ped, Config.VestVariation11.componentId, Config.VestVariation11.drawableId, Config.VestVariation11.textureId, Config.VestVariation11.paletteId)
						elseif data.current.armor == 50 then
							SetPedArmour(ped,data.current.armor)
							SetPedComponentVariation(ped, Config.VestVariation22.componentId, Config.VestVariation22.drawableId, Config.VestVariation22.textureId, Config.VestVariation22.paletteId)
						elseif data.current.armor == 100 then
							SetPedArmour(ped,data.current.armor)
							SetPedComponentVariation(ped, Config.VestVariation33.componentId, Config.VestVariation33.drawableId, Config.VestVariation33.textureId, Config.VestVariation33.paletteId)
						elseif data.current.armor == 1 then
							SetPedComponentVariation(ped, Config.VestVariation44.componentId, Config.VestVariation44.drawableId, Config.VestVariation44.textureId, Config.VestVariation44.paletteId)
						elseif data.current.armor == 2 then
							SetPedComponentVariation(ped, Config.VestVariation55.componentId, Config.VestVariation55.drawableId, Config.VestVariation55.textureId, Config.VestVariation55.paletteId)
						elseif data.current.armor == 3 then
							SetPedComponentVariation(ped, Config.VestVariation66.componentId, Config.VestVariation66.drawableId, Config.VestVariation66.textureId, Config.VestVariation66.paletteId)
						end
					end
				end
			end)
						
			menu.close()
			insideMarker = false
			ClearPedSecondaryTask(PlayerPedId())
		end, function(data, menu)
			menu.close()
			insideMarker = false
			ClearPedSecondaryTask(PlayerPedId())
		end, function(data, menu)
		end)
end

function OpenGunrack()
	ESX.UI.Menu.Close()

	ESX.UI.Menu.Open('default',GetCurrentResourceName(),'more_info',
	{ 
	title = 'Gunrack', 
	align = 'bottom-right', 
	elements = {
		{label = 'Coger/Depositar AR-15', value = 'weapon_carbinerifle'},
		{label = 'Coger/Depositar Remington-870', value = 'weapon_pumpshotgun'},
		{label = 'Coger/Depositar MP5', value = 'weapon_smg'},
	  },
	}, function(data, menu)

	  if data.current.value == 'weapon_carbinerifle' then
		TriggerServerEvent('flag_masterjob:gunrack', data.current.value)
	--	ExecuteCommand('me tomó una una AR-15 del gunrack.')
	  elseif data.current.value == 'weapon_pumpshotgun' then
		TriggerServerEvent('flag_masterjob:gunrack', data.current.value)
	--	ExecuteCommand('me tomó una una Remington-870 del gunrack.')
	  elseif data.current.value == 'weapon_smg' then
		TriggerServerEvent('flag_masterjob:gunrack', data.current.value)
	--	ExecuteCommand('me tomó una una Glock-17 del gunrack.')
	  end
	end, function(data, menu) 
	menu.close() 
	end)
end
function OpenVehicleInteraction()
  ESX.UI.Menu.Close()

  DataJob = ESX.GetPlayerData()

  local elements = {}

  if DataJob.job.name == 'police' then
	table.insert(elements, {label = 'Equipar PD', value = 'equiparpd_interaction'})
    table.insert(elements, {label = 'Información del vehículo', value = 'matricula_interaction'})
    table.insert(elements, {label = 'Confiscar vehículo', value = 'confiscate_interaction'})
    if IsPedInAnyVehicle(PlayerPedId(), false) then
		table.insert(elements, {label = 'Gunrack', value = 'gunrack_interaction'})
		table.insert(elements, {label = 'Extras', value = 'extras_interaction'})
		table.insert(elements, {label = 'Liveries', value = 'livery_interaction'})
	end
  elseif DataJob.job.name == 'mechanic' or DataJob.job.name == 'mechanic2' or DataJob.job.name == 'mechanic3' or DataJob.job.name == 'mechanic4' or DataJob.job.name == 'mechanic5' or DataJob.job.name == 'mechanic6' then
    table.insert(elements, {label = 'Reparar vehículo', value = 'reparar_interaction'})
    table.insert(elements, {label = 'Limpiar vehículo', value = 'limpiar_interaction'})
    table.insert(elements, {label = 'Forzar cerradura', value = 'forzar_interaction'})
  end

  local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()

  ESX.UI.Menu.Open('default',GetCurrentResourceName(),'hud_menu',
  { 
    title = 'Interacción de vehículos', 
    align = 'bottom-right', 
    elements = elements,
  }, function(data, menu)
    
        local coords  = GetEntityCoords(playerPed)
        local vehicle = ESX.Game.GetVehicleInDirection()
        local playerPed = PlayerPedId()
        local vehicle   = ESX.Game.GetVehicleInDirection()
        if IsPedInAnyVehicle(playerPed, true) then
            vehicle = GetVehiclePedIsIn(playerPed, false)
        end
        local entity = vehicle
        carModel = GetEntityModel(entity)
        carName = GetDisplayNameFromVehicleModel(carModel)
        NetworkRequestControlOfEntity(entity)

      if DoesEntityExist(vehicle) then
        if data.current.value == 'matricula_interaction' then
          local vehicleData = ESX.Game.GetVehicleProperties(vehicle)
          ExecuteCommand('me Comprueba la matrícula en la PDA.')
          Wait(1000)
          ExecuteCommand('e tablet2')
          OpenVehicleInfosMenu(vehicleData)
        elseif data.current.value == 'confiscate_interaction' then
          local playerPed = PlayerPedId()

          if IsPedSittingInAnyVehicle(playerPed) then
            local vehicle = GetVehiclePedIsIn(playerPed, false)
            if GetPedInVehicleSeat(vehicle, -1) == playerPed then
              ExecuteCommand('e radio')
              ExecuteCommand('do Llegaría una grúa de LSC y retiraría el vehículo citado por el oficial llevándoselo de la zona.')
              Wait(2000)
              ESX.ShowNotification('Has <span style="color:yellow">incautado</span> el vehículo')
              ESX.Game.DeleteVehicle(vehicle)
            else
              ESX.ShowNotification('Tienes que estar en el asiento del <span style="color:yellow">conductor</span>')
            end
          else
            local vehicle = ESX.Game.GetVehicleInDirection()
            if DoesEntityExist(vehicle) then
              ExecuteCommand('e radio')
              ExecuteCommand('do Llegaría una grúa de LSC y retiraría el vehículo citado por el oficial llevándoselo de la zona.')
              Wait(2000)
              ESX.ShowNotification('Has <span style="color:yellow">incautado</span> el vehículo')
              ESX.Game.DeleteVehicle(vehicle)
            else
              ESX.ShowNotification('No hay <span style="color:yellow">vehículos</span> cerca')
            end
          end
		elseif data.current.value == 'equiparpd_interaction' then
			OpenEquiparpd()
		end
	  else
		if data.current.value == 'matricula_interaction' then
			ESX.ShowNotification('No hay <span style="color:yellow">vehículos</span> cerca')
        elseif data.current.value == 'confiscate_interaction' then
			ESX.ShowNotification('No hay <span style="color:yellow">vehículos</span> cerca')
		elseif data.current.value == 'equiparpd_interaction' then
			ESX.ShowNotification('No se detectan <span style="color:yellow">unidades</span> cerca')
		end
      end
      if data.current.value == 'extras_interaction' then
        OpenExtraMenu()
	  elseif data.current.value == 'livery_interaction' then
		OpenLiveryMenu()
	  elseif data.current.value == 'gunrack_interaction' then
		OpenGunrack()
      elseif data.current.value == 'reparar_interaction' then
        local playerPed = PlayerPedId()
			  local vehicle   = ESX.Game.GetVehicleInDirection()
			  local coords    = GetEntityCoords(playerPed)

			  if IsPedSittingInAnyVehicle(playerPed) then
				  ESX.ShowNotification('Tienes que estar <span style="color:yellow">fuera</span> del vehículo')
				  return
			  end

			  if DoesEntityExist(vehicle) then
				  isBusy = true
				  TaskStartScenarioInPlace(playerPed, 'PROP_HUMAN_BUM_BIN', 0, true)
				  Citizen.CreateThread(function()
					  Citizen.Wait(20000)

					  SetVehicleFixed(vehicle)
					  SetVehicleDeformationFixed(vehicle)
					  SetVehicleUndriveable(vehicle, false)
					  SetVehicleEngineOn(vehicle, true, true)
					  ClearPedTasksImmediately(playerPed)

					  ESX.ShowNotification('Vehículo <span style="color:yellow">reparado</span>')
					  isBusy = false
				  end)
			  else
				  ESX.ShowNotification('No hay <span style="color:yellow">vehículos</span> cerca')
			  end
      elseif data.current.value == 'limpiar_interaction' then
        local playerPed = PlayerPedId()
			  local vehicle   = ESX.Game.GetVehicleInDirection()
			  local coords    = GetEntityCoords(playerPed)

			  if IsPedSittingInAnyVehicle(playerPed) then
				  ESX.ShowNotification('Tienes que estar <span style="color:yellow">fuera</span> del vehículo')
				  return
			  end

			  if DoesEntityExist(vehicle) then
				  isBusy = true
				  TaskStartScenarioInPlace(playerPed, 'WORLD_HUMAN_MAID_CLEAN', 0, true)
				  Citizen.CreateThread(function()
					  Citizen.Wait(10000)

					  SetVehicleDirtLevel(vehicle, 0)
					  ClearPedTasksImmediately(playerPed)

					  ESX.ShowNotification('Has <span style="color:yellow">limpiado</span> el vehículo')
					  isBusy = false
				  end)
			  else
				  ESX.ShowNotification('No hay <span style="color:yellow">vehículos</span> cerca')
			  end
      elseif data.current.value == 'forzar_interaction' then
        local playerPed = PlayerPedId()
        local vehicle   = ESX.Game.GetVehicleInDirection()
        local coords    = GetEntityCoords(playerPed)
  
        if IsPedSittingInAnyVehicle(playerPed) then
          ESX.ShowNotification('Tienes que estar <span style="color:yellow">fuera</span> del vehículo')
          return
        end
  
        if DoesEntityExist(vehicle) then
          isBusy = true
          TaskStartScenarioInPlace(playerPed, 'WORLD_HUMAN_WELDING', 0, true)

          ExecuteCommand('me Fuerza la cerradura y abre el vehículo.')
          Citizen.CreateThread(function()
            Citizen.Wait(10000)
  
            SetVehicleDoorsLocked(vehicle, 1)
            SetVehicleDoorsLockedForAllPlayers(vehicle, false)
            ClearPedTasksImmediately(playerPed)
  
            ESX.ShowNotification('Vehículo <span style="color:yellow">desbloqueado</span>')
            isBusy = false
          end)
        else
          ESX.ShowNotification('No hay <span style="color:yellow">vehículos</span> cerca')
        end
      end
    end, function(data, menu) 
      menu.close() 
  end)
end

function OpenLiveryMenu()
	local elements = {}
	
	local vehicle = GetVehiclePedIsIn(PlayerPedId())
	local liveryCount = GetVehicleLiveryCount(vehicle)
			
	for i = 1, liveryCount do
		local state = GetVehicleLivery(vehicle) 
		local text
		
		if state == i then
			text = "Livery: "..i.." | "..('<span style="color:green;">%s</span>'):format("On")
		else
			text = "Livery: "..i.." | "..('<span style="color:red;">%s</span>'):format("Off")
		end
		
		table.insert(elements, {
			label = text,
			value = i,
			state = not state
		}) 
	end

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'livery_menu', {
		title    = 'Liveries',
		align    = 'bottom-right',
		elements = elements
	}, function(data, menu)
		SetVehicleLivery(vehicle, data.current.value, not data.current.state)
		local newData = data.current
		if data.current.state then
			newData.label = "Livery: "..data.current.value.." | "..('<span style="color:green;">%s</span>'):format("On")
		else
			newData.label = "Livery: "..data.current.value.." | "..('<span style="color:red;">%s</span>'):format("Off")
		end
		newData.state = not data.current.state
		menu.update({value = data.current.value}, newData)
		menu.refresh()
		menu.close()	
	end, function(data, menu)
		menu.close()		
	end)
end


function OpenExtraMenu()
	local elements = {}
	local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
	for id=0, 12 do
		if DoesExtraExist(vehicle, id) then
			local state = IsVehicleExtraTurnedOn(vehicle, id) 

			if state then
				table.insert(elements, {
					label = "Extra: "..id.." | "..('<span style="color:green;">%s</span>'):format("On"),
					value = id,
					state = not state
				})
			else
				table.insert(elements, {
					label = "Extra: "..id.." | "..('<span style="color:red;">%s</span>'):format("Off"),
					value = id,
					state = not state
				})
			end
		end
	end
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'extra_actions', {
		title    = 'Extras',
		align    = 'bottom-right',
		elements = elements
	}, function(data, menu)
		SetVehicleExtra(vehicle, data.current.value, not data.current.state)
		local newData = data.current
		if data.current.state then
			newData.label = "Extra: "..data.current.value.." | "..('<span style="color:green;">%s</span>'):format("On")
		else
			newData.label = "Extra: "..data.current.value.." | "..('<span style="color:red;">%s</span>'):format("Off")
		end
		newData.state = not data.current.state

		menu.update({value = data.current.value}, newData)
		menu.refresh()
	end, function(data, menu)
		menu.close()
	end)
end

function ImpoundVehicle(vehicle)
	local playerPed = PlayerPedId()
	local vehicle   = ESX.Game.GetVehicleInDirection()
	if IsPedInAnyVehicle(playerPed, true) then
	    vehicle = GetVehiclePedIsIn(playerPed, false)
	end
	local entity = vehicle
	carModel = GetEntityModel(entity)
	carName = GetDisplayNameFromVehicleModel(carModel)
	NetworkRequestControlOfEntity(entity)
	
	local timeout = 2000
	while timeout > 0 and not NetworkHasControlOfEntity(entity) do
	    Wait(100)
	    timeout = timeout - 100
	end
 
	SetEntityAsMissionEntity(entity, true, true)
	
	local timeout = 2000
	while timeout > 0 and not IsEntityAMissionEntity(entity) do
	    Wait(100)
	    timeout = timeout - 100
	end
 
	Citizen.InvokeNative( 0xEA386986E786A54F, Citizen.PointerValueIntInitialized( entity ) )
	
	if (DoesEntityExist(entity)) then 
	    DeleteEntity(entity)
	end 
	ESX.ShowNotification(_U('impound_successful'))
	currentTask.busy = false
end

function OpenVehicleInfosMenu(vehicleData)
	ESX.TriggerServerCallback('flag_menupersonal:getVehicleInfos', function(retrivedInfo)
		local elements = {{label = _U('plate', retrivedInfo.plate)}}

		if retrivedInfo.owner == nil then
			table.insert(elements, {label = _U('owner_unknown')})
		else
			table.insert(elements, {label = _U('owner', retrivedInfo.owner)})
		end

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'vehicle_infos', {
			title    = 'Información del vehículo',
			align    = 'bottom-right',
			elements = elements
		}, nil, function(data, menu)
			menu.close()
		end)
	end, vehicleData.plate)
end

function OpenCitizenInteraction()
  ESX.UI.Menu.Close()

  DataJob = ESX.GetPlayerData()

  local elements = {}

  if DataJob.job.name == 'police' then
    table.insert(elements, {label = 'Buscar', value = 'bodysearch_interaction'})
    table.insert(elements, {label = 'Documento de Identidad', value = 'id_interaction'})
    table.insert(elements, {label = 'Poner esposas', value = 'handcuff_interaction'})
    table.insert(elements, {label = 'Quitar esposas', value = 'unhandcuff_interaction'})
    table.insert(elements, {label = 'Escoltar', value = 'escoltar_interaction'})
    table.insert(elements, {label = 'Meter en el vehículo', value = 'put_interaction'})
    table.insert(elements, {label = 'Sacar del vehículo', value = 'out_interaction'})
    table.insert(elements, {label = 'Multas', value = 'bills_interaction'})
    table.insert(elements, {label = 'Administrar facturas pendientes', value = 'unpaidbills_interaction'})
    table.insert(elements, {label = 'Administrar licencias', value = 'licenses_interaction'})
  elseif DataJob.job.name == 'ambulance' then
    table.insert(elements, {label = 'Buscar', value = 'bodysearch_interaction'})
    table.insert(elements, {label = 'Tratar heridas', value = 'heridas_interaction'})
    table.insert(elements, {label = 'Reanimar', value = 'reanimar_interaction'})
    table.insert(elements, {label = 'Factura', value = 'billamb_interaction'})
  elseif DataJob.job.name == 'mechanic' or DataJob.job.name == 'mechanic2' or DataJob.job.name == 'mechanic3' or DataJob.job.name == 'mechanic4' or DataJob.job.name == 'mechanic5' or DataJob.job.name == 'mechanic6' then
    table.insert(elements, {label = 'Buscar', value = 'bodysearch_interaction'})
    table.insert(elements, {label = 'Factura', value = 'billmeca_interaction'})
  elseif DataJob.job.name == 'taxi' then
    table.insert(elements, {label = 'Buscar', value = 'bodysearch_interaction'})
    table.insert(elements, {label = 'Factura', value = 'billtaxi_interaction'})
  elseif DataJob.job.name == 'badu1' then
	table.insert(elements, {label = 'Buscar', value = 'bodysearch_interaction'})
    table.insert(elements, {label = 'Factura', value = 'billbadu1_interaction'})
  elseif DataJob.job.name == 'badu2' then
  	table.insert(elements, {label = 'Buscar', value = 'bodysearch_interaction'})
  	table.insert(elements, {label = 'Factura', value = 'billbadu2_interaction'})
  elseif DataJob.job.name == 'badu3' then
	table.insert(elements, {label = 'Buscar', value = 'bodysearch_interaction'})
    table.insert(elements, {label = 'Factura', value = 'billbadu3_interaction'})
  elseif DataJob.job.name == 'badu4' then
	table.insert(elements, {label = 'Buscar', value = 'bodysearch_interaction'})
    table.insert(elements, {label = 'Factura', value = 'billbadu4_interaction'})
  else
    table.insert(elements, {label = 'Buscar', value = 'bodysearch_interaction'})
  end

  local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()

  ESX.UI.Menu.Open('default',GetCurrentResourceName(),'hud_menu',
  { 
    title = _U('citizenTitle'), 
    align = 'bottom-right', 
    elements = elements,
  }, function(data, menu)

    	local player, distance = ESX.Game.GetClosestPlayer()
      	local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
      	if closestPlayer ~= -1 and closestDistance <= 3.0 then
        	if data.current.value == 'bodysearch_interaction' then
          	ExecuteCommand("me Le cachea.")
          	OpenBodySearchMenu(closestPlayer)
          	ESX.Streaming.RequestAnimDict('switch@trevor@escorted_out', function()
            	TaskPlayAnim(PlayerPedId(), 'anim@gangops@facility@servers@bodysearch@', 'player_search', 8.0, 1.0, 3000, 49, 0, 0, 0, 0)
          	end)
        	elseif data.current.value == 'id_interaction' then
          	ExecuteCommand('me Comprueba el ID.')
          	OpenIdentityCardMenu(closestPlayer)
        	elseif data.current.value == 'handcuff_interaction' then
          	local target, distance = ESX.Game.GetClosestPlayer()
          	playerheading = GetEntityHeading(PlayerPedId())
          	playerlocation = GetEntityForwardVector(PlayerPedId())
          	playerCoords = GetEntityCoords(PlayerPedId())
          	local target_id = GetPlayerServerId(target)
          	if distance <= 2.0 then
            	TriggerServerEvent('flag_menupersonal:requestarrest', target_id, playerheading, playerCoords, playerlocation)
            	ExecuteCommand("me Coge ambas manos del sujeto, las lleva a la espalda sacando su conjunto de esposas, acto seguido se las pone con cuidado.")
            	TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 0.9, 'handcuff', 0.9)
            	Wait(2000)
            	ExecuteCommand('do El sujeto estaría esposado.')
            	TriggerServerEvent('flag_menupersonal:handcuff', GetPlayerServerId(closestPlayer))		
          	else
            	ESX.ShowNotification('No estás lo suficientemente cerca.')
          	end
        elseif data.current.value == 'unhandcuff_interaction' then
        	local target, distance = ESX.Game.GetClosestPlayer()
          	playerheading = GetEntityHeading(PlayerPedId())
          	playerlocation = GetEntityForwardVector(PlayerPedId())
          	playerCoords = GetEntityCoords(PlayerPedId())
          	local target_id = GetPlayerServerId(target)
          	ExecuteCommand('me Saca de su cinturón las llaves de las esposas y se las introduce en las esposas, acto seguido se las quita poco a poco.')
          	TriggerServerEvent('flag_menupersonal:requestrelease', target_id, playerheading, playerCoords, playerlocation)
          	Wait(2000)
          	ExecuteCommand('do El sujeto se podría mover con libertad.')
          	TriggerServerEvent('flag_menupersonal:handcuff', GetPlayerServerId(closestPlayer))
        elseif data.current.value == 'escoltar_interaction' then
          	ExecuteCommand('me Agarra/Suelta del brazo.')
          	TriggerServerEvent('flag_menupersonal:drag', GetPlayerServerId(closestPlayer))
        elseif data.current.value == 'put_interaction' then
          	TriggerServerEvent('flag_menupersonal:putInVehicle', GetPlayerServerId(closestPlayer))
          	ExecuteCommand("me Abre la puerta del vehículo, le agacha la cabeza introduciéndole en el mismo y cierra la puerta")
        elseif data.current.value == 'out_interaction' then
          	TriggerServerEvent('flag_menupersonal:OutVehicle', GetPlayerServerId(closestPlayer))
          	ExecuteCommand("me Abre la puerta del vehículo, le ayuda a salir del mismo y cierra la puerta.")
        elseif data.current.value == 'bills_interaction' then
          	OpenFineMenu(closestPlayer)
        elseif data.current.value == 'unpaidbills_interaction' then
          	OpenUnpaidBillsMenu(closestPlayer)	
        elseif data.current.value == 'licenses_interaction' then
          	ShowPlayerLicense(closestPlayer)
        elseif data.current.value == 'heridas_interaction' then
          	ESX.TriggerServerCallback('flag_menupersonal:getItemAmount', function(quantity)
            	if quantity > 0 then
              		local closestPlayerPed = GetPlayerPed(closestPlayer)
              		local health = GetEntityHealth(closestPlayerPed)
              		if health > 0 then
                		local playerPed = PlayerPedId()
                		isBusy = true
                		ESX.ShowNotification('Estás <span style="color:yellow"> tratando </span>a alguien')
                		TaskStartScenarioInPlace(playerPed, 'CODE_HUMAN_MEDIC_TEND_TO_DEAD', 0, true)
                		Citizen.Wait(10000)
                		ClearPedTasks(playerPed)
                		TriggerServerEvent('flag_menupersonal:removeItem', 'bandage')
                		TriggerServerEvent('flag_menupersonal:heal', GetPlayerServerId(closestPlayer), 'big')
                		ESX.ShowNotification(_U('heal_complete', GetPlayerName(closestPlayer)))
                		isBusy = false
              		else
                		ESX.ShowNotification('El jugador no está <span style="color:yellow">consciente</span>')
              		end
            	else
             		ESX.ShowNotification('No tienes <span style="color:yellow">vendas</span>')
        		end
			end, 'bandage')
        elseif data.current.value == 'reanimar_interaction' then
          	revivePlayer(closestPlayer)
        elseif data.current.value == 'billamb_interaction' then
          	ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'ammende',{
					    title = 'Poner una factura'
				    }, function(data, menu)

					  	local amount = tonumber(data.value)

				  		if amount == nil or amount <= 0 then
				  			ESX.ShowNotification('Cantidad inválida')
				  		else
				  			menu.close()

				  			local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()

				  			if closestPlayer == -1 or closestDistance > 3.0 then
				  				ESX.ShowNotification('No hay jugadores <span style="color:yellow">cercanos</span>')
				  			else
						 	 	local playerPed = PlayerPedId()

					  			Citizen.CreateThread(function()
					  			TaskStartScenarioInPlace(playerPed, 'CODE_HUMAN_MEDIC_TIME_OF_DEATH', 0, true)
					  			Citizen.Wait(5000)
					  			ClearPedTasks(playerPed)
					  			TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(closestPlayer), 'society_ambulance', 'LSFD', amount)
					  			ESX.ShowNotification('Factura <span style="color:yellow">enviada</span>')							
				  			end)
				  		end
				  	end
			  	end, function(data, menu)
						menu.close()
			end)
        elseif data.current.value == 'billmeca_interaction' then
          	ESX.UI.Menu.Open(
				    'dialog', GetCurrentResourceName(), 'ammende',
				    {
					    title = 'Poner una factura'
				    }, function(data, menu)

					 	local amount = tonumber(data.value)

				  		if amount == nil or amount <= 0 then
				  			ESX.ShowNotification('Cantidad inválida')
				  		else
				  			menu.close()

				  			local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()

				  			if closestPlayer == -1 or closestDistance > 3.0 then
				  				ESX.ShowNotification('No hay jugadores <span style="color:yellow">cercanos</span>')
				  			else
							  	local playerPed = PlayerPedId()

						  		Citizen.CreateThread(function()
					  				TaskStartScenarioInPlace(playerPed, 'CODE_HUMAN_MEDIC_TIME_OF_DEATH', 0, true)
					  				Citizen.Wait(5000)
					  				ClearPedTasks(playerPed)
					  				TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(closestPlayer), 'society_mechanic', 'Mecánico', amount)
					  				ESX.ShowNotification('Factura <span style="color:yellow">enviada</span>')							
				  				end)
							end
				  		end
			  		end, 
				function(data, menu)
			  		menu.close()
			end)
        elseif data.current.value == 'billtaxi_interaction' then
          	ESX.UI.Menu.Open(
				    'dialog', GetCurrentResourceName(), 'ammende',
				    {
					    title = 'Poner una factura'
				    }, function(data, menu)

						local amount = tonumber(data.value)

				  		if amount == nil or amount <= 0 then
				  			ESX.ShowNotification('Cantidad inválida')
				  		else
				  			menu.close()

				  			local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()

				  			if closestPlayer == -1 or closestDistance > 3.0 then
				  				ESX.ShowNotification('No hay jugadores <span style="color:yellow">cercanos</span>')
				  			else
						  		local playerPed = PlayerPedId()

					  			Citizen.CreateThread(function()
					  				TaskStartScenarioInPlace(playerPed, 'CODE_HUMAN_MEDIC_TIME_OF_DEATH', 0, true)
					  				Citizen.Wait(5000)
					  				ClearPedTasks(playerPed)
					  				TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(closestPlayer), 'society_taxi', 'Downtown Cab Co.', amount)
					  				ESX.ShowNotification('Factura <span style="color:yellow">enviada</span>')							
				  				end)
				  			end
				  		end
			  		end,
				  function(data, menu)
				  	menu.close()
			    end)
			elseif data.current.value == 'billbadu1_interaction' then
				ESX.UI.Menu.Open(
					  'dialog', GetCurrentResourceName(), 'ammende',
					  {
						  title = 'Poner una factura'
					  }, function(data, menu)
  
						  local amount = tonumber(data.value)
  
							if amount == nil or amount <= 0 then
								ESX.ShowNotification('Cantidad inválida')
							else
								menu.close()
  
								local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
  
								if closestPlayer == -1 or closestDistance > 3.0 then
									ESX.ShowNotification('No hay jugadores <span style="color:yellow">cercanos</span>')
								else
									local playerPed = PlayerPedId()
  
									Citizen.CreateThread(function()
										TaskStartScenarioInPlace(playerPed, 'CODE_HUMAN_MEDIC_TIME_OF_DEATH', 0, true)
										Citizen.Wait(5000)
										ClearPedTasks(playerPed)
										TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(closestPlayer), 'society_badu1', 'LTD Badu Central', amount)
										ESX.ShowNotification('Factura <span style="color:yellow">enviada</span>')							
									end)
								end
							end
						end,
					function(data, menu)
						menu.close()
				end)
			elseif data.current.value == 'billbadu2_interaction' then
				ESX.UI.Menu.Open(
					  'dialog', GetCurrentResourceName(), 'ammende',
					  {
						  title = 'Poner una factura'
					  }, function(data, menu)
  
						  local amount = tonumber(data.value)
  
							if amount == nil or amount <= 0 then
								ESX.ShowNotification('Cantidad inválida')
							else
								menu.close()
  
								local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
  
								if closestPlayer == -1 or closestDistance > 3.0 then
									ESX.ShowNotification('No hay jugadores <span style="color:yellow">cercanos</span>')
								else
									local playerPed = PlayerPedId()
  
									Citizen.CreateThread(function()
										TaskStartScenarioInPlace(playerPed, 'CODE_HUMAN_MEDIC_TIME_OF_DEATH', 0, true)
										Citizen.Wait(5000)
										ClearPedTasks(playerPed)
										TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(closestPlayer), 'society_badu2', 'LTD Ruta 68 ', amount)
										ESX.ShowNotification('Factura <span style="color:yellow">enviada</span>')							
									end)
								end
							end
						end,
					function(data, menu)
						menu.close()
				end)
			elseif data.current.value == 'billbadu3_interaction' then
				ESX.UI.Menu.Open(
					  'dialog', GetCurrentResourceName(), 'ammende',
					  {
						  title = 'Poner una factura'
					  }, function(data, menu)
  
						  local amount = tonumber(data.value)
  
							if amount == nil or amount <= 0 then
								ESX.ShowNotification('Cantidad inválida')
							else
								menu.close()
  
								local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
  
								if closestPlayer == -1 or closestDistance > 3.0 then
									ESX.ShowNotification('No hay jugadores <span style="color:yellow">cercanos</span>')
								else
									local playerPed = PlayerPedId()
  
									Citizen.CreateThread(function()
										TaskStartScenarioInPlace(playerPed, 'CODE_HUMAN_MEDIC_TIME_OF_DEATH', 0, true)
										Citizen.Wait(5000)
										ClearPedTasks(playerPed)
										TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(closestPlayer), 'society_badu3', 'LTD Grapeseed', amount)
										ESX.ShowNotification('Factura <span style="color:yellow">enviada</span>')							
									end)
								end
							end
						end,
					function(data, menu)
						menu.close()
				end)
			elseif data.current.value == 'billbadu4_interaction' then
				ESX.UI.Menu.Open(
					  'dialog', GetCurrentResourceName(), 'ammende',
					  {
						  title = 'Poner una factura'
					  }, function(data, menu)
  
						  local amount = tonumber(data.value)
  
							if amount == nil or amount <= 0 then
								ESX.ShowNotification('Cantidad inválida')
							else
								menu.close()
  
								local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
  
								if closestPlayer == -1 or closestDistance > 3.0 then
									ESX.ShowNotification('No hay jugadores <span style="color:yellow">cercanos</span>')
								else
									local playerPed = PlayerPedId()
  
									Citizen.CreateThread(function()
										TaskStartScenarioInPlace(playerPed, 'CODE_HUMAN_MEDIC_TIME_OF_DEATH', 0, true)
										Citizen.Wait(5000)
										ClearPedTasks(playerPed)
										TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(closestPlayer), 'society_badu4', 'LTD Groove', amount)
										ESX.ShowNotification('Factura <span style="color:yellow">enviada</span>')							
									end)
								end
							end
						end,
					function(data, menu)
						menu.close()
				end)
		end
			----
      else
        ESX.ShowNotification('No hay <span style="color:yellow">jugadores</span> cerca')
      end
    end, function(data, menu) 
      menu.close() 
  end)
end

function revivePlayer(closestPlayer)
	isBusy = true

	ESX.TriggerServerCallback('flag_menupersonal:getItemAmount', function(quantity)
		if quantity > 0 then
			local closestPlayerPed = GetPlayerPed(closestPlayer)

			if IsPedDeadOrDying(closestPlayerPed, 1) then
				local playerPed = PlayerPedId()
				local lib, anim = 'mini@cpr@char_a@cpr_str', 'cpr_pumpchest'
				ESX.ShowNotification(_U('revive_inprogress'))

				for i=1, 15 do
					Citizen.Wait(900)

					ESX.Streaming.RequestAnimDict(lib, function()
						TaskPlayAnim(playerPed, lib, anim, 8.0, -8.0, -1, 0, 0.0, false, false, false)
					end)
				end

				TriggerServerEvent('flag_menupersonal:removeItem', 'medikit')
				TriggerServerEvent('flag_menupersonal:revive', GetPlayerServerId(closestPlayer), GetEntityCoords(PlayerPedId()))
			else
				ESX.ShowNotification(_U('player_not_unconscious'))
			end
		else
			ESX.ShowNotification(_U('not_enough_medikit'))
		end
		isBusy = false
	end, 'medikit')
end

RegisterNetEvent('flag_menupersonal:revive')
AddEventHandler('flag_menupersonal:revive', function(coords)
	local playerPed = PlayerPedId()
--	local coords = GetEntityCoords(playerPed)
	TriggerServerEvent('flag_menupersonal:setDeathStatus', false)

	DoScreenFadeOut(800)

	while not IsScreenFadedOut() do
		Citizen.Wait(50)
	end

	local formattedCoords = {
		x = coords.x, 
		y =  coords.y,
		z = coords.z
	}

	RespawnPed(playerPed, coords)
	StopScreenEffect('DeathFailOut')
	DoScreenFadeIn(800)
end)

RegisterNetEvent('flag_menupersonal:setDeadPlayers')
AddEventHandler('flag_menupersonal:setDeadPlayers', function(_deadPlayers)
	deadPlayers = _deadPlayers

	--if isOnDuty then
		for playerId,v in pairs(deadPlayerBlips) do
			RemoveBlip(v)
			deadPlayerBlips[playerId] = nil
		end

		for playerId,status in pairs(deadPlayers) do
			if status == 'distress' then
				local player = GetPlayerFromServerId(playerId)
				local playerPed = GetPlayerPed(player)
				local blip = AddBlipForEntity(playerPed)

				SetBlipSprite(blip, 303)
				SetBlipColour(blip, 1)
				SetBlipFlashes(blip, true)
				SetBlipCategory(blip, 7)

				BeginTextCommandSetBlipName('STRING')
				AddTextComponentSubstringPlayerName(_U('blip_dead'))
				EndTextCommandSetBlipName(blip)

				deadPlayerBlips[playerId] = blip
			end
		end
	--end
end)


function RespawnPed(ped, coords)

	SetEntityCoordsNoOffset(ped, coords.x, coords.y, coords.z, false, false, false, true)
	NetworkResurrectLocalPlayer(coords.x, coords.y, coords.z, 20.0, true, false)
	SetPlayerInvincible(ped, false)
	ClearPedBloodDamage(ped)

--	TriggerServerEvent('esx:onPlayerSpawn')
--	TriggerEvent('playerSpawned', coords.x, coords.y, coords.z, 20.0)
	TriggerEvent('esx:onPlayerSpawn')
--	TriggerEvent('playerSpawned') -- compatibility with old scripts, will be removed soon
end

RegisterNetEvent('flag_menupersonal:heal')
AddEventHandler('flag_menupersonal:heal', function(healType, quiet)
	local playerPed = PlayerPedId()
	local maxHealth = GetEntityMaxHealth(playerPed)

	if healType == 'small' then
		local health = GetEntityHealth(playerPed)
		local newHealth = math.min(maxHealth, math.floor(health + maxHealth / 8))
		SetEntityHealth(playerPed, newHealth)
	elseif healType == 'big' then
		SetEntityHealth(playerPed, maxHealth)
	end

	if not quiet then
		ESX.ShowNotification('Te han <span style="color:yellow">tratado</span>')
	end
end)


function ShowPlayerLicense(player)
	local elements, targetName = {}

	ESX.TriggerServerCallback('flag_menupersonal:getOtherPlayerData', function(data)
		if data.licenses then
			for i=1, #data.licenses, 1 do
				if data.licenses[i].label and data.licenses[i].type then
					table.insert(elements, {
						label = data.licenses[i].label,
						type = data.licenses[i].type
					})
				end
			end
		end

		if Config.EnableESXIdentity then
			targetName = data.firstname .. ' ' .. data.lastname
		else
			targetName = data.name
		end

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'manage_license', {
			title    = _U('license_revoke'),
			align    = 'bottom-right',
			elements = elements,
		}, function(data, menu)
			ESX.ShowNotification(_U('licence_you_revoked', data.current.label, targetName))
			TriggerServerEvent('flag_menupersonal:message', GetPlayerServerId(player), _U('license_revoked', data.current.label))

			TriggerServerEvent('esx_license:removeLicense', GetPlayerServerId(player), data.current.type)

			ESX.SetTimeout(300, function()
				ShowPlayerLicense(player)
			end)
		end, function(data, menu)
			menu.close()
		end)

	end, GetPlayerServerId(player))
end

function OpenUnpaidBillsMenu(player)
	local elements = {}

	ESX.TriggerServerCallback('esx_billing:getTargetBills', function(bills)
		for k,bill in ipairs(bills) do
			table.insert(elements, {
				label = ('%s - <span style="color:red;">%s</span>'):format(bill.label, _U('armory_item', ESX.Math.GroupDigits(bill.amount))),
				billId = bills[k].id
			})
		end

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'billing', {
			css      = 'police',
			title    = _U('unpaid_bills'),
			align    = 'bottom-right',
			elements = elements
		}, nil, function(data, menu)
			menu.close()
		end)
	end, GetPlayerServerId(player))
end


function OpenFineMenu(player)
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'fine', {
		css      = 'police',
		title    = 'Multas',
		align    = 'bottom-right',
		elements = {
			{label = 'Cap. 1 - Delitos de Tráfico', value = 0},
			{label = 'Cap. 2 - Delitos Menores',   value = 1},
			{label = 'Cap. 3 - Delitos Medios', value = 2},
			{label = 'Cap. 4 - Delitos Mayores',   value = 3}
	}}, function(data, menu)
		OpenFineCategoryMenu(player, data.current.value)
	end, function(data, menu)
		menu.close()
	end)
end

function OpenFineCategoryMenu(player, category)
	ESX.TriggerServerCallback('flag_menupersonal:getFineList', function(fines)
		local elements = {}

		for k,fine in ipairs(fines) do
			table.insert(elements, {
				label     = ('%s <span style="color:green;">%s</span>'):format(fine.label, _U('armory_item', ESX.Math.GroupDigits(fine.amount))),
				value     = fine.id,
				amount    = fine.amount,
				fineLabel = fine.label
			})
		end

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'fine_category', {
			css      = 'police',
			title    = _U('fine'),
			align    = 'bottom-right',
			elements = elements
		}, function(data, menu)
			menu.close()

			if Config.EnablePlayerManagement then
				TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(player), 'society_police', _U('fine_total', data.current.fineLabel), data.current.amount)
			else
				TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(player), '', _U('fine_total', data.current.fineLabel), data.current.amount)
			end

			ESX.SetTimeout(300, function()
				OpenFineCategoryMenu(player, category)
			end)
		end, function(data, menu)
			menu.close()
		end)
	end, category)
end

RegisterNetEvent('flag_menupersonal:OutVehicle')
AddEventHandler('flag_menupersonal:OutVehicle', function()
	local playerPed = PlayerPedId()

	if not IsPedSittingInAnyVehicle(playerPed) then
		return
	end

	local vehicle = GetVehiclePedIsIn(playerPed, false)
	TaskLeaveVehicle(playerPed, vehicle, 16)
end)

RegisterNetEvent('flag_menupersonal:putInVehicle')
AddEventHandler('flag_menupersonal:putInVehicle', function()
	local playerPed = PlayerPedId()
	local coords = GetEntityCoords(playerPed)

	if not IsHandcuffed then
		return
	end

	if IsAnyVehicleNearPoint(coords, 5.0) then
		local vehicle = GetClosestVehicle(coords, 5.0, 0, 71)

		if DoesEntityExist(vehicle) then
			local maxSeats, freeSeat = GetVehicleMaxNumberOfPassengers(vehicle)

			for i=maxSeats - 1, 0, -1 do
				if IsVehicleSeatFree(vehicle, i) then
					freeSeat = i
					break
				end
			end

			if freeSeat then
				TaskWarpPedIntoVehicle(playerPed, vehicle, freeSeat)
				dragStatus.isDragged = false
			end
		end
	end
end)

RegisterNetEvent('flag_menupersonal:drag')
AddEventHandler('flag_menupersonal:drag', function(copId)
	if not IsHandcuffed then
		return
	end

	dragStatus.isDragged = not dragStatus.isDragged
	dragStatus.CopId = copId
end)

Citizen.CreateThread(function()
	local playerPed
	local targetPed

	while true do
		Citizen.Wait(1)

		if IsHandcuffed then
			playerPed = PlayerPedId()

			if dragStatus.isDragged then
				targetPed = GetPlayerPed(GetPlayerFromServerId(dragStatus.CopId))

				-- undrag if target is in an vehicle
				if not IsPedSittingInAnyVehicle(targetPed) then
					AttachEntityToEntity(playerPed, targetPed, 11816, 0.54, 0.54, 0.0, 0.0, 0.0, 0.0, false, false, false, false, 2, true)
				else
					dragStatus.isDragged = false
					DetachEntity(playerPed, true, false)
				end

				if IsPedDeadOrDying(targetPed, true) then
					dragStatus.isDragged = false
					DetachEntity(playerPed, true, false)
				end

			else
				DetachEntity(playerPed, true, false)
			end
		else
			Citizen.Wait(2000)
		end
	end
end)

RegisterNetEvent('flag_menupersonal:getuncuffed')
AddEventHandler('flag_menupersonal:getuncuffed', function(playerheading, playercoords, playerlocation)
	local x, y, z   = table.unpack(playercoords + playerlocation * 1.0)
	z = z - 1.0
	SetEntityCoords(PlayerPedId(), x, y, z)
	SetEntityHeading(PlayerPedId(), playerheading)
	Citizen.Wait(250)
	loadanimdict('mp_arresting')
	TaskPlayAnim(PlayerPedId(), 'mp_arresting', 'b_uncuff', 8.0, -8,-1, 2, 0, 0, 0, 0)
	Citizen.Wait(5500)
	cuffed = false
	ClearPedTasks(PlayerPedId())
end)

RegisterNetEvent('flag_menupersonal:douncuffing')
AddEventHandler('flag_menupersonal:douncuffing', function()
	Citizen.Wait(250)
	loadanimdict('mp_arresting')
	TaskPlayAnim(PlayerPedId(), 'mp_arresting', 'a_uncuff', 8.0, -8,-1, 2, 0, 0, 0, 0)
	Citizen.Wait(5500)
	ClearPedTasks(PlayerPedId())
end)


Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local playerPed = PlayerPedId()

		if IsHandcuffed then
			--DisableControlAction(0, 1, true) -- Disable pan
			--DisableControlAction(0, 2, true) -- Disable tilt
			DisableControlAction(0, 24, true) -- Attack
			DisableControlAction(0, 257, true) -- Attack 2
			DisableControlAction(0, 25, true) -- Aim
			DisableControlAction(0, 263, true) -- Melee Attack 1
			--DisableControlAction(0, 32, true) -- W
			--DisableControlAction(0, 34, true) -- A
			--DisableControlAction(0, 31, true) -- S
			--DisableControlAction(0, 30, true) -- D

			DisableControlAction(0, 45, true) -- Reload
			DisableControlAction(0, 22, true) -- Jump
			DisableControlAction(0, 44, true) -- Cover
			DisableControlAction(0, 37, true) -- Select Weapon
			DisableControlAction(0, 23, true) -- Also 'enter'?

			DisableControlAction(0, 288,  true) -- Disable phone
			DisableControlAction(0, 289, true) -- Inventory
			DisableControlAction(0, 170, true) -- Animations
			DisableControlAction(0, 167, true) -- Job

			DisableControlAction(0, 0, true) -- Disable changing view
			DisableControlAction(0, 26, true) -- Disable looking behind
			DisableControlAction(0, 73, true) -- Disable clearing animation
			DisableControlAction(2, 199, true) -- Disable pause screen

			--DisableControlAction(0, 59, true) -- Disable steering in vehicle
			--DisableControlAction(0, 71, true) -- Disable driving forward in vehicle
			--DisableControlAction(0, 72, true) -- Disable reversing in vehicle

			--DisableControlAction(2, 36, true) -- Disable going stealth

			DisableControlAction(0, 47, true)  -- Disable weapon
			DisableControlAction(0, 264, true) -- Disable melee
			DisableControlAction(0, 257, true) -- Disable melee
			DisableControlAction(0, 140, true) -- Disable melee
			DisableControlAction(0, 141, true) -- Disable melee
			DisableControlAction(0, 142, true) -- Disable melee
			DisableControlAction(0, 143, true) -- Disable melee
			DisableControlAction(0, 75, true)  -- Disable exit vehicle
			DisableControlAction(27, 75, true) -- Disable exit vehicle

			if IsEntityPlayingAnim(playerPed, 'mp_arresting', 'idle', 3) ~= 1 then
				ESX.Streaming.RequestAnimDict('mp_arresting', function()
					TaskPlayAnim(playerPed, 'mp_arresting', 'idle', 8.0, -8, -1, 49, 0.0, false, false, false)
				end)
			end
		else
			Citizen.Wait(2000)
		end
	end
end)

RegisterNetEvent('flag_menupersonal:getarrested')
AddEventHandler('flag_menupersonal:getarrested', function(playerheading, playercoords, playerlocation)
	playerPed = PlayerPedId()
	SetCurrentPedWeapon(playerPed, GetHashKey('WEAPON_UNARMED'), true) -- unarm player
	local x, y, z   = table.unpack(playercoords + playerlocation * 1.0)
	SetEntityCoords(PlayerPedId(), x, y, z)
	SetEntityHeading(PlayerPedId(), playerheading)
	Citizen.Wait(250)
	loadanimdict('mp_arrest_paired')
	TaskPlayAnim(PlayerPedId(), 'mp_arrest_paired', 'crook_p2_back_right', 8.0, -8, 3750 , 2, 0, 0, 0, 0)
	Citizen.Wait(3760)
	cuffed = true
	loadanimdict('mp_arresting')
	TaskPlayAnim(PlayerPedId(), 'mp_arresting', 'idle', 8.0, -8, -1, 49, 0.0, false, false, false)
end)

function loadanimdict(dictname)
	if not HasAnimDictLoaded(dictname) then
		RequestAnimDict(dictname) 
		while not HasAnimDictLoaded(dictname) do 
			Citizen.Wait(1)
		end
		RemoveAnimDict(dictname)
	end
end

RegisterNetEvent('flag_menupersonal:doarrested')
AddEventHandler('flag_menupersonal:doarrested', function()
	Citizen.Wait(250)
	loadanimdict('mp_arrest_paired')
	TaskPlayAnim(PlayerPedId(), 'mp_arrest_paired', 'cop_p2_back_right', 8.0, -8,3750, 2, 0, 0, 0, 0)
	Citizen.Wait(3000)
end) 

RegisterNetEvent('flag_menupersonal:handcuff')
AddEventHandler('flag_menupersonal:handcuff', function()
	IsHandcuffed    = not IsHandcuffed
	local playerPed = PlayerPedId()

	Citizen.CreateThread(function()
		if IsHandcuffed then

			RequestAnimDict('mp_arresting')
			while not HasAnimDictLoaded('mp_arresting') do
				Citizen.Wait(100)
			end

			TaskPlayAnim(playerPed, 'mp_arresting', 'idle', 8.0, -8, -1, 49, 0, 0, 0, 0)

			SetEnableHandcuffs(playerPed, true)
			DisablePlayerFiring(playerPed, true)
			SetCurrentPedWeapon(playerPed, GetHashKey('WEAPON_UNARMED'), true) -- unarm player
			SetPedCanPlayGestureAnims(playerPed, false)
			DisplayRadar(false)

			if Config.EnableHandcuffTimer then

				if handcuffTimer then
					ESX.ClearTimeout(HandcuffTimer)
				end

				StartHandcuffTimer()
			end

		else

			if Config.EnableHandcuffTimer and HandcuffTimer then
				ESX.ClearTimeout(HandcuffTimer)
			end

			ClearPedSecondaryTask(playerPed)
			SetEnableHandcuffs(playerPed, false)
			DisablePlayerFiring(playerPed, false)
			SetPedCanPlayGestureAnims(playerPed, true)
			DisplayRadar(true)
		end
	end)

end)

function StartHandcuffTimer()
	if Config.EnableHandcuffTimer and handcuffTimer.active then
		ESX.ClearTimeout(handcuffTimer.task)
	end

	handcuffTimer.active = true

	handcuffTimer.task = ESX.SetTimeout(Config.handcuffTimer, function()
		ESX.ShowNotification(_U('unrestrained_timer'))
		TriggerEvent('flag_menupersonal:unrestrain')
		handcuffTimer.active = false
	end)
end

RegisterNetEvent('flag_menupersonal:unrestrain')
AddEventHandler('flag_menupersonal:unrestrain', function()
	if IsHandcuffed then
		local playerPed = PlayerPedId()
		IsHandcuffed = false

		ClearPedSecondaryTask(playerPed)
		SetEnableHandcuffs(playerPed, false)
		DisablePlayerFiring(playerPed, false)
		SetPedCanPlayGestureAnims(playerPed, true)
		FreezeEntityPosition(playerPed, false)
		DisplayRadar(true)

		-- end timer
		if Config.EnableHandcuffTimer and HandcuffTimer then
			ESX.ClearTimeout(HandcuffTimer)
		end
	end
end)

function OpenIdentityCardMenu(player)
	ESX.TriggerServerCallback('flag_menupersonal:getOtherPlayerData', function(data)
		local elements = {}
		local nameLabel = _U('name', data.name)
		local jobLabel, sexLabel, dobLabel, heightLabel, idLabel


		if Config.EnableESXIdentity then
			nameLabel = _U('name', data.firstname .. ' ' .. data.lastname)

			if data.sex then
				if string.lower(data.sex) == 'm' then
					sexLabel = _U('sex', _U('male'))
				else
					sexLabel = _U('sex', _U('female'))
				end
			else
				sexLabel = _U('sex', _U('unknown'))
			end

			if data.dob then
				dobLabel = _U('dob', data.dob)
			else
				dobLabel = _U('dob', _U('unknown'))
			end

			if data.height then
				heightLabel = _U('height', data.height)
			else
				heightLabel = _U('height', _U('unknown'))
			end

			if data.name then
				idLabel = _U('id', data.name)
			else
				idLabel = _U('id', _U('unknown'))
			end
		end

		local elements = {
			{label = nameLabel},
		}

		if Config.EnableESXIdentity then
			table.insert(elements, {label = sexLabel})
			table.insert(elements, {label = dobLabel})
			table.insert(elements, {label = heightLabel})
			table.insert(elements, {label = idLabel})
		end

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'citizen_interaction', {
			css      = 'police',
			title    = 'Documento de Identidad',
			align    = 'bottom-right',
			elements = elements
		}, nil, function(data, menu)
			menu.close()
		end)
	end, GetPlayerServerId(player))
end

function OpenBodySearchMenu(player)
	ESX.TriggerServerCallback('flag_menupersonal:getOtherPlayerData', function(data)
		local elements = {}
		
		table.insert(elements, {label = 'Dinero en mano: '..data.money..'$', value = 'money', itemType = 'money', amount = data.money})
		for i=1, #data.accounts, 1 do
			if data.accounts[i].name == 'black_money' and data.accounts[i].money > 0 then
				table.insert(elements, {
					label    = _U('confiscate_dirty', ESX.Math.Round(data.accounts[i].money)),
					value    = 'black_money',
					itemType = 'item_account',
					haveImage = true,
					amount   = data.accounts[i].money
				})

				break
			end
		end

		table.insert(elements, {label = _U('guns_label')})

		for i=1, #data.weapons, 1 do
			table.insert(elements, {
				label    = _U('confiscate_weapon', ESX.GetWeaponLabel(data.weapons[i].name), data.weapons[i].ammo),
				value    = data.weapons[i].name,
				itemType = 'item_weapon',
				haveImage = true,
				amount   = data.weapons[i].ammo
			})
		end

		table.insert(elements, {label = _U('inventory_label')})

		for i=1, #data.inventory, 1 do
			if data.inventory[i].count > 0 then
				table.insert(elements, {
					label    = _U('confiscate_inv', data.inventory[i].label, data.inventory[i].count),
					value    = data.inventory[i].name,
					itemType = 'item_standard',
					haveImage = true,
					amount   = data.inventory[i].count
				})
			end
		end

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'body_search', {
			title    = _U('search'),
			align    = 'bottom-right',
			elements = elements
		}, function(data, menu)
			if data.current.value then
				TriggerServerEvent('flag_menupersonal:confiscatePlayerItem', GetPlayerServerId(player), data.current.itemType, data.current.value, data.current.amount)
				OpenBodySearchMenu(player)
			end
		end, function(data, menu)
			menu.close()
		end)
	end, GetPlayerServerId(player))
end

function OpenPonerObjetos()
  ESX.UI.Menu.Close()

  DataJob = ESX.GetPlayerData()

  local elements = {}

  if DataJob.job.name == 'police' then
    table.insert(elements, {label = 'Cono', value = "prop_roadcone02a"})
    table.insert(elements, {label = 'Barrera 1', value = "prop_barrier_work05"})
    table.insert(elements, {label = "Barrera 2", value = 'prop_mp_barrier_02b'})
    table.insert(elements, {label = "Barrera 3", value = 'prop_barrier_work01b'})
    table.insert(elements, {label = 'Pinchos', value = "p_ld_stinger_s"})
    table.insert(elements, {label = 'Caja', value = "prop_boxpile_07d"})
    table.insert(elements, {label = 'Dinero', value = "hei_prop_cash_crate_half_full"})
    table.insert(elements, {label = "Cono Luz", value = 'prop_air_conelight'})
    table.insert(elements, {label = "Desvío Tráfico", value = 'prop_mp_arrow_barrier_01'})
    table.insert(elements, {label = "Desvío Tráfico 2", value = 'prop_trafficdiv_01'})
    table.insert(elements, {label = 'Desvio Tráfico 3', value = 'prop_trafficdiv_02'})
  elseif DataJob.job.name == 'mechanic' or DataJob.job.name == 'mechanic2' or DataJob.job.name == 'mechanic3' or DataJob.job.name == 'mechanic4' or DataJob.job.name == 'mechanic5' or DataJob.job.name == 'mechanic6' then
    table.insert(elements, {label = 'Cono', value = 'prop_roadcone02a'})
    table.insert(elements, {label = 'Caja de herramientas',  value = 'prop_toolchest_01'})
  end

  ESX.UI.Menu.Open('default',GetCurrentResourceName(),'hud_menu',
  { 
    title = 'Colocar objetos', 
    align = 'bottom-right', 
    elements = elements,
  }, function(data, menu)

    local playerPed = PlayerPedId()
    local coords = GetEntityCoords(playerPed)
    local forward = GetEntityForwardVector(playerPed)
    local x, y, z = table.unpack(coords + forward * 1.0)

    ESX.Game.SpawnObject(
      data.current.value,
      {x = x, y = y, z = z},
      function(obj)
        ESX.Streaming.RequestAnimDict('random@domestic', function()
        TaskPlayAnim(playerPed, 'random@domestic', 'pickup_low', 8.0, -8, 1900, 49, 0.0, false, false, false)
        end)
        SetEntityHeading(obj, GetEntityHeading(playerPed))
        PlaceObjectOnGroundProperly(obj)
      end
    )

    end, function(data, menu) 
      menu.close() 
  end)
end

function OpenF6Menu()
  ESX.UI.Menu.CloseAll()

  local DataJob = ESX.GetPlayerData()

  if DataJob.job.name == 'police' then
    _title = 'Policía' 
  elseif DataJob.job.name == 'ambulance' then
    _title = 'LSFD'
  elseif DataJob.job.name == 'mechanic' or DataJob.job.name == 'mechanic2' or DataJob.job.name == 'mechanic3' or DataJob.job.name == 'mechanic4' or DataJob.job.name == 'mechanic5' or DataJob.job.name == 'mechanic6' then
    _title = 'Mecánico'
  elseif DataJob.job.name == 'taxi' then
    _title = 'Taxi'
  elseif DataJob.job.name == 'badu1' then
    _title = 'LTD - Central'
  elseif DataJob.job.name == 'badu2' then
    _title = 'LTD - Ruta 68'
  elseif DataJob.job.name == 'badu3' then
    _title = 'LTD - Grapeseed'
  elseif DataJob.job.name == 'badu4' then
    _title = 'LTD - Groove'
  else 
    _title = 'Civil'
  end

  local elements = {}

  if DataJob.job.name == 'police' then
    table.insert(elements, {label = _U('documents'), value = 'documents_interactions'})
    table.insert(elements, {label = _U('citizen'), value = 'citizen_interaction'})
    table.insert(elements, {label = 'Interacción de vehículo', value = 'polvehicle_interaction'})
    table.insert(elements, {label = 'Colocar Objetos', value = 'polput_objects'})
    table.insert(elements, {label = 'Usar/Guardar escudo', value = 'shield_interaction'})
    table.insert(elements, {label = 'Activar referencia', value = 'ref_on'})
    table.insert(elements, {label = 'Menu prisión', value = 'jail_menu'})
  elseif DataJob.job.name == 'mechanic' or DataJob.job.name == 'mechanic2' or DataJob.job.name == 'mechanic3' or DataJob.job.name == 'mechanic4' or DataJob.job.name == 'mechanic5' or DataJob.job.name == 'mechanic6' then
    table.insert(elements, {label = _U('documents'), value = 'documents_interactions'})
    table.insert(elements, {label = _U('citizen'), value = 'citizen_interaction'})
    table.insert(elements, {label = 'Interacción de vehículo', value = 'polvehicle_interaction'})
    table.insert(elements, {label = 'Colocar Objetos', value = 'polput_objects'})
  elseif DataJob.job.name == 'ambulance' then
    table.insert(elements, {label = _U('documents'), value = 'documents_interactions'})
    table.insert(elements, {label = _U('citizen'), value = 'citizen_interaction'})
  elseif DataJob.job.name == 'taxi' then
    table.insert(elements, {label = _U('documents'), value = 'documents_interactions'})
    table.insert(elements, {label = _U('citizen'), value = 'citizen_interaction'})
  else
    table.insert(elements, {label = _U('documents'), value = 'documents_interactions'})
    table.insert(elements, {label = _U('citizen'), value = 'citizen_interaction'})
  end

  ESX.UI.Menu.Open(
    'default', GetCurrentResourceName(), 'menu_personal',
    {
      title    = _title,
      align    = 'bottom-right',
      elements = elements,
    },
    function(data, menu)

      local player, distance = ESX.Game.GetClosestPlayer()

    if data.current.value == 'documents_interactions' then
      OpenLicensesInformation()
    elseif data.current.value == 'citizen_interaction' then
      OpenCitizenInteraction()
    elseif data.current.value == 'polvehicle_interaction' then
      OpenVehicleInteraction()
    elseif data.current.value == 'polput_objects' then
      OpenPonerObjetos()
    elseif data.current.value == 'shield_interaction' then
      TriggerEvent('shield:TogglePoliceShield')
    elseif data.current.value == 'ref_on' then
      ExecuteCommand('ref')
    elseif data.current.value == 'jail_menu' then
      TriggerEvent("esx-qalle-jail:openJailMenu")
    end

    end,
    function(data, menu)
      menu.close()
    end
  )
end



function OpenMenuPersonal()
    ESX.UI.Menu.CloseAll()
	


	local elements = {}

	if vip == true then
		table.insert(elements, {label = 'Eres VIP hasta el '..expire, value = ''})
		table.insert(elements, {label = 'Información laboral', value = 'laboral_interaction'})
		table.insert(elements, {label = _U('stadistics'), value = 'stadistics'})
		table.insert(elements, {label = _U('infoGraphics'), value = 'hud_interaction'})
		table.insert(elements, {label = _U('billing'), value = 'billing_menu'})
		table.insert(elements, {label = _U('infoIds'), value = 'infoids'})
		table.insert(elements, {label = 'Activar/Desactivar blips de actividades', value = 'blips'})
		table.insert(elements, {label = 'Activar/Desactivar blips de propiedades', value = 'blipsPropiedades'})
	else
		table.insert(elements, {label = 'Información laboral', value = 'laboral_interaction'})
		table.insert(elements, {label = _U('stadistics'), value = 'stadistics'})
		table.insert(elements, {label = _U('infoGraphics'), value = 'hud_interaction'})
		table.insert(elements, {label = _U('billing'), value = 'billing_menu'})
		table.insert(elements, {label = _U('infoIds'), value = 'infoids'})
		table.insert(elements, {label = 'Activar/Desactivar blips de actividades', value = 'blips'})
		table.insert(elements, {label = 'Activar/Desactivar blips de propiedades', value = 'blipsPropiedades'})
	end

    local DataJob = ESX.GetPlayerData()
    local id =  GetPlayerServerId(NetworkGetEntityOwner(PlayerPedId()))

    local ids = true

    ESX.UI.Menu.Open(
      'default', GetCurrentResourceName(), 'menu_personal',
      {
        title    = name..' - ID: '..id,
        align    = 'bottom-right',
        elements = elements,
      },
      function(data, menu)

        local player, distance = ESX.Game.GetClosestPlayer()

        if data.current.value == 'hud_interaction' then
          	OpenHUDMenu()
		elseif data.current.value == 'blips' then
			if toggleBlipsBool then
				toggleBlipsBool = false
				ESX.ShowNotification('Has <span style="color:yellow">activado</span> los blips de las actividades.')
			elseif not toggleBlipsBool then
				ESX.ShowNotification('Has <span style="color:yellow">desactivado</span> los blips de las actividades.')
				toggleBlipsBool = true
			end
		elseif data.current.value == 'blipsPropiedades' then
			TriggerEvent('flag_masterjob:blipActividades')
        elseif data.current.value == 'laboral_interaction' then
          	OpenJob()
        elseif data.current.value == 'citizen_interaction' then
          	OpenCitizenInteraction()
        elseif data.current.value == 'vehicle_interaction' then
          	OpenVehicleInteraction()
        elseif data.current.value == 'infoids' then
          	ExecuteCommand("ids")
			if ids then
				ids = false
				ESX.ShowNotification(_('idson'))
			else
				ids = true
				ESX.ShowNotification(_U('idsoff'))
			end
        elseif data.current.value == 'documents_interactions' then
			OpenLicensesInformation()
        elseif data.current.value == 'billing_menu' then
			ShowBillsMenu()
        elseif data.current.value == 'stadistics' then
			ExecuteCommand("habilidades")
        end
      end,
      function(data, menu)
        menu.close()
      end
    )
end


function OpenJob()

  local DataJob = ESX.GetPlayerData()
  ESX.UI.Menu.Close()
  ESX.UI.Menu.Open('default',GetCurrentResourceName(),'hud_menu',
  { 
    title = 'Información laboral', 
    align = 'bottom-right', 
    elements = {
      {label = 'Estás trabajando de '..DataJob.job.label, value = 'togglehud'},
      },
  }, function(data, menu)

    end, function(data, menu) 
    menu.close() 
    end)
  end


function ShowBillsMenu()
	ESX.TriggerServerCallback('esx_billing:getBills', function(bills)
		ESX.UI.Menu.CloseAll()
		local elements = {}

		for i=1, #bills, 1 do
			table.insert(elements, {
				label  = ('%s - <span style="color:red;">%s</span>'):format(bills[i].label, _U('invoices_item', ESX.Math.GroupDigits(bills[i].amount))),
				billID = bills[i].id
			})
		end

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'billing',
		{
			title    = _U('invoices'),
			align    = 'bottom-right',
			elements = elements
		}, function(data, menu)
			menu.close()

			ESX.TriggerServerCallback('esx_billing:payBill', function()
				ShowBillsMenu()
			end, data.current.billID)
		end, function(data, menu)
			menu.close()
		end)
	end)

end

--Key Controls
Citizen.CreateThread(function()
  while true do
    Citizen.Wait(5)
    if IsControlPressed(0, 167) then
      OpenF6Menu()
    end
    if IsControlPressed(0, 168) then
      OpenMenuPersonal()
    end
  end
end)


AddEventHandler('esx:onPlayerDeath', function(data)
	isDead = true
end)

AddEventHandler('onResourceStop', function(resource)
	if resource == GetCurrentResourceName() then
		TriggerEvent('flag_menupersonal:unrestrain')
		if Config.EnableHandcuffTimer and handcuffTimer.active then
			ESX.ClearTimeout(handcuffTimer.task)
		end
	end
end)

basketball = nil
tasks = {}

RegisterCommand('baloncesto', function()
    local forward = GetEntityForwardVector(PlayerPedId())
    local coords = GetEntityCoords(PlayerPedId()) + forward * 2
    local entity = CreateObject(GetHashKey('prop_bskball_01'), coords, true, true, true)
    SetEntityVelocity(entity, 0.0001, 0.0, 0.0)
    SetEntityAsMissionEntity(entity, true, true)
end)

Citizen.CreateThread(function()
    while true do
        if IsControlJustReleased(0, 38) then
            if not basketball then
                local closestEntity, closestEntityDistance = GetClosestObjectOfType(GetEntityCoords(PlayerPedId()), 1.5, GetHashKey('prop_bskball_01'), false, false, false)
                local closestEntityDistance = #(GetEntityCoords(PlayerPedId()) - GetEntityCoords(closestEntity))
                if GetEntityModel(closestEntity) == GetHashKey('prop_bskball_01') and closestEntityDistance <= 1.5 then
                    PickupBasketball(closestEntity)
                end
            end
        end
        if IsControlJustReleased(0, 303) then
            if basketball then
                if not tasks.isRolling then
                    tasks.isRolling = true
                    LoadAnim('amb@world_human_mobile_film_shocking@male@base')
                    TaskPlayAnim(PlayerPedId(), 'amb@world_human_mobile_film_shocking@male@base', 'base', 8.0, 8.0, -1, 51, 0, false, false, false)
                    local ballRotation = 0.0
                    Citizen.CreateThread(function()
                        while tasks.isRolling do
                            if ballRotation > 360 then
                                ballRotation = 0.0
                                AttachEntityToEntity(basketball, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 28422), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, true, true, true, false, 0.0, false)
                            else
                                ballRotation = ballRotation + 60
                                AttachEntityToEntity(basketball, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 28422), 0.0, 0.0, 0.0, 0.0, 0.0, ballRotation, true, true, true, false, 0.0, false)
                            end
                            Citizen.Wait(0)
                        end
                    end)
                    Citizen.CreateThread(function()
                        Citizen.Wait(12000)
                        if tasks.isRolling then
                            DetachBasketball()
                            tasks.isRolling = false
                        end
                    end)
                else
                    ClearPedTasks(PlayerPedId())
                    tasks.isRolling = false
                end
            end
        end
        if IsDisabledControlPressed(0, 263) then
            if basketball then
                if not tasks.normalShootForce then tasks.normalShootForce = 0.1 end
                if tasks.normalShootForce < 2 then
                    tasks.normalShootForce = tasks.normalShootForce + 0.05
                end
            end
        end
        if IsDisabledControlJustReleased(0, 263) then
            if basketball then
                if not tasks.isShooting then
                    tasks.isShooting = true
                    LoadAnim('amb@prop_human_movie_bulb@exit')
                    ClearPedTasksImmediately(PlayerPedId())
                    local forwardX = GetEntityForwardX(PlayerPedId())
                    local forwardY = GetEntityForwardY(PlayerPedId())
                    DetachEntity(basketball)
                    SetEntityVelocity(basketball, forwardX * (tasks.normalShootForce * 10), forwardY * (tasks.normalShootForce * 10), tasks.normalShootForce * 10)
                    basketball = nil
                    TaskPlayAnim(PlayerPedId(), 'amb@prop_human_movie_bulb@exit', 'exit', 8.0, 8.0, -1, 48, 1, false, false, false)

                    Citizen.Wait(1000)
                    ClearPedTasks(PlayerPedId())
                    tasks.isShooting = false
                    tasks.normalShootForce = 0.1
                    tasks.isDribbling = false
                end
            end
        end
        if IsControlPressed(0, 47) then
            if basketball and not tasks.isDribbling then
                LoadAnim('anim@move_m@trash')
                TaskPlayAnim(PlayerPedId(), 'anim@move_m@trash', 'walk', 8.0, 8.0, -1, 51, 1, false, false, false)
                tasks.isDribbling = true
            end
        else
            if basketball and tasks.isDribbling then
                tasks.isDribbling = false
                StopAnimTask(PlayerPedId(), 'anim@move_m@trash', 'walk', 51)
                ClearPedTasksImmediately(PlayerPedId())
            end 
        end
        if IsControlJustReleased(0, 73) then
            if basketball then
                DetachBasketball()
            end
        end
        if basketball then
            DisableControlAction(0, 263, true)
            DisableControlAction(0, 264, true)
            DisableControlAction(0, 257, true)
            DisableControlAction(0, 140, true)
        end
        Citizen.Wait(5)
    end
end)

Citizen.CreateThread(function()
    while true do
        if basketball and tasks.isDribbling then
            local playerPed = PlayerPedId()
            if IsPedWalking(playerPed) or IsPedRunning(playerPed) then
                DetachEntity(basketball)
                local forwardX = GetEntityForwardX(playerPed)
                local forwardY = GetEntityForwardY(playerPed)
                SetEntityVelocity(basketball, forwardX * 2, forwardY * 2, -3.8)
                Citizen.Wait(300)
                forwardX = GetEntityForwardX(playerPed)
                forwardY = GetEntityForwardY(playerPed)
                SetEntityVelocity(basketball, forwardX * 1.9, forwardY * 1.9, 4.0)
                Citizen.Wait(450)
                AttachEntityToEntity(basketball, playerPed, GetPedBoneIndex(playerPed, 28422), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, true, true, true, false, 0.0, true)
            elseif IsPedSprinting(playerPed) then
                DetachEntity(basketball)
                local forwardX = GetEntityForwardX(playerPed)
                local forwardY = GetEntityForwardY(playerPed)
                SetEntityVelocity(basketball, forwardX * 9, forwardY * 9, -10.0)
                Citizen.Wait(200)
                forwardX = GetEntityForwardX(playerPed)
                forwardY = GetEntityForwardY(playerPed)
                SetEntityVelocity(basketball, forwardX * 8, forwardY * 8, 3.0)
                Citizen.Wait(300)
                AttachEntityToEntity(basketball, playerPed, GetPedBoneIndex(playerPed, 28422), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, true, true, true, false, 0.0, true)
            else 
                DetachEntity(basketball)
                SetEntityVelocity(basketball, 0.0, 0.0, -3.8)
                Citizen.Wait(250)
                SetEntityVelocity(basketball, 0, 0, 4.0)
                Citizen.Wait(450)
                AttachEntityToEntity(basketball, playerPed, GetPedBoneIndex(playerPed, 28422), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, true, true, true, false, 0.0, true)
            end
        end 
        Citizen.Wait(5)
    end
end)

function PickupBasketball(entity)
    NetworkRequestControlOfEntity(entity)
    while (NetworkGetEntityOwner(entity) ~= PlayerId()) and (NetworkGetEntityOwner(entity) ~= -1) do
        Citizen.Wait(3)
    end
    LoadAnim('anim@mp_snowball')
    TaskPlayAnim(PlayerPedId(), 'anim@mp_snowball', 'pickup_snowball', 8.0, 8.0, -1, 32, 1, false, false, false)
    Citizen.Wait(150)
    AttachEntityToEntity(entity, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 28422), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, true, true, true, false, 0.0, true)
    basketball = entity
    SetEntityAsMissionEntity(entity, true, true)
    Citizen.Wait(1500)
    ClearPedTasksImmediately(PlayerPedId())
end

function DetachBasketball()
    DetachEntity(basketball)
    basketball = nil
    tasks = {}
end

function LoadAnim(dict)
    RequestAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
        Citizen.Wait(0)
    end
    return true
end