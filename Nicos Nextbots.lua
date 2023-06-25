local myString = key
local firstFour = string.sub(myString, 1, 9)

print(LRM_UserNote)
print(key)
print(Key)

if LRM_UserNote == "Not specified" then
    if key == Key then
        getgenv().xw0DLBPTqZkzEWOXx6qCScoNKSoBhGh = false
        getgenv().UtlpHuOwhroliTt4DRSwzv4qdQYuK9M = false
        getgenv().M6bBwLtxy43AzjR2jRZUe2bHslRrs0y = true
    end
end
if LRM_UserNote == "Premium" or LRM_UserNote == "Giveaway" or LRM_UserNote == "Booster" or firstFour == "EventKey_" then
    if key ~= Key then
        getgenv().UtlpHuOwhroliTt4DRSwzv4qdQYuK9M = false
        getgenv().xw0DLBPTqZkzEWOXx6qCScoNKSoBhGh = true
        getgenv().M6bBwLtxy43AzjR2jRZUe2bHslRrs0y = true
    end
end
if LRM_UserNote == "Dev" then
    if key ~= Key then
        getgenv().UtlpHuOwhroliTt4DRSwzv4qdQYuK9M = true
        getgenv().xw0DLBPTqZkzEWOXx6qCScoNKSoBhGh = true
        getgenv().M6bBwLtxy43AzjR2jRZUe2bHslRrs0y = true
    end
end

if LRM_UserNote == "Not specified" and key ~= Key then
    if firstFour ~= "EventKey_" then
        setclipboard("https://discord.com/invite/JN6wgVrUAr")
        game.Players.LocalPlayer:Kick("Bypassing The Key System is Against My Terms Of Service.")
        task.wait(0.1)
        while true do end
    end
else
    local NotificationLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/lobox920/Notification-Library/Main/Library.lua"))()

    local function runpcall(func, arg, arg2, arg3, ...)
        local success, errorMsg = pcall(func, arg, arg2, arg3, ...)
    
        if not success then
            setclipboard(errorMsg)
            NotificationLibrary:SendNotification(
                "Error",
                "Error occurred: " .. errorMsg,
                15
            )
        else
            warn("Successfully Ran Function")
        end
    end

    local lastCallTime = 0

    local function Notification(status, feature)
        local currentTime = os.time()
        
        if currentTime - lastCallTime >= 0.5 then
            lastCallTime = currentTime
    
            if status == true then
                NotificationLibrary:SendNotification("Success", "" .. feature .. " Is Now Enabled!", 1.75)
            elseif status == false then
                NotificationLibrary:SendNotification("Error", "" .. feature .. " Is Now Disabled!", 1.75)
            elseif status == "Info" then
                NotificationLibrary:SendNotification("Info", "" .. feature .. "", 4)
            elseif status == "Warn" then
                NotificationLibrary:SendNotification("Warning", feature, 10)
            end
        end
    end

    local tostringLocalPlayerName = tostring(game:GetService("Players").LocalPlayer.Name)

    pcall(function()
        if not game.workspace:FindFirstChild(tostringLocalPlayerName) then
            spawnedin = false
            Notification("Warn", "You are currently not spawned into the map, please spawn for the gui to appear!                                        .                                                                  Dont execute the script again.")
        end
        task.wait(1)
            while not game.workspace:WaitForChild(tostringLocalPlayerName) do
                task.wait()
            end
            speedstring = tostring(humanoid.WalkSpeed):sub(1, 4)
            walkspeed = tonumber(speedstring)
        end
    )

    while not game.workspace:WaitForChild(tostringLocalPlayerName) do
        task.wait()
    end

    task.wait(0.25)

    local player = game.Players.LocalPlayer

    while not game.workspace:WaitForChild(tostringLocalPlayerName):WaitForChild("Humanoid") do
        task.wait()
    end

    local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
    local lastGroundPosition = Vector3.new()
    local lastUpdateTime = tick()

    -- Variables

    local walkspeed

    local title
    local hasPremium = false
    local userInputService = game:GetService("UserInputService")
    local LocalPlayer = game:GetService("Players").LocalPlayer
    local Backpack = LocalPlayer.Backpack
    local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()

    local DoWalkSpeed = false
    local JumpDefault

    if tonumber(tostring(humanoid.JumpPower):sub(1, 4)) ~= 0 or 28.3 then
        JumpDefault = tonumber(tostring(humanoid.JumpPower):sub(1, 4))
    end

    local DoGravity = false
    local FlySpeed = 50
    local walking = false
    local speedstring
    local gravitystring = tostring(game.Workspace.Gravity):sub(1, 4)
    local gravity = tonumber(gravitystring)
    local oldgravity = tonumber(game.Workspace.Gravity)

    local jumppower
    local newwstate = Enum.HumanoidStateType.Landed
    local MakeJump = true
    local thefov
    local DoTheFov
    local savedfov = game:GetService("Players").LocalPlayer.options.Graphics.fov.Value

    local walkspeedToggle
    local jumppowerToggle
    local gravityToggle
    local flyToggle
    local fovToggle
    local bhopToggle
    local infjumpsToggle
    local godmodeToggle
    local noclipToggle
    local invisibilityToggle
    local playerespToggle
    local botespToggle
    local powerboxespToggle
    local fullbrightToggle
    local getbtoolsToggle
    local fpsboostToggle
    local autoleaveToggle
    local antivoidToggle
    local keepscoreToggle
    local autokillToggle

    local inair
    local bhopbool
    local InfiniteJumpEnabled
    local DoTheNoclip
    local godmodeLoop = false

    local RefreshBoxEsp = "Enable"
    local RefreshTracerEsp = "Enable"
    local RefreshChamsEsp = "Enable"
    local RefreshNameTagEsp = "Enable"
    local RefreshTCStatus = "Enable"
    local PlayerEspSettingsList = {}

    local RefreshBoxObjectEsp = "Enable"
    local RefreshTracerObjectEsp = "Enable"
    local RefreshNametagsObjectEsp = "Enable"
    local ObjectEspSettingsList = {}

    local PlayerBoxEsp = false
    local PlayerTracerEsp = false
    local PlayerChamsEsp = false
    local PlayerNametagEsp = false
    local TCStatus = true

    local ObjectBoxEsp = false
    local ObjectTracerEsp = false
    local ObjectNametagEsp = false

    local ESP
    local espLib
    local BotESPLib
    local PowerBoxESP

    local UserRoleText
    local DevplayerNames = {}
    local DevJobId = {}
    local PremiumplayerNames = {}
    local PremiumJobId = {}
    local PublicplayerNames = {}
    local PublicJobId = {}

    local oldFPSBoost = {
        tostring(game.Workspace.Terrain.WaterWaveSize),
        tostring(game.Workspace.Terrain.WaterWaveSpeed),
        tostring(game.Workspace.Terrain.WaterReflectance),
        tostring(game.Workspace.Terrain.WaterTransparency),
        game.Lighting.GlobalShadows,
        tostring(game.Lighting.FogEnd),
        tostring(settings().Rendering.QualityLevel)
    }
    local AntiVoidBool
    local keepscoreLoop = false
    local BuyAmount = 1
    local TPAuraRange
    local ExcludedPlayers = {"pIayer_slowpi"}

    local DoWalkSpeedKeybind
    local JumpPowerKeybindbool

    local Library = loadstring(game:HttpGet("https://slowpihax.xyz/UI-Library.lua"))()
    local Flags = Library.Flags

    if getgenv().xw0DLBPTqZkzEWOXx6qCScoNKSoBhGh == false and getgenv().UtlpHuOwhroliTt4DRSwzv4qdQYuK9M == false then
        title = "slowpihax | " .. getgenv().vVersion .. " | Nico's Nextbots | Public"
    elseif getgenv().xw0DLBPTqZkzEWOXx6qCScoNKSoBhGh == true and getgenv().UtlpHuOwhroliTt4DRSwzv4qdQYuK9M == false then
        title = "slowpihax | " .. getgenv().vVersion .. " | Nico's Nextbots | Premium"
    elseif getgenv().UtlpHuOwhroliTt4DRSwzv4qdQYuK9M == true and getgenv().xw0DLBPTqZkzEWOXx6qCScoNKSoBhGh == true then
        title = "slowpihax | " .. getgenv().vVersion .. " | Nico's Nextbots | Dev"
    end

    if getgenv().M6bBwLtxy43AzjR2jRZUe2bHslRrs0y == nil or getgenv().M6bBwLtxy43AzjR2jRZUe2bHslRrs0y == false then
        setclipboard("https://discord.com/invite/JN6wgVrUAr")
        player:Kick("Bypassing The Key System is Against My Terms Of Service.")
    end

    if getgenv().xw0DLBPTqZkzEWOXx6qCScoNKSoBhGh or getgenv().UtlpHuOwhroliTt4DRSwzv4qdQYuK9M == true then
        hasPremium = true

        getgenv().M6bBwLtxy43AzjR2jRZUe2bHslRrs0y = nil
        getgenv().xw0DLBPTqZkzEWOXx6qCScoNKSoBhGh = nil
        getgenv().UtlpHuOwhroliTt4DRSwzv4qdQYuK9M = nil
    end

    -- Functions
    
    local function removeItem(itemName)
        local ItemInBackpack = Backpack:FindFirstChild(itemName)
        local ItemInCharacter = Character:FindFirstChild(itemName)
    
        if ItemInBackpack then
            ItemInBackpack:Destroy()
        end
    
        if ItemInCharacter then
            ItemInCharacter.Parent = nil
            ItemInCharacter:Destroy()
        end
    end

    local Window =
        Library:Window(
        {
            Text = title
        }
    )

    local Tab =
        Window:Tab(
        {
            Text = "Character"
        }
    )

    local Tab2 =
        Window:Tab(
        {
            Text = "Visual"
        }
    )

    local Tab3 =
        Window:Tab(
        {
            Text = "Autofarm"
        }
    )

    local Tab4 =
        Window:Tab(
        {
            Text = "Miscellaneous"
        }
    )

    local Tab5 =
        Window:Tab(
        {
            Text = "Teleports"
        }
    )

    local Tab6 =
        Window:Tab(
        {
            Text = "Games"
        }
    )

    local Tab7 =
        Window:Tab(
        {
            Text = "Credits"
        }
    )

    local Section =
        Tab:Section(
        {
            Text = "Character"
        }
    )

    local Section2 =
        Tab2:Section(
        {
            Text = "Visual"
        }
    )

    local Section3 =
        Tab3:Section(
        {
            Text = "Autofarm"
        }
    )

    local Section4 =
        Tab4:Section(
        {
            Text = "Player Misc"
        }
    )

    local Section4_1 =
        Tab4:Section(
        {
            Text = "Bot Misc",
            Side = "Right"
        }
    )

    local Section5 =
        Tab5:Section(
        {
            Text = "nn_Mall Teleports"
        }
    )

    local Section5_1 =
        Tab5:Section(
        {
            Text = "nn_Backrooms Teleports"
        }
    )

    local Section5_2 =
        Tab5:Section(
        {
            Text = "nn_Russia Teleports"
        }
    )

    local Section5_3 =
        Tab5:Section(
        {
            Text = "Other Teleports"
        }
    )

    local Section6 =
        Tab6:Section(
        {
            Text = "Games"
        }
    )

    local Section7 =
        Tab7:Section(
        {
            Text = "Credits"
        }
    )

    game:GetService("UserInputService").InputBegan:Connect(
        function(inputObject, gameProcessedEvent)
            if
                inputObject.KeyCode == Enum.KeyCode.W or inputObject.KeyCode == Enum.KeyCode.A or
                    inputObject.KeyCode == Enum.KeyCode.S or
                    inputObject.KeyCode == Enum.KeyCode.D
             then
                walking = true
            end
        end
    )

    game:GetService("UserInputService").InputEnded:Connect(
        function(inputObject, gameProcessedEvent)
            if
                not (game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.W) or
                    game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.A) or
                    game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.S) or
                    game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.D))
             then
                walking = false
            end
        end
    )

    local startfov = 100

    if
        game:GetService("Players"):WaitForChild(tostringLocalPlayerName):WaitForChild("options"):WaitForChild(
            "Graphics"
        ):WaitForChild("fov").Value
     then
        startfov =
            game:GetService("Players"):WaitForChild(tostringLocalPlayerName):WaitForChild("options"):WaitForChild(
            "Graphics"
        ):WaitForChild("fov").Value
    end

    local speedslider

    speedslider = Section:Slider(
        {
            Text = "Walkspeed",
            Default = walkspeed or 10,
            Minimum = 1,
            Maximum = 250,
            Flag = "Walkspeed",
            Button = true,
            ButtonDefault = false,
            ButtonFlag = "Walk",
            Keybind = true,
            KeybindDefault = Enum.KeyCode.Clear,
            ButtonCallback = function(bool)
                spawn(
                    function()
                        Notification(bool, "Walkspeed")
                    end
                )
                spawn(
                    function()
                        while Flags.Walk do
                            task.wait()
                            if walking == true then
                                local currentVelocity = player.Character:WaitForChild("HumanoidRootPart").Velocity
                                local newVelocity =
                                    Vector3.new(
                                    player.Character:FindFirstChildOfClass("Humanoid").MoveDirection.X * Flags.Walkspeed,
                                    currentVelocity.Y,
                                    player.Character:FindFirstChildOfClass("Humanoid").MoveDirection.Z * Flags.Walkspeed
                                )
                                player.Character:WaitForChild("HumanoidRootPart").Velocity = newVelocity
                            else
                                player.Character:WaitForChild("HumanoidRootPart").Velocity =
                                    Vector3.new(0, player.Character:WaitForChild("HumanoidRootPart").Velocity.Y, 0)
                            end
                        end
                    end
                )
            end
        }
    )

    if JumpDefault == 0 then
        JumpDefault = 28.3
    end

    Section:Slider(
        {
            Text = "JumpPower",
            Default = JumpDefault or 28.3,
            Minimum = 1,
            Maximum = 500,
            Flag = "JumpPower",
            Button = true,
            ButtonDefault = false,
            ButtonFlag = "Jump",
            Keybind = true,
            KeybindDefault = Enum.KeyCode.Clear,
            ButtonCallback = function(bool)
                spawn(
                    function()
                        Notification(bool, "JumpPower")
                    end
                )
            end
        }
    )

    local function statechangedforjump()
        game.workspace:WaitForChild(tostringLocalPlayerName):FindFirstChildOfClass("Humanoid").StateChanged:Connect(
            function(oldState, newState)
                newwstate = newState

                if newState == Enum.HumanoidStateType.Freefall then
                    MakeJump = false
                else
                    MakeJump = true
                end
            end
        )
    end

    runpcall(statechangedforjump)

    game:GetService("UserInputService").InputBegan:Connect(
        function(inputObject)
            if inputObject.KeyCode == Enum.KeyCode.Space then
                if Flags.Jump or JumpPowerKeybindbool and MakeJump == true then
                    task.wait(0.02)
                    game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").Velocity =
                        Vector3.new(
                        game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").Velocity.X,
                        Flags.JumpPower,
                        game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").Velocity.Z
                    )
                end
            end
        end
    )

    Section:Slider(
        {
            Text = "Gravity",
            Default = gravity,
            Minimum = 0,
            Maximum = 540,
            Flag = "GravityAmount",
            Button = true,
            ButtonDefault = false,
            ButtonFlag = "Gravity",
            Keybind = true,
            KeybindDefault = Enum.KeyCode.Clear,
            ButtonCallback = function(bool)
                spawn(
                    function()
                        Notification(bool, "Gravity")
                    end
                )
                while Flags.Gravity do
                    game.Workspace.Gravity = Flags.GravityAmount
                    task.wait()
                end

                game.Workspace.Gravity = oldgravity
            end
        }
    )

    Section:Slider(
        {
            Text = "Fly",
            Default = FlySpeed,
            Minimum = 1,
            Maximum = 400,
            Flag = "FlySpeed",
            Button = true,
            ButtonDefault = false,
            ButtonFlag = "Fly",
            Keybind = true,
            KeybindDefault = Enum.KeyCode.Clear,
            ButtonCallback = function(bool)
                _G.FLYING = false
                spawn(
                    function()
                        Notification(bool, "Fly")
                    end
                )
                if bool == true then
                    _G.FLYING = true
                    local LP = game:service("Players").LocalPlayer
                    local T = LP.character.Head
                    -- local T = LP.character.collisionPart
                    local CONTROL = {F = 0, B = 0, L = 0, R = 0}
                    local lCONTROL = {F = 0, B = 0, L = 0, R = 0}
                    local SPEED = Flags.FlySpeed
                    local MOUSE = LP:GetMouse()

                    local function FLY()
                        _G.FLYING = true
                        local BG = Instance.new("BodyGyro", T)
                        local BV = Instance.new("BodyVelocity", T)
                        BG.P = 9e4
                        BG.maxTorque = Vector3.new(9e9, 9e9, 9e9)
                        BG.cframe = T.CFrame
                        BV.velocity = Vector3.new(0, 0.1, 0)
                        BV.maxForce = Vector3.new(9e9, 9e9, 9e9)

                        spawn(
                            function()
                                repeat
                                    wait()
                                    LP.Character:FindFirstChildOfClass("Humanoid").PlatformStand = true
                                    if CONTROL.L + CONTROL.R ~= 0 or CONTROL.F + CONTROL.B ~= 0 then
                                        SPEED = Flags.FlySpeed
                                    elseif not (CONTROL.L + CONTROL.R ~= 0 or CONTROL.F + CONTROL.B ~= 0) and SPEED ~= 0 then
                                        SPEED = 0
                                    end
                                    if (CONTROL.L + CONTROL.R) ~= 0 or (CONTROL.F + CONTROL.B) ~= 0 then
                                        BV.velocity =
                                            ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector *
                                            (CONTROL.F + CONTROL.B)) +
                                            ((game.Workspace.CurrentCamera.CoordinateFrame *
                                                CFrame.new(CONTROL.L + CONTROL.R, (CONTROL.F + CONTROL.B) * 0.2, 0).p) -
                                                game.Workspace.CurrentCamera.CoordinateFrame.p)) *
                                            SPEED
                                        lCONTROL = {F = CONTROL.F, B = CONTROL.B, L = CONTROL.L, R = CONTROL.R}
                                    elseif (CONTROL.L + CONTROL.R) == 0 and (CONTROL.F + CONTROL.B) == 0 and SPEED ~= 0 then
                                        BV.velocity =
                                            ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector *
                                            (lCONTROL.F + lCONTROL.B)) +
                                            ((game.Workspace.CurrentCamera.CoordinateFrame *
                                                CFrame.new(lCONTROL.L + lCONTROL.R, (lCONTROL.F + lCONTROL.B) * 0.2, 0).p) -
                                                game.Workspace.CurrentCamera.CoordinateFrame.p)) *
                                            SPEED
                                    else
                                        BV.velocity = Vector3.new(0, 0.1, 0)
                                    end
                                    BG.cframe = game.Workspace.CurrentCamera.CoordinateFrame
                                until not _G.FLYING
                                CONTROL = {F = 0, B = 0, L = 0, R = 0}
                                lCONTROL = {F = 0, B = 0, L = 0, R = 0}
                                SPEED = 0
                                BG:destroy()
                                BV:destroy()
                                LP.Character:FindFirstChildOfClass("Humanoid").PlatformStand = false
                            end
                        )
                    end

                    MOUSE.KeyDown:connect(
                        function(KEY)
                            if KEY:lower() == "w" then
                                CONTROL.F = 1
                            elseif KEY:lower() == "s" then
                                CONTROL.B = -1
                            elseif KEY:lower() == "a" then
                                CONTROL.L = -1
                            elseif KEY:lower() == "d" then
                                CONTROL.R = 1
                            end
                        end
                    )

                    MOUSE.KeyUp:connect(
                        function(KEY)
                            if KEY:lower() == "w" then
                                CONTROL.F = 0
                            elseif KEY:lower() == "s" then
                                CONTROL.B = 0
                            elseif KEY:lower() == "a" then
                                CONTROL.L = 0
                            elseif KEY:lower() == "d" then
                                CONTROL.R = 0
                            end
                        end
                    )

                    FLY()
                else
                    _G.FLYING = false
                end
            end
        }
    )

    Section:Slider(
        {
            Text = "FOV",
            Default = startfov,
            Minimum = 10,
            Maximum = 120,
            Button = true,
            Flag = "FOVAmount",
            Button = true,
            ButtonDefault = false,
            ButtonFlag = "FOV",
            ButtonCallback = function(bool)
                spawn(
                    function()
                        Notification(bool, "FOV")
                    end
                )

                while Flags.FOV do
                    game:GetService("Players").LocalPlayer.options.Graphics.fov.Value = Flags.FOVAmount
                    task.wait()
                end
                
                game:GetService("Players").LocalPlayer.options.Graphics.fov.Value = savedfov
            end
        }
    )

    game:GetService("UserInputService").InputBegan:Connect(
        function(inputObject, gameProcessedEvent)
            if
                inputObject.KeyCode == Enum.KeyCode.Space or inputObject.KeyCode == Enum.KeyCode.Space or
                    inputObject.KeyCode == Enum.KeyCode.Space or
                    inputObject.KeyCode == Enum.KeyCode.Space
             then
                inair = true
            end
        end
    )

    game:GetService("UserInputService").InputEnded:Connect(
        function(inputObject, gameProcessedEvent)
            if not (game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.Space)) then
                inair = false
            end
        end
    )

    bhopToggle =
        Section:Toggle(
        {
            Text = "Bhop",
            Keybind = true,
            KeybindDefault = Enum.KeyCode.Clear,
            Callback = function(bool)
                bhopbool = bool
                spawn(
                    function()
                        Notification(bool, "Bhop")
                    end
                )

                while bhopbool == true do
                    game:GetService("RunService").RenderStepped:Wait()
                    if bhopbool == true then
                        if inair == true then
                            if
                                game.workspace:WaitForChild(tostringLocalPlayerName) and
                                    game.workspace:WaitForChild(tostringLocalPlayerName):FindFirstChildOfClass("Humanoid")
                             then
                                    game.workspace:WaitForChild(tostringLocalPlayerName).Humanoid.Jump = true
                                if Flags.Jump == true then
                                    game.workspace:WaitForChild(tostringLocalPlayerName).Humanoid.JumpPower = Flags.JumpPower
                                else
                                    game.workspace:WaitForChild(tostringLocalPlayerName).Humanoid.JumpPower = 28.3
                                end
                            end
                        end
                    end
                end
            end
        }
    )

    infjumpsToggle =
        Section:Toggle(
        {
            Text = "Inf Jumps",
            Keybind = true,
            KeybindDefault = Enum.KeyCode.Clear,
            Callback = function(bool)
                spawn(
                    function()
                        Notification(bool, "Inf Jumps")
                    end
                )
                if bool == true then
                    InfiniteJumpEnabled = true
                else
                    InfiniteJumpEnabled = false
                end

                game:GetService("UserInputService").InputBegan:Connect(
                    function(inputObject)
                        if inputObject.KeyCode == Enum.KeyCode.Space then
                            if InfiniteJumpEnabled == true then
                                task.wait(0.01)
                                player.Character:WaitForChild("HumanoidRootPart").Velocity =
                                    Vector3.new(
                                    player.Character:WaitForChild("HumanoidRootPart").Velocity.X,
                                    Flags.JumpPower,
                                    player.Character:WaitForChild("HumanoidRootPart").Velocity.Z
                                )
                            end
                        end
                    end
                )
            end
        }
    )

    if hasPremium == true then
        godmodeToggle =
            Section:Toggle(
            {
                Text = "Godmode",
                Flag = "Godmode",
                Keybind = true,
                KeybindDefault = Enum.KeyCode.Clear,
                Callback = function(bool)
                if Flags.KeepScore == true then
                    if Flags.Godmode ~= false then
                        spawn(
                            function()
                                Notification(
                                    "Warn",
                                    "You cant have Godmode and Keep Score enabled at the same time!"
                                )
                            end
                        )
                    end

                    task.wait(0.25)
                    godmodeToggle:Set(false)
                    return
                end

                    spawn(
                        function()
                            Notification(bool, "Godmode")
                        end
                    )
                    godmodeLoop = bool
                    local humanoid = player.Character:WaitForChild("HumanoidRootPart")
                    local stats = game.Players.LocalPlayer.Character.scripts.stats
                    local statsClone = stats:Clone()
                    statsClone.Parent = game.Players.LocalPlayer.Character.scripts
                    stats:Destroy()

                    spawn(
                        function()
                            local savedPosition =
                                Vector3.new(humanoid.Position.X, humanoid.Position.Y, humanoid.Position.Z)
                            game:GetService("ReplicatedStorage").events.player.char.respawnchar:FireServer()
                            task.wait(1.75)
                            player.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(savedPosition)
                        end
                    )

                    local function god()
                        if
                            not game.workspace:WaitForChild(tostringLocalPlayerName):WaitForChild("scripts"):WaitForChild(
                                "stats"
                            )
                        then
                            return
                        end
                        if not statsClone or not statsClone:IsDescendantOf(game) then
                            local stats = game.Players.LocalPlayer.Character.scripts.stats
                            statsClone = stats:Clone()
                            statsClone.Parent = game.Players.LocalPlayer.Character.scripts
                            stats:Destroy()
                            warn("Succesfully ran Godmode!")
                        end
                    end

                    while godmodeLoop do
                        task.wait()
                        god()
                    end
                end
            }
        )
    end

    noclipToggle =
        Section:Toggle(
        {
            Text = "Noclip",
            Flag = "Noclip",
            Keybind = true,
            KeybindDefault = Enum.KeyCode.Clear,
            Callback = function(bool)
                spawn(
                    function()
                        Notification(bool, "Noclip")
                    end
                )

                local humanoid = player.Character:WaitForChild("HumanoidRootPart")
                local savedPosition = Vector3.new(humanoid.Position.X, humanoid.Position.Y, humanoid.Position.Z)

                local function disablenoclip()
                    game:GetService("ReplicatedStorage").events.player.char.respawnchar:FireServer()
                    task.wait(1.8)
                    player.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(savedPosition)
                    player.Character.collisionPart.CanCollide = true
                    player.Character.collisionPart.Anchored = false
                    player.Character.HumanoidRootPart.collisionWeld.Enabled = true
                end

                while Flags.Noclip do
                    local humanoid = player.Character:WaitForChild("HumanoidRootPart")
                    savedPosition =
                        Vector3.new(humanoid.Position.X, humanoid.Position.Y, humanoid.Position.Z)
                    player.Character.collisionPart.CanCollide = false
                    player.Character.collisionPart.Anchored = true
                    player.Character.HumanoidRootPart.collisionWeld.Enabled = false
                    task.wait()
                end

                runpcall(disablenoclip)
            end
        }
    )

    local invisibilityToggle =
        Section:Toggle(
        {
            Text = "Invisibility",
            Flag = "Invisibility",
            Keybind = true,
            KeybindDefault = Enum.KeyCode.Clear,
            Callback = function(bool)
                spawn(
                    function()
                        Notification(bool, "Invisibility")
                    end
                )

                local humanoid = player.Character:WaitForChild("HumanoidRootPart")
                local savedPosition = Vector3.new(humanoid.Position.X, humanoid.Position.Y, humanoid.Position.Z)

                if Flags.Invisibility == false then
                    workspace:FindFirstChild("invischair"):Remove()
                end

                if Flags.Invisibility == true then
                    local savedpos = player.Character.HumanoidRootPart.CFrame
                    wait()
                    player.Character.HumanoidRootPart.CFrame = CFrame.new(0, 2000, 0)
                    wait(.15)
                    local Seat = Instance.new("Seat", game.Workspace)
                    Seat.Anchored = false
                    Seat.CanCollide = false
                    Seat.Name = "invischair"
                    Seat.Transparency = 1
                    Seat.Position = Vector3.new(0, 2000, 0)
                    local Weld = Instance.new("Weld", Seat)
                    Weld.Part0 = Seat
                    Weld.Part1 = player.Character:FindFirstChild("Torso") or player.Character.UpperTorso
                    wait()
                    Seat.CFrame = savedpos
                end

                while Flags.Invisibility do
                    local humanoid = player.Character:WaitForChild("HumanoidRootPart")
                    local savedPosition =
                        Vector3.new(humanoid.Position.X, humanoid.Position.Y, humanoid.Position.Z)
                    task.wait()
                end

                game:GetService("ReplicatedStorage").events.player.char.respawnchar:FireServer()
                task.wait(1.75)
                player.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(savedPosition)
            end
        }
    )

    if PlayerBoxEsp == true then
        RefreshBoxEsp = "Disable"
    else
        RefreshBoxEsp = "Enable"
    end

    if PlayerTracerEsp == true then
        RefreshTracerEsp = "Disable"
    else
        RefreshTracerEsp = "Enable"
    end

    if PlayerChamsEsp == true then
        RefreshChamsEsp = "Disable"
    else
        RefreshChamsEsp = "Enable"
    end

    if PlayerNametagEsp == true then
        RefreshNameTagEsp = "Disable"
    else
        RefreshNameTagEsp = "Enable"
    end

    if TCStatus == true then
        RefreshTCStatus = "Disable"
    else
        RefreshTCStatus = "Enable"
    end

    RefreshBoxEsp = "" .. RefreshBoxEsp .. " Box ESP"
    RefreshTracerEsp = "" .. RefreshTracerEsp .. " Tracer ESP"
    RefreshChamsEsp = "" .. RefreshChamsEsp .. " Chams ESP"
    RefreshNameTagEsp = "" .. RefreshNameTagEsp .. " Nametags ESP"
    RefreshTCStatus = "" .. RefreshTCStatus .. " Team Colors"

    PlayerEspSettingsList = {
        RefreshBoxEsp,
        RefreshTracerEsp,
        RefreshChamsEsp,
        RefreshNameTagEsp,
        RefreshTCStatus
    }

    RefreshBoxObjectEsp = "" .. RefreshBoxObjectEsp .. " Box ESP"
    RefreshTracerObjectEsp = "" .. RefreshTracerObjectEsp .. " Tracer ESP"
    RefreshNametagsObjectEsp = "" .. RefreshNametagsObjectEsp .. " Nametags Colors"

    ObjectEspSettingsList = {
        RefreshBoxObjectEsp,
        RefreshTracerObjectEsp,
        RefreshNametagsObjectEsp
    }

    getgenv().dropPlayerEspSettings =
        Section2:Dropdown(
        {
            Text = "Player ESP Settings",
            List = PlayerEspSettingsList,
            Callback = function(bool)
                if bool == PlayerEspSettingsList[1] then
                    PlayerBoxEsp = not PlayerBoxEsp
                    spawn(
                        function()
                            Notification(PlayerBoxEsp, "Player Box ESP")
                        end
                    )
                    if PlayerBoxEsp == true then
                        RefreshBoxEsp = "Disable Box ESP"
                    else
                        RefreshBoxEsp = "Enable Box ESP"
                    end
                end

                if bool == PlayerEspSettingsList[2] then
                    PlayerTracerEsp = not PlayerTracerEsp

                    spawn(
                        function()
                            Notification(PlayerTracerEsp, "Player Tracer ESP")
                        end
                    )
                    if PlayerTracerEsp == true then
                        RefreshTracerEsp = "Disable Tracer ESP"
                    else
                        RefreshTracerEsp = "Enable Tracer ESP"
                    end
                end

                if bool == PlayerEspSettingsList[3] then
                    PlayerChamsEsp = not PlayerChamsEsp
                    spawn(
                        function()
                            Notification(PlayerChamsEsp, "Player Chams ESP")
                        end
                    )
                    if PlayerChamsEsp == true then
                        RefreshChamsEsp = "Disable Chams ESP"
                    else
                        RefreshChamsEsp = "Enable Chams ESP"
                    end
                end

                if bool == PlayerEspSettingsList[4] then
                    PlayerNametagEsp = not PlayerNametagEsp
                    spawn(
                        function()
                            Notification(PlayerNametagEsp, "Player Nametags ESP")
                        end
                    )
                    if PlayerNametagEsp == true then
                        RefreshNameTagEsp = "Disable Nametags ESP"
                    else
                        RefreshNameTagEsp = "Enable Nametags ESP"
                    end
                end

                if bool == PlayerEspSettingsList[5] then
                    TCStatus = not TCStatus
                    spawn(
                        function()
                            Notification(TCStatus, "Player Team Colors")
                        end
                    )
                    if TCStatus == true then
                        RefreshTCStatus = "Disable Team Colors"
                    else
                        RefreshTCStatus = "Enable Team Colors"
                    end
                end

                PlayerEspSettingsList = {
                    RefreshBoxEsp,
                    RefreshTracerEsp,
                    RefreshChamsEsp,
                    RefreshNameTagEsp,
                    RefreshTCStatus
                }

                getgenv().dropPlayerEspSettings:Refresh({List = PlayerEspSettingsList})
            end
        }
    )

    getgenv().dropObjectEspSettings =
    Section2:Dropdown(
    {
        Text = "Object ESP Settings",
        List = ObjectEspSettingsList,
        Callback = function(bool)
            if bool == ObjectEspSettingsList[1] then
                ObjectBoxEsp = not ObjectBoxEsp
                spawn(
                    function()
                        Notification(ObjectBoxEsp, "Object Box ESP")
                    end
                )
                if ObjectBoxEsp == true then
                    RefreshBoxObjectEsp = "Disable Box ESP"
                else
                    RefreshBoxObjectEsp = "Enable Box ESP"
                end
            end

            if bool == ObjectEspSettingsList[2] then
                ObjectTracerEsp = not ObjectTracerEsp

                spawn(
                    function()
                        Notification(ObjectTracerEsp, "Object Tracer ESP")
                    end
                )
                if ObjectTracerEsp == true then
                    RefreshTracerObjectEsp = "Disable Tracer ESP"
                else
                    RefreshTracerObjectEsp = "Enable Tracer ESP"
                end
            end

            if bool == ObjectEspSettingsList[3] then
                ObjectNametagEsp = not ObjectNametagEsp
                spawn(
                    function()
                        Notification(ObjectNametagEsp, "Object Nametags ESP")
                    end
                )
                if ObjectNametagEsp == true then
                    RefreshNametagsObjectEsp = "Disable Nametags ESP"
                else
                    RefreshNametagsObjectEsp = "Enable Nametags ESP"
                end
            end

            ObjectEspSettingsList = {
                RefreshBoxObjectEsp,
                RefreshTracerObjectEsp,
                RefreshNametagsObjectEsp
            }

            getgenv().dropObjectEspSettings:Refresh({List = ObjectEspSettingsList})
        end
    }
)

    playerespToggle =
        Section2:Toggle(
        {
            Text = "Player ESP",
            Flag = "PlayerESP",
            Keybind = true,
            KeybindDefault = Enum.KeyCode.Clear,
            Callback = function(bool)
                spawn(
                    function()
                        Notification(bool, "Player ESP")
                    end
                )
                if Flags.PlayerESP == true then
                    local Players = game:GetService("Players")
                    ESP = loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-ESP-Library-9570", true))()
                    
                    if game.PlaceId == 10118559731 then
                        function ESP:GetTeamColor()
                            return Color3.new(0.631373, 0.768628, 0.54902)
                        end
                    end
                    
                    ESP.Settings.Boxes.Enabled = PlayerBoxEsp
                    ESP.Settings.Names.Enabled = PlayerNametagEsp
                    ESP.Settings.Tracers.Enabled = PlayerTracerEsp
                    
                    ESP.Settings.TeamBased = false
                    ESP.Settings.TeamColors = TCStatus
                    ESP.Settings.DestroyOnRemove = true
                    ESP.SettingsMaxDistance = 1000
                    
                    ESP.Settings.Names.Health = false
                    ESP.Settings.Names.Size = 19
                    ESP.Settings.Names.ResizeWeight = 0.01
                    
                    ESP.Settings.Boxes.Thickness = 2
                    ESP.Settings.BoxTopOffset = Vector3.new(0,2.75,0)
                    ESP.Settings.MaxBoxSize = Vector3.new(10,10,0)
                    
                    ESP.Settings.Tracers.Thickness = 1.5
                    
                    local function esp(Player)
                        if not Player.Character:FindFirstChild("scripts") then return end
                        
                        if Player.Character:WaitForChild("scripts"):WaitForChild("values"):WaitForChild("botpossessed").Value == "" then
                            ESP.Object:New(ESP:GetCharacter(Player))
                            ESP:CharacterAdded(Player):Connect(function(Character)
                                ESP.Object:New(Character)
                            end)
                        end
                    end
                    
                    for i, Player in next, Players:GetPlayers() do
                        pcall(esp, Player)
                    end
                    
                    Players.PlayerAdded:Connect(function(Player)
                        pcall(esp, Player)
                    end)

                    if PlayerNametagEsp == true then
                        spawn(
                            function()
                                while Flags.PlayerESP do
                                    for i, v in pairs(Players:GetPlayers()) do
                                        v.NameDisplayDistance = 7.5
                                        v.HealthDisplayDistance = 7.5
                                    end

                                    task.wait()
                                end

                                for i, v in pairs(Players:GetPlayers()) do
                                    v.NameDisplayDistance = 100
                                    v.HealthDisplayDistance = 100
                                end
                            end
                        )
                    end

                    if PlayerChamsEsp == true then
                        espLib =
                            loadstring(
                            game:HttpGet(
                                ("https://raw.githubusercontent.com/shlexware/Sirius/request/library/esp/esp.lua"),
                                true
                            )
                        )()

                        espLib.options.enabled = true
                        espLib.options.minScaleFactorX = 1
                        espLib.options.maxScaleFactorX = 10
                        espLib.options.minScaleFactorY = 1
                        espLib.options.maxScaleFactorY = 10
                        espLib.options.boundingBox = false
                        espLib.options.boundingBoxDescending = true
                        espLib.options.font = 2
                        espLib.options.fontSize = 13
                        espLib.options.limitDistance = false
                        espLib.options.maxDistance = 99999
                        espLib.options.visibleOnly = false
                        espLib.options.teamCheck = false
                        espLib.options.teamColor = TCStatus
                        espLib.options.fillColor = nil
                        espLib.options.whitelistColor = Color3.new(1, 0, 0)
                        espLib.options.outOfViewArrows = false
                        espLib.options.outOfViewArrowsFilled = false
                        espLib.options.outOfViewArrowsSize = 25
                        espLib.options.outOfViewArrowsRadius = 100
                        espLib.options.outOfViewArrowsColor = Color3.new(1, 1, 1)
                        espLib.options.outOfViewArrowsTransparency = 0.5
                        espLib.options.outOfViewArrowsOutline = false
                        espLib.options.outOfViewArrowsOutlineFilled = false
                        espLib.options.outOfViewArrowsOutlineColor = Color3.new(1, 1, 1)
                        espLib.options.outOfViewArrowsOutlineTransparency = 1
                        espLib.options.names = false
                        espLib.options.nameTransparency = 1
                        espLib.options.nameColor = Color3.new(1, 1, 1)
                        espLib.options.boxes = false
                        espLib.options.boxesTransparency = 1
                        espLib.options.boxesColor = Color3.new(1, 0, 0)
                        espLib.options.boxFill = false
                        espLib.options.boxFillTransparency = 0.5
                        espLib.options.boxFillColor = Color3.new(1, 0, 0)
                        espLib.options.healthBars = false
                        espLib.options.healthBarsSize = 1
                        espLib.options.healthBarsTransparency = 1
                        espLib.options.healthBarsColor = Color3.new(0, 1, 0)
                        espLib.options.healthText = false
                        espLib.options.healthTextTransparency = 1
                        espLib.options.healthTextSuffix = "%"
                        espLib.options.healthTextColor = Color3.new(1, 1, 1)
                        espLib.options.distance = false
                        espLib.options.distanceTransparency = 1
                        espLib.options.distanceSuffix = " Studs"
                        espLib.options.distanceColor = Color3.new(1, 1, 1)
                        espLib.options.tracers = false
                        espLib.options.tracerTransparency = 1
                        espLib.options.tracerColor = Color3.new(1, 1, 1)
                        espLib.options.tracerOrigin = "Bottom"
                        espLib.options.chams = true
                        espLib.options.chamsFillColor = Color3.new(0, 255, 0)
                        espLib.options.chamsFillTransparency = 0.45
                        espLib.options.chamsOutlineColor = Color3.new()
                        espLib.options.chamsOutlineTransparency = 0.05

                        espLib:Load()
                    end
                else
                    ESP.Enabled = false
                    espLib:Unload()
                end
            end
        }
    )

    botespToggle =
        Section2:Toggle(
        {
            Text = "Bot Esp",
            Flag = "BotESP",
            Keybind = true,
            KeybindDefault = Enum.KeyCode.Clear,
            Callback = function(bool)
                spawn(
                    function()
                        Notification(bool, "Bot ESP")
                    end
                )


                if Flags.BotESP == true then
                    local Players = game:GetService("Players")
                    BotESPLib = loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-ESP-Library-9570", true))()
                    
                    BotESPLib.Settings.Boxes.Enabled = ObjectBoxEsp
                    BotESPLib.Settings.Names.Enabled = ObjectNametagEsp
                    BotESPLib.Settings.Tracers.Enabled = ObjectTracerEsp
                    
                    BotESPLib.Settings.TeamBased = false
                    BotESPLib.Settings.TeamColors = false
                    BotESPLib.Settings.DestroyOnRemove = true
                    BotESPLib.SettingsMaxDistance = 1000
                    
                    BotESPLib.Settings.Names.Health = false
                    BotESPLib.Settings.Names.Color = Color3.new(1,0,0)
                    BotESPLib.Settings.Names.Size = 20
                    BotESPLib.Settings.Names.ResizeWeight = 0.01
                    
                    BotESPLib.Settings.Boxes.Thickness = 2
                    BotESPLib.Settings.Boxes.Color = Color3.new(1,0,0)
                    BotESPLib.Settings.BoxTopOffset = Vector3.new(0,2.75,0)
                    BotESPLib.Settings.MaxBoxSize = Vector3.new(100,100,0)
                    
                    BotESPLib.Settings.Tracers.Thickness = 1.5
                    BotESPLib.Settings.Tracers.Color = Color3.new(1,0,0)
                    
                    local function esp(Player)
                        if not Player.Character:FindFirstChild("scripts") then return end
                        
                        if Player.Character:WaitForChild("scripts"):WaitForChild("values"):WaitForChild("botpossessed").Value ~= "" then
                            BotESPLib.Object:New(BotESPLib:GetCharacter(Player))
                            BotESPLib:CharacterAdded(Player):Connect(function(Character)
                                BotESPLib.Object:New(Character)
                            end)
                        end
                    end

                    local function botesp(bot)
                        if not bot:FindFirstChildOfClass("Humanoid") then return end

                        BotESPLib.Object:New(bot)
                    end
                    
                    for i, Player in next, Players:GetPlayers() do
                        pcall(esp, Player)
                    end
                    
                    Players.PlayerAdded:Connect(function(Player)
                        pcall(esp, Player)
                    end)

                    for i, bot in pairs(workspace.bots:GetDescendants()) do
                        if bot:IsA("Model") then
                            botesp(bot)
                        end
                    end

                    workspace.bots.DescendantAdded:Connect(function(bot)
                        task.wait(3)
                        if bot:IsA("Model") then
                            botesp(bot)
                        end
                    end)
                else
                    BotESPLib.Enabled = false
                end
            end
        }
    )

    powerboxespToggle =
        Section2:Toggle(
        {
            Text = "Power Box ESP",
            Keybind = true,
            KeybindDefault = Enum.KeyCode.Clear,
            Callback = function(bool)
                spawn(
                    function()
                        Notification(bool, "Power Box ESP")
                    end
                )
                if bool == true then
                    PowerBoxESP = loadstring(game:HttpGet("https://kiriot22.com/releases/ESP.lua"))()

                    PowerBoxESP.Tracers = ObjectTracerEsp
                    PowerBoxESP.Names = PlayerNametagEsp
                    PowerBoxESP.Boxes = ObjectBoxEsp
                    PowerBoxESP.Players = false
                    PowerBoxESP.FaceCamera = true

                    spawn(
                        function()
                            while bool == true do
                                for i, v in pairs(
                                    game:GetService("Workspace")["nn_mall"][".powerboxes"]:GetDescendants()
                                ) do
                                    if v.Name == "PowerInteract" and v.Parent.Name == "PowerBox" then
                                        if not v.Parent:FindFirstChild("slowpihax-PowerBoxEsp") then
                                            local a = Instance.new("Part")
                                            a.Parent = v.Parent
                                            a.Name = "slowpihax-PowerBoxEsp"
                                            a.Anchored = true
                                            a.Transparency = 1
                                            a.CanCollide = false
                                            a.CFrame = CFrame.new(v.Parent.Position + Vector3.new(0, 1.5, 0))
                                        elseif
                                            v.Parent:FindFirstChild("slowpihax-PowerBoxEsp") and
                                                not v.Parent:FindFirstChild("PowerInteract")
                                         then
                                            v.Parent:FindFirstChild("slowpihax-PowerBoxEsp"):Destroy()
                                        end
                                    elseif v.Name == "PowerBox" then
                                        if
                                            not v:FindFirstChild("PowerInteract") and
                                                v:FindFirstChild("slowpihax-PowerBoxEsp")
                                         then
                                            v:FindFirstChild("slowpihax-PowerBoxEsp"):Destroy()
                                        end
                                    end
                                end

                                for i, v in pairs(
                                    game:GetService("Workspace")["nn_russia"][".powerboxes"]:GetDescendants()
                                ) do
                                    if v.Name == "PowerInteract" and v.Parent.Name == "PowerBox" then
                                        if not v.Parent:FindFirstChild("slowpihax-PowerBoxEsp") then
                                            local a = Instance.new("Part")
                                            a.Parent = v.Parent
                                            a.Name = "slowpihax-PowerBoxEsp"
                                            a.Anchored = true
                                            a.Transparency = 1
                                            a.CanCollide = false
                                            a.CFrame = CFrame.new(v.Parent.Position + Vector3.new(0, 1.5, 0))
                                        elseif
                                            v.Parent:FindFirstChild("slowpihax-PowerBoxEsp") and
                                                not v.Parent:FindFirstChild("PowerInteract")
                                         then
                                            v.Parent:FindFirstChild("slowpihax-PowerBoxEsp"):Destroy()
                                        end
                                    elseif v.Name == "PowerBox" then
                                        if
                                            not v:FindFirstChild("PowerInteract") and
                                                v:FindFirstChild("slowpihax-PowerBoxEsp")
                                         then
                                            v:FindFirstChild("slowpihax-PowerBoxEsp"):Destroy()
                                        end
                                    end
                                end
                                task.wait(0.05)
                            end
                        end
                    )

                    PowerBoxESP:AddObjectListener(
                        game:GetService("Workspace")["nn_mall"][".powerboxes"],
                        {
                            Recursive = true,
                            Name = "slowpihax-PowerBoxEsp",
                            CustomName = "Power Box",
                            Color = Color3.fromRGB(0, 255, 0),
                            IsEnabled = "PowerESP"
                        }
                    )

                    game:GetService("Workspace")["nn_mall"][".powerboxes"].DescendantAdded:Connect(
                        function(Descendant)
                            if Descendant:IsA("Part") then
                                PowerBoxESP:AddObjectListener(
                                    game:GetService("Workspace")["nn_mall"][".powerboxes"],
                                    {
                                        Recursive = true,
                                        Name = "slowpihax-PowerBoxEsp",
                                        CustomName = "Power Box",
                                        Color = Color3.fromRGB(0, 255, 0),
                                        IsEnabled = "PowerESP"
                                    }
                                )
                            end
                        end
                    )

                    PowerBoxESP:AddObjectListener(
                        game:GetService("Workspace")["nn_russia"][".powerboxes"],
                        {
                            Recursive = true,
                            Name = "slowpihax-PowerBoxEsp",
                            CustomName = "Power Box",
                            Color = Color3.fromRGB(0, 255, 0),
                            IsEnabled = "PowerESP"
                        }
                    )

                    game:GetService("Workspace")["nn_russia"][".powerboxes"].DescendantAdded:Connect(
                        function(Descendant)
                            if Descendant:IsA("Part") then
                                PowerBoxESP:AddObjectListener(
                                    game:GetService("Workspace")["nn_russia"][".powerboxes"],
                                    {
                                        Recursive = true,
                                        Name = "slowpihax-PowerBoxEsp",
                                        CustomName = "Power Box",
                                        Color = Color3.fromRGB(0, 255, 0),
                                        IsEnabled = "PowerESP"
                                    }
                                )
                            end
                        end
                    )

                    PowerBoxESP.PowerESP = true
                    PowerBoxESP:Toggle(true)
                else
                    PowerBoxESP.PowerESP = false
                    PowerBoxESP:Toggle(false)
                end
            end
        }
    )

    fullbrightToggle =
        Section2:Toggle(
        {
            Text = "Fullbright",
            Keybind = true,
            KeybindDefault = Enum.KeyCode.Clear,
            Callback = function(bool)
                spawn(
                    function()
                        Notification(bool, "Fullbright")
                    end
                )
                if not _G.FullBrightExecuted then
                    _G.FullBrightEnabled = false

                    _G.NormalLightingSettings = {
                        Brightness = game:GetService("Lighting").Brightness,
                        ClockTime = game:GetService("Lighting").ClockTime,
                        FogEnd = game:GetService("Lighting").FogEnd,
                        GlobalShadows = game:GetService("Lighting").GlobalShadows,
                        Ambient = game:GetService("Lighting").Ambient
                    }

                    game:GetService("Lighting"):GetPropertyChangedSignal("Brightness"):Connect(
                        function()
                            if
                                game:GetService("Lighting").Brightness ~= 1 and
                                    game:GetService("Lighting").Brightness ~= _G.NormalLightingSettings.Brightness
                             then
                                _G.NormalLightingSettings.Brightness = game:GetService("Lighting").Brightness
                                if not _G.FullBrightEnabled then
                                    repeat
                                        wait()
                                    until _G.FullBrightEnabled
                                end
                                game:GetService("Lighting").Brightness = 1
                            end
                        end
                    )

                    game:GetService("Lighting"):GetPropertyChangedSignal("ClockTime"):Connect(
                        function()
                            if
                                game:GetService("Lighting").ClockTime ~= 12 and
                                    game:GetService("Lighting").ClockTime ~= _G.NormalLightingSettings.ClockTime
                             then
                                _G.NormalLightingSettings.ClockTime = game:GetService("Lighting").ClockTime
                                if not _G.FullBrightEnabled then
                                    repeat
                                        wait()
                                    until _G.FullBrightEnabled
                                end
                                game:GetService("Lighting").ClockTime = 12
                            end
                        end
                    )

                    game:GetService("Lighting"):GetPropertyChangedSignal("FogEnd"):Connect(
                        function()
                            if
                                game:GetService("Lighting").FogEnd ~= 786543 and
                                    game:GetService("Lighting").FogEnd ~= _G.NormalLightingSettings.FogEnd
                             then
                                _G.NormalLightingSettings.FogEnd = game:GetService("Lighting").FogEnd
                                if not _G.FullBrightEnabled then
                                    repeat
                                        wait()
                                    until _G.FullBrightEnabled
                                end
                                game:GetService("Lighting").FogEnd = 786543
                            end
                        end
                    )

                    game:GetService("Lighting"):GetPropertyChangedSignal("GlobalShadows"):Connect(
                        function()
                            if
                                game:GetService("Lighting").GlobalShadows ~= false and
                                    game:GetService("Lighting").GlobalShadows ~= _G.NormalLightingSettings.GlobalShadows
                             then
                                _G.NormalLightingSettings.GlobalShadows = game:GetService("Lighting").GlobalShadows
                                if not _G.FullBrightEnabled then
                                    repeat
                                        wait()
                                    until _G.FullBrightEnabled
                                end
                                game:GetService("Lighting").GlobalShadows = false
                            end
                        end
                    )

                    game:GetService("Lighting"):GetPropertyChangedSignal("Ambient"):Connect(
                        function()
                            if
                                game:GetService("Lighting").Ambient ~= Color3.fromRGB(178, 178, 178) and
                                    game:GetService("Lighting").Ambient ~= _G.NormalLightingSettings.Ambient
                             then
                                _G.NormalLightingSettings.Ambient = game:GetService("Lighting").Ambient
                                if not _G.FullBrightEnabled then
                                    repeat
                                        wait()
                                    until _G.FullBrightEnabled
                                end
                                game:GetService("Lighting").Ambient = Color3.fromRGB(178, 178, 178)
                            end
                        end
                    )

                    game:GetService("Lighting").Brightness = 1
                    game:GetService("Lighting").ClockTime = 12
                    game:GetService("Lighting").FogEnd = 786543
                    game:GetService("Lighting").GlobalShadows = false
                    game:GetService("Lighting").Ambient = Color3.fromRGB(178, 178, 178)

                    local LatestValue = true
                    spawn(
                        function()
                            repeat
                                wait()
                            until _G.FullBrightEnabled
                            while wait() do
                                if _G.FullBrightEnabled ~= LatestValue then
                                    if not _G.FullBrightEnabled then
                                        game:GetService("Lighting").Brightness = _G.NormalLightingSettings.Brightness
                                        game:GetService("Lighting").ClockTime = _G.NormalLightingSettings.ClockTime
                                        game:GetService("Lighting").FogEnd = _G.NormalLightingSettings.FogEnd
                                        game:GetService("Lighting").GlobalShadows =
                                            _G.NormalLightingSettings.GlobalShadows
                                        game:GetService("Lighting").Ambient = _G.NormalLightingSettings.Ambient
                                    else
                                        game:GetService("Lighting").Brightness = 1
                                        game:GetService("Lighting").ClockTime = 12
                                        game:GetService("Lighting").FogEnd = 786543
                                        game:GetService("Lighting").GlobalShadows = false
                                        game:GetService("Lighting").Ambient = Color3.fromRGB(178, 178, 178)
                                    end
                                    LatestValue = not LatestValue
                                end
                            end
                        end
                    )
                end

                _G.FullBrightExecuted = true
                _G.FullBrightEnabled = not _G.FullBrightEnabled
            end
        }
    )

    Section3:Toggle(
        {
            Text = "Autofarm",
            Flag = "Autofarm",
            Keybind = true,
            KeybindDefault = Enum.KeyCode.Clear,
            Callback = function(bool)
                spawn(
                    function()
                        Notification(bool, "Autofarm")
                    end
                )
                if not game:FindFirstChild("slowpihax-autofarm") then
                    local part = Instance.new("Part")
                    part.Anchored = true
                    part.BottomSurface = Enum.SurfaceType.Smooth
                    part.TopSurface = Enum.SurfaceType.Smooth
                    part.Color = Color3.fromRGB(255, 0, 0)
                    part.Material = Enum.Material.Plastic
                    part.Size = Vector3.new(3000, 25, 3000)
                    part.Parent = workspace

                    part.CFrame = CFrame.new(90000, 10000, 90000)
                    part.Name = "slowpihax-autofarm"

                    local vu = game:GetService("VirtualUser")
                    game:GetService("Players").LocalPlayer.Idled:connect(
                        function()
                            vu:Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
                            wait(1)
                            vu:Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
                        end
                    )

                    player.Character.HumanoidRootPart.CFrame = CFrame.new(90000, 10100, 90000)
                end
                
                local newpos

                local character = player.Character
                local humanoid = character:WaitForChild("Humanoid")
                local startCFrame = character.HumanoidRootPart.CFrame
                local endCFrame = CFrame.new(Vector3.new(90000, 10100, 90000))
                local duration = 1
                local startTime = tick()

                while tick() - startTime < duration do
                    local t = (tick() - startTime) / duration
                    character.HumanoidRootPart.CFrame = startCFrame:lerp(endCFrame, t)
                    task.wait()
                end
                humanoid.Jump = true

                local function autofarm(pos)
                    position = pos
                    local startCFrame = character.HumanoidRootPart.CFrame
                    local endCFrame = CFrame.new(position)
                    local duration = 2
                    local startTime = tick()

                    while tick() - startTime < duration do
                        local t = (tick() - startTime) / duration
                        character.HumanoidRootPart.CFrame = startCFrame:lerp(endCFrame, t)
                        task.wait()
                    end

                    humanoid.Jump = true
                end

                while Flags.Autofarm do
                    task.wait()

                    newpos = Vector3.new(90884, 11246, 89093)

                    autofarm(newpos)

                    if Flags.Autofarm == false then
                        break
                    end

                    newpos = Vector3.new(88983, 10015, 90007)

                    autofarm(newpos)

                    if Flags.Autofarm == false then
                        break
                    end

                    newpos = Vector3.new(91013, 10015, 91014)

                    autofarm(newpos)
                end

                game:GetService("ReplicatedStorage").events.player.char.respawnchar:FireServer()
            end
        }
    )

    Section3:Toggle(
        {
            Text = "Auto Punch",
            Flag = "AutoPunch",
            Keybind = true,
            KeybindDefault = Enum.KeyCode.Clear,
            Callback = function(bool)
                spawn(
                    function()
                        Notification(bool, "Auto Punch")
                    end
                )
                spawn(
                    function()
                        while Flags.AutoPunch do
                            task.wait()
                            game:GetService("ReplicatedStorage"):WaitForChild("events"):WaitForChild("player"):WaitForChild(
                                "local"
                            ):WaitForChild("punch"):FireServer()
                        end
                    end
                )
                spawn(
                    function()
                        while Flags.AutoPunch do
                            task.wait(20)
                            local punches =
                                tostring(
                                game:GetService("Players").LocalPlayer:WaitForChild("stats"):WaitForChild("punches").Value
                            )
                            print("Your Current Total Punches are: " .. punches)
                        end
                    end
                )
            end
        }
    )   

    getbtoolsToggle =
        Section4:Toggle(
        {
            Text = "Get Btools",
            Keybind = true,
            KeybindDefault = Enum.KeyCode.Clear,
            Callback = function(bool)
                spawn(
                    function()
                        Notification(bool, "Get Btools")
                    end
                )
                if bool == true then
                    loadstring(game:HttpGet("https://pastebin.com/raw/PSeXEvEc"))()
                else
                    removeItem("Move")
                    removeItem("Delete")
                    removeItem("Undo")
                end
            end
        }
    )

    fpsboostToggle =
        Section4:Toggle(
        {
            Text = "FPS Boost",
            Keybind = true,
            KeybindDefault = Enum.KeyCode.Clear,
            Callback = function(bool)
                spawn(
                    function()
                        Notification(bool, "FPS Boost")
                    end
                )
                if bool == true then
                    local oldFPSBoost = {
                        tostring(game.Workspace.Terrain.WaterWaveSize),
                        tostring(game.Workspace.Terrain.WaterWaveSpeed),
                        tostring(game.Workspace.Terrain.WaterReflectance),
                        tostring(game.Workspace.Terrain.WaterTransparency),
                        game.Lighting.GlobalShadows,
                        tostring(game.Lighting.FogEnd),
                        tostring(settings().Rendering.QualityLevel)
                    }

                    local a = game
                    local b = a.Workspace
                    local c = a.Lighting
                    local d = b.Terrain
                    d.WaterWaveSize = 0
                    d.WaterWaveSpeed = 0
                    d.WaterReflectance = 0
                    d.WaterTransparency = 0
                    c.GlobalShadows = false
                    c.FogEnd = 9e9
                    settings().Rendering.QualityLevel = "Level01"
                elseif bool == false then
                    local a = game
                    local b = a.Workspace
                    local c = a.Lighting
                    local d = b.Terrain
                    d.WaterWaveSize = oldFPSBoost[1]
                    d.WaterWaveSpeed = oldFPSBoost[2]
                    d.WaterReflectance = oldFPSBoost[3]
                    d.WaterTransparency = oldFPSBoost[4]
                    c.GlobalShadows = oldFPSBoost[5]
                    c.FogEnd = oldFPSBoost[6]
                    settings().Rendering.QualityLevel = oldFPSBoost[7]
                end
            end
        }
    )

    autoleaveToggle =
        Section4:Toggle(
        {
            Text = "Auto Leave",
            Keybind = true,
            KeybindDefault = Enum.KeyCode.Clear,
            Callback = function(bool)
                local groupId = 9511731
                local players = game:GetService("Players")

                local blacklistedRoles = {
                    "nico",
                    "devs",
                    "crew",
                    "testers"
                }

                for _, v in pairs(players:GetPlayers()) do
                    local playerRole = v:GetRoleInGroup(groupId)
                    task.wait(2.05)
                    if table.find(blacklistedRoles, playerRole) then
                        if bool == true then
                            player:Kick(string.format("The [%s] %s has joined the game.", playerRole, v.Name))
                        end
                    end
                end

                players.PlayerAdded:Connect(
                    function(v)
                        task.wait(2.05)
                        local playerRole = v:GetRoleInGroup(groupId)
                        if table.find(blacklistedRoles, playerRole) then
                            if bool == true then
                                player:Kick(string.format("The [%s] %s has joined the game.", playerRole, v.Name))
                            end
                        end
                    end
                )
            end
        }
    )

    antivoidToggle =
        Section4:Toggle(
        {
            Text = "Anti Void",
            Keybind = true,
            KeybindDefault = Enum.KeyCode.Clear,
            Callback = function(bool)
                AntiVoidBool = bool
                spawn(
                    function()
                        Notification(bool, "Anti Void")
                        game:GetService("Workspace").nn_mall[".zones"]:WaitForChild("teleport"):Destroy()
                        game:GetService("Workspace")["nn_russia"]:WaitForChild("bounds"):Destroy()
                    end
                )

                local AntiVoidLoop =
                    coroutine.create(
                    function()
                        while AntiVoidBool == true do
                            task.wait()
                            if AntiVoidBool == true then
                                task.wait()
                                if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                                    local humanoidRootPart = player.Character.HumanoidRootPart
                                    local currentTime = tick()
                                    if humanoidRootPart.Position.Y < -420 then
                                        humanoidRootPart.Velocity = Vector3.new(0, 0, 0)
                                        humanoidRootPart.CFrame = CFrame.new(lastGroundPosition)
                                        warn("Anti Void: Teleported back to ".. tostring(lastGroundPosition))
                                        humanoidRootPart.Velocity = Vector3.new(0, 0, 0)
                                    elseif
                                        currentTime - lastUpdateTime >= 1 and
                                            newwstate ~= Enum.HumanoidStateType.Freefall
                                     then
                                        lastGroundPosition = humanoidRootPart.Position
                                        lastUpdateTime = currentTime
                                    end
                                end
                            end
                        end
                    end
                )
                if AntiVoidBool == true then
                    coroutine.resume(AntiVoidLoop)
                else
                    coroutine.yield(AntiVoidLoop)
                end
            end
        }
    )

    if hasPremium == true then
        keepscoreToggle =
            Section4:Toggle(
            {
                Text = "Keep Score",
                Flag = "KeepScore",
                Keybind = true,
                KeybindDefault = Enum.KeyCode.Clear,
                Callback = function(bool)
                    if Flags.Godmode == false then
                        spawn(
                            function()
                                Notification(bool, "Keep Score")
                            end
                        )
                        keepscoreLoop = bool
                        local humanoid = player.Character:WaitForChild("HumanoidRootPart")
                        local savedPosition = Vector3.new(humanoid.Position.X, humanoid.Position.Y, humanoid.Position.Z)

                        game.workspace:WaitForChild(tostringLocalPlayerName):WaitForChild("HumanoidRootPart").Anchored =
                            true
                        repeat
                            task.wait()
                            game.workspace:WaitForChild(tostringLocalPlayerName):WaitForChild("HumanoidRootPart").CFrame =
                                CFrame.new(5000, 5000, 5000)
                        until game.workspace:WaitForChild(tostringLocalPlayerName):WaitForChild("scripts"):WaitForChild(
                            "values"
                        ):WaitForChild("forcefield").Value == false

                        game.workspace:WaitForChild(tostringLocalPlayerName):WaitForChild("HumanoidRootPart").Anchored =
                            false
                        player.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(savedPosition)
                        local stats =
                            game.workspace:WaitForChild(tostringLocalPlayerName):WaitForChild("scripts"):WaitForChild(
                            "stats"
                        )
                        local statsClone = stats:Clone()
                        statsClone.Parent = game.workspace:WaitForChild(tostringLocalPlayerName):WaitForChild("scripts")
                        stats:Destroy()

                        while keepscoreLoop do
                            task.wait()
                            if not game.workspace:WaitForChild(tostringLocalPlayerName):FindFirstChild("scripts") then
                                statsClone = nil
                            end
                            if statsClone == nil then
                                task.wait(1)
                                if
                                    game.workspace:WaitForChild(tostringLocalPlayerName):FindFirstChild("scripts"):FindFirstChild(
                                        "stats"
                                    )
                                 then
                                    local humanoid = player.Character:WaitForChild("HumanoidRootPart")
                                    local savedPosition =
                                        Vector3.new(humanoid.Position.X, humanoid.Position.Y, humanoid.Position.Z)

                                    game.workspace:WaitForChild(tostringLocalPlayerName):WaitForChild(
                                            "HumanoidRootPart"
                                        ).Anchored = true
                                    repeat
                                        task.wait()
                                        game.workspace:WaitForChild(tostringLocalPlayerName):WaitForChild(
                                                "HumanoidRootPart"
                                            ).CFrame = CFrame.new(5000, 5000, 5000)
                                    until game.workspace:WaitForChild(tostringLocalPlayerName):WaitForChild("scripts"):WaitForChild(
                                        "values"
                                    ):WaitForChild("forcefield").Value == false

                                    game.workspace:WaitForChild(tostringLocalPlayerName):WaitForChild(
                                            "HumanoidRootPart"
                                        ).Anchored = false
                                    player.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(savedPosition)
                                    local stats =
                                        game.workspace:WaitForChild(tostringLocalPlayerName):WaitForChild("scripts"):WaitForChild(
                                        "stats"
                                    )
                                    statsClone = stats:Clone()
                                    statsClone.Parent =
                                        game.workspace:WaitForChild(tostringLocalPlayerName):WaitForChild("scripts")
                                    stats:Destroy()
                                end
                            end
                        end
                        if bool == false then
                            local savedPosition =
                                Vector3.new(humanoid.Position.X, humanoid.Position.Y, humanoid.Position.Z)
                            game:GetService("ReplicatedStorage").events.player.char.respawnchar:FireServer()
                            task.wait(1.75)
                            player.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(savedPosition)
                        end
                    elseif Flags.Godmode == true then
                        if Flags.KeepScore ~= false then
                            spawn(
                                function()
                                    Notification(
                                        "Warn",
                                        "You cant have Godmode and Keep Score enabled at the same time!"
                                    )
                                end
                            )
                        end
                        task.wait(0.1)
                        keepscoreToggle:Set(false)
                    end
                end
            }
        )
    end

    local drop =
        Section4:Dropdown(
        {
            Text = "Buy Gear",
            List = {"Snowball", "Firework", "Bloxy Cola", "Possessor"},
            Callback = function(v)
                local ChosenGear = "Snowball"
                if v == "Snowball" then
                    ChosenGear = "Snowball"
                elseif v == "Firework" then
                    ChosenGear = "Firework"
                elseif v == "Bloxy Cola" then
                    ChosenGear = "BloxyCola"
                elseif v == "Possessor" then
                    ChosenGear = "Possessor"
                end

                task.wait(0.05)

                local args = {
                    [1] = ChosenGear,
                    [2] = "Gear",
                    [3] = BuyAmount
                }

                game:GetService("ReplicatedStorage"):WaitForChild("events"):WaitForChild("game"):WaitForChild("global"):WaitForChild(
                    "shoppurchasebux"
                ):InvokeServer(unpack(args))
            end
        }
    )

    Section4:Slider(
        {
            Text = "Buy Amount",
            Default = 1,
            Minimum = 1,
            Maximum = 1000,
            Callback = function(Value)
                BuyAmount = Value
            end
        }
    )

    local povBotsTable = {}

    local bots = game:GetService("Workspace").bots:GetDescendants()
    for _, bot in ipairs(bots) do
        if bot:IsA("Model") then
            table.insert(povBotsTable, bot.Name)
        end
    end

    table.sort(povBotsTable, function(a, b)
        return a:lower() < b:lower()
    end)
    
    povBotsToggle =
        Section4_1:Toggle(
        {
            Text = "Pov Bot",
            Flag = "povbot",
            Keybind = true,
            KeybindDefault = Enum.KeyCode.Clear,
            Callback = function(bool)
                spawn(
                    function()
                        Notification(bool, "Pov Bot")
                    end
                )
                if bool == false then
                    game:GetService("Workspace").Camera.CameraSubject = game.Players.LocalPlayer.Character.Humanoid
                end
            end
        }
    )

    getgenv().PovBotsDropdown =
        Section4_1:Dropdown(
        {
            Text = "Pov Bots",
            List = povBotsTable,
            Callback = function(v)
                spawn(
                    function()
                        Notification("Info", "Now Watching " .. v .. "")

                        task.wait(0.25)

                        povBotsTable = {}
                        local bots = game:GetService("Workspace").bots:GetDescendants()
                        for _, bot in ipairs(bots) do
                            if bot:IsA("Model") then
                                table.insert(povBotsTable, bot.Name)
                            end
                        end
                
                        table.sort(povBotsTable, function(a, b)
                            return a:lower() < b:lower()
                        end)
                
                        getgenv().PovBotsDropdown:Refresh({list = povBotsTable})
                    end
                )
                if Flags.povbot == true then
                    local targetModelName = v

                    local targetModel = nil
                    for _, descendant in ipairs(game:GetService("Workspace").bots:GetDescendants()) do
                        if descendant:IsA("Model") and descendant.Name == targetModelName then
                            targetModel = descendant
                            break
                        end
                    end

                    if targetModel then
                        local targetHumanoid = targetModel:FindFirstChildOfClass("Humanoid")
                        if targetHumanoid then
                            game:GetService("Workspace").Camera.CameraSubject = targetHumanoid
                        end
                    end
                end
            end
        }
    )

spawn(function()
    task.wait(1)

    local botsFolder = game:GetService("Workspace").bots

    local function updatePovBotsTable()
        task.wait(3)
        local povBotsTable = {}
    
        local bots = botsFolder:GetDescendants()
        for _, bot in ipairs(bots) do
            if bot:IsA("Model") then
                table.insert(povBotsTable, bot.Name)
            end
        end
    
        table.sort(povBotsTable, function(a, b)
            return a:lower() < b:lower()
        end)
    
        getgenv().PovBotsDropdown:Refresh({list = povBotsTable})
    end
    
    botsFolder.ChildAdded:Connect(updatePovBotsTable)
    botsFolder.ChildRemoved:Connect(updatePovBotsTable)
end)    

    if hasPremium == true then
        Section4_1:Slider(
            {
                Text = "Auto Kill Range",
                Default = 1,
                Minimum = 0,
                Maximum = 5000,
                Flag = "AutoKill",
                Button = true,
                ButtonDefault = false,
                ButtonFlag = "AutoKilling",
                Keybind = true,
                KeybindDefault = Enum.KeyCode.Clear,
                ButtonCallback = function(bool)
                    spawn(
                        function()
                            Notification(bool, "Auto Kill")
                        end
                    )

                    local AutoKillingCo =
                        coroutine.create(
                        function()
                            local timer = 0
                            while Flags.AutoKilling do
                                task.wait()
                                timer = timer + 1 / 30
                                if timer >= 100 and _G.DoTeleports == true then
                                    player.Character:WaitForChild("HumanoidRootPart").CFrame =
                                        CFrame.new(-107.0163345336914, 85.84809875488281, -805.146484375)
                                    wait(0.25)
                                    game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame =
                                        CFrame.new(-1110.2471923828125, 89.2927017211914, -92.7923355102539)
                                    timer = 0
                                end
                                local radius = 2
                                local yOffset = math.random(-75, 130) / 100
                                local angle = math.random(0, 2 * math.pi)
                                local offset = Vector3.new(math.cos(angle) * radius, yOffset, math.sin(angle) * radius)
                                local Directionmulti =
                                    Vector3.new(
                                    math.random(80, 160) / 100,
                                    math.random(20, 175) / 100,
                                    math.random(80, 160) / 100
                                )
                                local players = game:GetService("Players"):GetPlayers()
                                local notFoundPlayers = {}

                                for _, player in pairs(players) do
                                    if player.Character then
                                        local humanoid = player.Character:FindFirstChild("HumanoidRootPart")
                                        if humanoid then
                                            if player.Character.scripts.values.safe.Value == false then
                                                if player.Character.scripts.values.botpossessed.Value == "" then
                                                    if player.Character.scripts.values.forcefield.Value == false then
                                                        table.insert(notFoundPlayers, player)
                                                    end
                                                end
                                            end
                                        end
                                    end
                                end

                                local players = notFoundPlayers
                                local closestPlayer = nil
                                local closestDistance = math.huge

                                closestPlayer = nil
                                closestDistance = math.huge
                                for _, player in pairs(players) do
                                    if
                                        player.Character and player.Character:FindFirstChild("HumanoidRootPart") and
                                            player ~= game.Players.LocalPlayer and
                                            player.Character:FindFirstChildOfClass("Humanoid").Health ~= 0
                                     then
                                        local distance =
                                            (player.Character.HumanoidRootPart.Position -
                                            game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude
                                        if distance < closestDistance then
                                            closestPlayer = player
                                            closestDistance = distance
                                        end
                                    end
                                end
                                if closestPlayer and Flags.AutoKilling then
                                    for i, v in pairs(ExcludedPlayers) do
                                        if tostring(closestPlayer) ~= tostring(v) then
                                            local distance =
                                                (closestPlayer.Character.HumanoidRootPart.Position -
                                                game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude
                                            if distance <= Flags.AutoKill then
                                                local x = closestPlayer.Character.Head.CFrame.lookVector.X
                                                local z = closestPlayer.Character.Head.CFrame.lookVector.Z
                                                local newVector = Vector3.new(x, 0, z)

                                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
                                                    CFrame.new(
                                                    closestPlayer.Character.HumanoidRootPart.Position + offset
                                                ) +
                                                    (newVector * math.random(125, 300) / 100) +
                                                    (closestPlayer.Character:FindFirstChildOfClass("Humanoid").MoveDirection *
                                                        math.random(92, 200) /
                                                        100) +
                                                    (closestPlayer.Character.HumanoidRootPart.Velocity / 4.25)
                                            end
                                        end
                                    end
                                end
                                notFoundPlayers = {}
                            end
                        end
                    )

                    if Flags.AutoKilling == true then
                        _G.DoTeleports = true
                        coroutine.resume(AutoKillingCo)
                    else
                        _G.DoTeleports = false
                        coroutine.yield(AutoKillingCo)
                        notFoundPlayers = {}
                        lastPos = currentPos
                    end
                end
            }
        )
    end

    if hasPremium == true then
        Section4_1:Input(
            {
                Text = "Auto Kill Exclude",
                Callback = function(txt)
                    local CheckIfPlayerExist = {txt}

                    for i, name in pairs(CheckIfPlayerExist) do
                        local players = game.Players:FindFirstChild(name)
                        if players then
                            getgenv().AutoKillExclusionList:Add(txt)
                            table.insert(ExcludedPlayers, txt)
                            spawn(
                                function()
                                    Notification("Info", "Added " .. txt .. " to the excluded players list.")
                                end
                            )
                        else
                            spawn(
                                function()
                                    Notification(
                                        "Info",
                                        "Couldnt find '" ..
                                            txt ..
                                                "'.                                 Make sure you typed it correctly, Dont type Their DisplayName."
                                    )
                                end
                            )
                        end
                    end
                end
            }
        )
    end

    if hasPremium == true then
        getgenv().AutoKillExclusionList =
            Section4_1:Dropdown(
            {
                Text = "Excluded Players",
                List = {},
                Callback = function(v)
                    spawn(
                        function()
                            Notification("Info", "Removed " .. v .. " from the excluded players list.")
                        end
                    )
                    task.wait(0.25)
                    getgenv().AutoKillExclusionList:Remove(v)
                end
            }
        )
    end

    Section5:Button(
        {
            Text = "Safezone 1",
            Callback = function()
                player.Character.HumanoidRootPart.CFrame =
                    CFrame.new(-1193.636474609375, 10.947853088378906, -41.517642974853516)
            end
        }
    )

    Section5:Button(
        {
            Text = "Safezone 2",
            Callback = function()
                player.Character.HumanoidRootPart.CFrame =
                    CFrame.new(-1147.0692138671875, 80.94786071777344, 133.0210723876953)
            end
        }
    )

    Section5:Button(
        {
            Text = "Safezone 3",
            Callback = function()
                player.Character.HumanoidRootPart.CFrame =
                    CFrame.new(-796.4456176757812, -3.551644802093506, -69.36172485351562)
            end
        }
    )

    Section5:Button(
        {
            Text = "Safezone 4",
            Callback = function()
                player.Character.HumanoidRootPart.CFrame =
                    CFrame.new(-860.5006713867188, 10.941093444824219, -258.46514892578125)
            end
        }
    )

    Section5:Button(
        {
            Text = "Safezone 5",
            Callback = function()
                player.Character.HumanoidRootPart.CFrame =
                    CFrame.new(-1291.4190673828125, 25.94784927368164, 49.5816535949707)
            end
        }
    )

    Section5_1:Button(
        {
            Text = "Safezone 1",
            Callback = function()
                player.Character.HumanoidRootPart.CFrame =
                    CFrame.new(-1577.9761962890625, -86.09324645996094, 466.0253601074219)
            end
        }
    )

    Section5_1:Button(
        {
            Text = "Safezone 2",
            Callback = function()
                player.Character.HumanoidRootPart.CFrame =
                    CFrame.new(-1324.193359375, -86.26140594482422, 88.25579833984375)
            end
        }
    )

    Section5_1:Button(
        {
            Text = "Safezone 3",
            Callback = function()
                player.Character.HumanoidRootPart.CFrame =
                    CFrame.new(-1879.9508056640625, -85.56594848632812, 51.14085006713867)
            end
        }
    )

    Section5_2:Button(
        {
            Text = "Safezone 1",
            Callback = function()
                player.Character.HumanoidRootPart.CFrame = CFrame.new(-452.449432, 20.9481182, -1111.93152)
            end
        }
    )

    Section5_2:Button(
        {
            Text = "Safezone 2",
            Callback = function()
                player.Character.HumanoidRootPart.CFrame =
                    CFrame.new(-57.934993743896484, 12.848140716552734, -1199.6781005859375)
            end
        }
    )

    Section5_2:Button(
        {
            Text = "Safezone 3",
            Callback = function()
                player.Character.HumanoidRootPart.CFrame =
                    CFrame.new(231.8864288330078, 11.84812068939209, -1026.161865234375)
            end
        }
    )

    Section5_2:Button(
        {
            Text = "Safezone 4",
            Callback = function()
                player.Character.HumanoidRootPart.CFrame =
                    CFrame.new(-138.176025390625, 13.29802417755127, -422.5591125488281)
            end
        }
    )

    Section5_2:Button(
        {
            Text = "Safezone 5",
            Callback = function()
                player.Character.HumanoidRootPart.CFrame =
                    CFrame.new(-17.797344207763672, 12.848140716552734, -604.1474609375)
            end
        }
    )

    Section5_2:Button(
        {
            Text = "Club",
            Callback = function()
                player.Character.HumanoidRootPart.CFrame =
                    CFrame.new(-103.3435287475586, 14.948122024536133, -556.2715454101562)
            end
        }
    )

    Section5_3:Button(
        {
            Text = "Character Platform",
            Callback = function()
                player.Character.HumanoidRootPart.CFrame =
                    CFrame.new(-613.7852172851562, -475.54156494140625, -24.1522216796875)
            end
        }
    )

    Section5_3:Button(
        {
            Text = ":)",
            Callback = function()
                spawn(
                    function()
                        for i = 10, 1 do
                            task.wait(0.01)
                            player.Character.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
                        end
                    end
                )
                player.Character.HumanoidRootPart.CFrame = CFrame.new(633.188, -555.938, 139.5)
            end
        }
    )

    Section5_3:Button(
        {
            Text = "Shop",
            Callback = function()
                player.Character.HumanoidRootPart.CFrame = CFrame.new(-616.536, -500.462, -28.3732)
            end
        }
    )

    Section5_3:Button(
        {
            Text = "Shop 2(?)",
            Callback = function()
                player.Character.HumanoidRootPart.CFrame = CFrame.new(-470.181671, 19.9990406, -1116.04822)
            end
        }
    )

    if game.PlaceId ~= 10118559731 then
        local drop =
            Section6:Dropdown(
            {
                Text = "Nico's Nextbots | Working",
                List = {"Teleport"},
                Callback = function(v)
                    local placeid = 10118559731

                    for i, v in pairs(game:FindFirstChildOfClass("Players"):GetPlayers()) do
                        if v ~= game.Players.LocalPlayer then
                            game:GetService("TeleportService"):Teleport(placeid, v)
                        end
                    end
                    task.wait(0.5)
                    spawn(
                        function()
                            Notification("Info", "Teleport Failed, Please Join The Game Manually.")
                        end
                    )
                end
            }
        )
    end

    local drop =
        Section6:Dropdown(
        {
            Text = "Doors | Patched",
            List = {"Teleport"},
            Callback = function(v)
                local placeid = 6516141723

                for i, v in pairs(game:FindFirstChildOfClass("Players"):GetPlayers()) do
                    if v ~= game.Players.LocalPlayer then
                        game:GetService("TeleportService"):Teleport(placeid, v)
                    end
                end
                task.wait(0.5)
                spawn(
                    function()
                        Notification("Info", "Teleport Failed, Please Join The Game Manually.")
                    end
                )
            end
        }
    )

    Section7:Button(
        {
            Text = "Scripted by slowpi#8954",
            Callback = function()
                spawn(
                    function()
                        Notification("Info", "Scripted By slowpi#8954")
                    end
                )
            end
        }
    )

    Section7:Button(
        {
            Text = "Discord Server Invite",
            Callback = function()
                spawn(
                    function()
                        Notification("Info", "Discord Invite Copied To Clipboard!")
                    end
                )
                setclipboard("https://discord.gg/slowpihax")
            end
        }
    )

    getgenv().xw0DLBPTqZkzEWOXx6qCScoNKSoBhGh = nil
    getgenv().UtlpHuOwhroliTt4DRSwzv4qdQYuK9M = nil
    getgenv().M6bBwLtxy43AzjR2jRZUe2bHslRrs0y = nil

    Notification("Info", "slowpihax version: "..getgenv().vVersion.." has loaded successfully!")
end
