--[[ ############################################ --]]
--[[ ######## SISTEMA DE STATS PARA ESX ######### --]]
--[[ ########   CREADO POR Yisus#6342  ######### --]]
--[[ ############################################ --]]
--[[ ########  RENOMBRAR O MODIFICAR ESTE SCRIPT PUEDE ROMPERLO POR COMPLETO  ######### --]]
Config = {}

Config.UpdateFrequency = 8200 -- Segundos que pasan para borrar un stat. (Por defecto 1 hora)
Config.DeleteStats = true -- True = borramos un poco de las stats cada vez que el tiempo especificado (Config.UpdateFrequency) pase.

Config.WinStatsByDefault = false -- Si esta en true, ganarás stats realizando tareas como correr por defecto, conducir y demás. (Recomendado en true... y dejar el deletestats en true)
Config.Notifications = true --  notificamos cuando pierdes/ganas stats?

Config.Skills = {
    ["Resistencia"] = { -- Nombre del skill
        ["Current"] = 20, -- Valor por defecto
        ["RemoveAmount"] = -0.3, -- % a remover en caso de que Config.DeleteStats sea = true
        ["Stat"] = "MP0_STAMINA" -- Nombre del stat (nativo)
    },

    ["Fuerza"] = {
        ["Current"] = 10,
        ["RemoveAmount"] = -0.3,
        ["Stat"] = "MP0_STRENGTH"
    },

    ["Buceo"] = {
        ["Current"] = 0,
        ["RemoveAmount"] = -0.3,
        ["Stat"] = "MP0_LUNG_CAPACITY"
    },

    ["Chill"] = {
        ["Current"] = 0,
        ["RemoveAmount"] = -0.1,
        ["Stat"] = "stress"
    },

    ["Puntos de rol positivos"] = {
        ["Current"] = 0,
        ["RemoveAmount"] = 0,
        ["Stat"] = "positive"
    },

    ["Puntos de rol negativos"] = {
        ["Current"] = 0,
        ["RemoveAmount"] = 0,
        ["Stat"] = "negative"
    }
}
