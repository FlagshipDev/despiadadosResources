Config = {
    language = 'en',
    color = { r = 207, g = 153, b = 240, a = 255 }, -- Text color
    font = 0, -- Text font
    time = 5000, -- Duration to display the text (in ms)
    scale = 0.3, -- Text scale
    dist = 250, -- Min. distance to draw 
}

-- Languages available
Languages = {
    ['en'] = {
        commandName = 'me',
        commandDescription = 'Display an action above your head.',
        commandSuggestion = {{ name = 'action', help = '"scratch his nose" for example.'}},
        prefix = 'the person '
    },
    ['fr'] = {
        commandName = 'me',
        commandDescription = 'Affiche une action au dessus de votre tête.',
        commandSuggestion = {{ name = 'action', help = '"se gratte le nez" par exemple.'}},
        prefix = 'l\'individu '
    },
}

Config.Locale = 'en'

Config.EnableESXIdentity = true -- only turn this on if you are using esx_identity and want to use RP names
Config.OnlyFirstname     = false