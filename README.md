## sw-skills
- A database held skill/XP system for qb-core.
- Built in UI
- Credits to Kings#4220 his resource is based on the custom line branch of "B1-skillz" - for the original resource (with GTA V inherent modifications) please see: https://github.com/Burn-One-Studios/B1-skillz
- Credits to Mz-skills since this is a fork of hes skill system.

### [ What is this? ]
- A skillsystem based on GTA's existing skills.
- Very easy to configure, just check the config.
- You can for example add this to your gym script to get stronger.

### [ Installation ]
- Download the resource and drop it to your resource folder.
- Import the SQL file to your server's database (i.e. run the sql file and make sure the database runs)
- Add ``start sw-skills`` to your server.cfg (or simply make sure mz-skills is in your [qb] folder)

### [ Using sw-skills ]
!. To Update a skill please use the following export:
```lua
    exports["sw-skills"]:UpdateSkill(skill, amount)
```
 For example, to update "Searching" from bin-diving (as used with mz-bins)
```lua
    exports["sw-skills"]:UpdateSkill("Searching", 1)
```
 You can randomise the amount of skill gained, for example:
 ```lua
    local searchgain = math.random(1, 3)
    exports["sw-skills"]:UpdateSkill("Searching", searchgain)
```
B. The export to check to see if a skill is equal or greater than a particular value is as follows:
```lua
    exports["sw-skills"]:CheckSkill(skill, val)
```

You can use this to lock content behind a particular level, for example:
```lua
exports["mz-skills"]:CheckSkill("Searching", 100, function(hasskill)
    if hasskill then
        TriggerEvent('sw-bins:client:Reward')
    else
        QBCore.Functions.Notify('You need at least 100XP in Searching to do this.', "error", 3500)
    end
end)
```

- The export to obtain a player's current skill to interact with other scripts is as follows:
```lua
    exports["sw-skillz"]:GetCurrentSkill(skill)
```

- For radial menu access to "skills" command add this to qb-radialmenu/config.lua - line 296 and following:
```lua
    [3] = {
        id = 'skills',
        title = 'Check Skills',
        icon = 'triangle-exclamation',
        type = 'client',
        event = 'sw-skills:client:CheckSkills',
        shouldClose = true,
    },
```

### [ Previews ]

<p align="center">

</p>
