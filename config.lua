Config = {}

Config.UpdateFrequency = 1800 -- seconds interval between removing values

Config.Debug = false -- debug print

Config.Skillmenu = "skills" -- skillmenu command

Config.Skills = {
    ["Searching"] = {
        ["Current"] = 0,
        ["RemoveAmount"] = 0,
        ["Stat"] = "BINDIVE_ABILITY",
        ['icon'] = 'fas fa-trash',
        ['nameInTablet'] = "Searching",
        ['pBarColor'] = "#f69833"
    },
    ["Scraping"] = {
        ["Current"] = 0,
        ["RemoveAmount"] = 0,
        ["Stat"] = "SCRAP_ABILITY",
        ['icon'] = 'fas fa-screwdriver',
        ['nameInTablet'] = "Scraping",
        ['pBarColor'] = "#3df633"
    },
    ["Hacking"] = {
        ["Current"] = 0,
        ["RemoveAmount"] = 0,
        ["Stat"] = "HACK_ABILITY",
        ['icon'] = 'fas fa-laptop-code',
        ['nameInTablet'] = "Hacking",
        ['pBarColor'] = "#f65733"
    },
    ["Street Reputation"] = {
        ["Current"] = 0,
        ["RemoveAmount"] = 0,
        ["Stat"] = "DRUGREP_ABILITY",
        ['icon'] = 'fas fa-cannabis',
        ['nameInTablet'] = "Street Reputation",
        ['pBarColor'] = "#33f671"
    },
    ["Drug Manufacture"] = {
        ["Current"] = 0,
        ["RemoveAmount"] = 0,
        ["Stat"] = "DRUGMAKE_ABILITY",
        ['icon'] = 'fas fa-pills',
        ['nameInTablet'] = "Drug Manufacture",
        ['pBarColor'] = "#33f6f3"
    },
    ["Stamina"] = {
        ["Current"] = 0, -- Default value
        ["RemoveAmount"] = -0.3, -- % to remove when updating,
        ["Stat"] = "MP0_STAMINA", -- GTA stat hashname
        ['icon'] = 'fas fa-walking',
        ['nameInTablet'] = "Stamina",
        ['pBarColor'] = ""
    },

    ["Strength"] = {
        ["Current"] = 0,
        ["RemoveAmount"] = -0.3,
        ["Stat"] = "MP0_STRENGTH",
        ['icon'] = 'fas fa-dumbbell',
        ['nameInTablet'] = "Strength",
        ['pBarColor'] = "#f63367"
    },

    ["Lung Capacity"] = {
        ["Current"] = 0,
        ["RemoveAmount"] = -0.1,
        ["Stat"] = "MP0_LUNG_CAPACITY",
        ['icon'] = 'fas fa-heartbeat',
        ['nameInTablet'] = "Lung Capacity",
        ['pBarColor'] = ""
    },

    ["Shooting"] = {
        ["Current"] = 0,
        ["RemoveAmount"] = -0.1,
        ["Stat"] = "MP0_SHOOTING_ABILITY",
        ['icon'] = 'fas fa-bullseye',
        ['nameInTablet'] = "Shooting",
        ['pBarColor'] = "#656664"
    },

    ["Driving"] = {
        ["Current"] = 0,
        ["RemoveAmount"] = -0.5,
        ["Stat"] = "MP0_DRIVING_ABILITY",
        ['icon'] = 'fas fa-car-side',
        ['nameInTablet'] = "Driving",
        ['pBarColor'] = "#677e4f"
    },
}