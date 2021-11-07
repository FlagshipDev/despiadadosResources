Config                      = {}
Config.Locale = 'en'

Config.Accounts             = { 'bank', 'black_money' }
Config.AccountLabels        = { bank = _U('bank'), black_money = _U('black_money') }

Config.EnableSocietyPayouts = true -- pay from the society account that the player is employed at? Requirement: esx_society
Config.DisableWantedLevel   = true
Config.EnableHud            = false -- enable the default hud? Display current job and accounts (black, bank & cash)

Config.PaycheckInterval     = 30 * 60000

Config.MaxPlayers           = GetConvarInt("sv_maxclients", 1024) 

Config.EnableDebug          = false

-- Commands EN
Config.RecordCommandEN = 'record'
Config.OpenEditorCommandEN = 'rockstar'
Config.DiscardCommandEN = 'discard'
Config.SaveCommandEN = 'save'

Config.RecordCommandSuggestEN = 'Start Recording with Rockstar Editor'
Config.OpenEditorCommandSuggestEN = 'Save Rockstar Editor Recording'
Config.DiscardCommandSuggestEN = 'Discard Rockstar Editor Recording'
Config.SaveCommandSuggestEN = 'Open the Rockstar editor'


-- Command ES
Config.RecordCommandES = 'grabar'
Config.OpenEditorCommandES = 'rockstar'
Config.DiscardCommandES = 'descartar'
Config.SaveCommandES = 'guardar'

Config.RecordCommandSuggestES = 'Empezar grabación de Rockstar Editor'
Config.OpenEditorCommandSuggestES = 'Guardar la grabación de Rockstar Editor'
Config.DiscardCommandSuggestES = 'Descartar la grabación de Rockstar Editor'
Config.SaveCommandSuggestES = 'Abrir el editor de Rockstar'