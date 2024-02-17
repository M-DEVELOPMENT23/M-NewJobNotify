Config = {}


Config.Debug = true

Config.notificationScript = "ox" -- QBCore/ox
Config.FooterText = "[E] To Go To Business"
Config.Cooldown = 10 -- IN (MS)

Config.Commands = {

    ["OpenBusiness"] = {
        command = "openbusiness",
        commanddescription = "Open Your Business with specific text defined on config.lua",
    },

    ["CloseBusiness"] = {
        command = "closebusiness",
        commanddescription = "Close Your Business with specific text defined on config.lua",
    },

    ["CustomText"] = {
        command = "announce",
        commanddescription = "Open / Close Your Business with a custom text",
    },

}


Config.Ui = {

    ---- Principal Card ----
    backgroundcolor = "rgba(33, 33, 33, 0.8)",
    opacity = "0.9",
    top = "22vw",
    left = "-1.5vw",

    ---- IMG----

    borderradiusimg = "15px",

    ---- Title ----

    fontsize = "18px",
    fontweight = "600",
    filter = "filter: drop-shadow(2px 4px 6px black)",
    
}



Config.Jobs = { --ADD ALL JOBS YOU WANT HERE

    -- EXEMPLE

    -- ["police"] = { --- Job Name
    --     name = "", -- Job label
    --     titlecolor = "", -- Title Color For the name and the icon
    --     image = "", --- image link
        
    --     openbusinesstext = "", --- Text for open business
    --     closebusinesstext = "" --- Text for close business
    --     textcolor = "", --- Color for these text

    --     icon = '', --- Icon that appears next to job label
    -- },

    ["police"] = {
        name = "LSPD",
        titlecolor = "#b2eccf",

        image = "https://media.discordapp.net/attachments/1086941762142093372/1201604886068989952/image-removebg-preview_3.png",        
        
        openbusinesstext = "From the management team of the LSPD of Los Santos we would like to inform you that we are available for any criminal action.",
        closebusinesstext = "From the management team of the LSPD of Los Santos we would like to inform you that we are not available for any criminal action.",
        textcolor = "#b2eccf",

        icon = 'fa-duotone fa-user-police',

        coords = {
            x = 441.8,
            y = -983.25,
        }
    },
    ["mechanic"] = {
        name = "Los Santos Customs",
        titlecolor = "white",

        image = "https://imgs.search.brave.com/cU_gVLYtoj6FTjWzHtAhz5cgW4OLrapGNz0ZmjavX64/rs:fit:860:0:0/g:ce/aHR0cHM6Ly9jZG4u/ZHJpYmJibGUuY29t/L3VzZXJzLzEzNzcy/NjY5L3NjcmVlbnNo/b3RzLzE5ODIzNzQw/L21lZGlhL2JiNDc2/ZjQ3ZTAzZmE2Y2Ey/MzEyMmI4OTgxMDkz/Y2Q2LnBuZz9yZXNp/emU9NDAweDMwMCZ2/ZXJ0aWNhbD1jZW50/ZXI",        
        
        openbusinesstext = "From the management team of the LSPD of Los Santos we would like to inform you that we are available for any criminal action.",
        closebusinesstext = "From the management team of the LSPD of Los Santos we would like to inform you that we are not available for any criminal action.",
        textcolor = "#b2eccf",

        icon = 'fa-duotone fa-user-police',

        coords = {
            x = 441.8,
            y = -983.25,
        }
    },
    
} 