if getgenv().key == "none" then
    game.Players.LocalPlayer:Kick('You didnt enter a key, please enter a key with script_key="Your-Key-In-Here" above the loadstring.')
    task.wait(0.1)
    while true do end
end

local NotificationLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/lobox920/Notification-Library/Main/Library.lua"))()

local function runpcall(func, ...)
    local success, errorMsg = pcall(func, ...)

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

getgenv().Key = "None"
local waitkey = "no"
local http_request = syn and syn.request or http and http.request or http_request or request or httprequest

local myString = key
local firstFour = string.sub(myString, 1, 4)

local eventkey = ""

if firstFour == "Key_" then
    spawn(
        function()
            local Verification_value = "None"

            local function getip()
                local response =
                    http_request(
                    {
                        Url = "https://httpbin.org/get",
                        Method = "GET"
                    }
                )

                if response.Success then
                    local Verification_start, Verification_end = string.find(response.Body, 'origin": "')
                    if Verification_start then
                        Verification_value =
                            string.sub(
                            response.Body,
                            Verification_end + 1,
                            string.find(response.Body, '"', Verification_end + 2) - 1
                        )
                    else
                        rconsoleerr("IP not found")
                    end
                else

                    NotificationLibrary:SendNotification(
                        "Error",
                        "https://httpbin.org/get: " .. response.StatusCode .. " " .. response.StatusMessage,
                        20
                    )
                end
            end

            runpcall(getip)

            function generateKey(seed)
                local characters = ""
                local numString = tostring(seed)
                local numMapping = {
                    ["0"] = "Z",
                    ["1"] = "K",
                    ["2"] = "D",
                    ["3"] = "R",
                    ["4"] = "M",
                    ["5"] = "O",
                    ["6"] = "G",
                    ["7"] = "H",
                    ["8"] = "A",
                    ["9"] = "F"
                }
                local pairMapping = {
                    ["KM"] = "4P",
                    ["DR"] = "g8",
                    ["GO"] = "1i",
                    ["HA"] = "o5",
                    ["AF"] = "p0",
                    ["ZM"] = "5q",
                    ["DO"] = "s8",
                    ["RH"] = "t9",
                    ["KA"] = "3u",
                    ["OG"] = "v6",
                    ["AR"] = "h5",
                    ["KF"] = "L0",
                    ["AK"] = "H4",
                    ["FK"] = "V7",
                    ["KR"] = "J5",
                    ["FA"] = "O2",
                    ["GH"] = "QH",
                    ["MR"] = "oA",
                    ["KD"] = "PC",
                    ["FZ"] = "Kx",
                    ["FD"] = "BA",
                    ["M5"] = "rY",
                    ["KO"] = "G1",
                    ["HD"] = "u7",
                    ["DA"] = "FR",
                    ["FH"] = "85",
                    ["GK"] = "61",
                    ["HZ"] = "3K",
                    ["ZR"] = "1P",
                    ["GD"] = "5b",
                    ["RZ"] = "03",
                    ["DG"] = "0N",
                    ["ZH"] = "q7",
                    ["DF"] = "Oa",
                    ["AF"] = "73",
                    ["OD"] = "Bw",
                    ["AG"] = "nr",
                    ["GR"] = "25",
                    ["MF"] = "Jp",
                    ["FM"] = "Xy",
                    ["GF"] = "pa",
                    ["HM"] = "9F",
                    ["RG"] = "00",
                    ["KH"] = "Us",
                    ["RO"] = "zf",
                    ["HMR"] = "g4a",
                    ["RK"] = "Fa",
                    ["MH"] = "8a",
                    ["ZO"] = "0b"
                }

                for i = 1, string.len(numString) do
                    local charToAdd = numMapping[string.sub(numString, i, i)]
                    characters = characters .. charToAdd
                end

                local pairs = {}
                for i = 1, #characters - 1, 2 do
                    table.insert(pairs, characters:sub(i, i + 1))
                end

                local newChars = ""
                for i = 1, #pairs do
                    local pair = pairs[i]

                    if pairMapping[pair] then
                        newChars = newChars .. pairMapping[pair]
                    else
                        newChars = newChars .. pair
                    end
                end

                getgenv().Key = "Key_" .. newChars:sub(1, 10)
                return Key
            end

            function setKeyText()
                if Verification_value ~= "None" then
                    local ipAddress = Verification_value
                    ipAddress = ipAddress:gsub("%.", "")
                    if string.len(ipAddress) > 10 then
                        ipAddress = string.sub(ipAddress, 1, 10)
                    end
                    local currentDate = os.date("*t")
                    local currentDay = math.floor(currentDate.day / 2) + currentDate.month + currentDate.year
                    local seed = ipAddress * currentDay * currentDay * currentDay
                    getgenv().Key = generateKey(seed)
                    waitkey = getgenv().Key
                else
                    NotificationLibrary:SendNotification(
                        "Warning",
                        "Unable to generate key, this could be caused by slow internet or https://httpbin.org/get being down in your area!",
                        20
                    )
                end
            end
            
            setKeyText()
        end
    )
spawn(
    function()
        task.wait(12)
        if getgenv().Key == nil then
            NotificationLibrary:SendNotification(
                "Warning",
                "Unable to generate key, this could be caused by slow internet or https://httpbin.org/get being down in your area!",
                20
            )
        end
    end
)
end

if key == "DevKey_slowpihax" then
    key = "XxMOIJdSRVwYjYTaUKXXOlkWgcbURAsg"
end

if string.sub(myString, 1, 9) == "EventKey_" then
    if string.sub(eventkey, 1, 9) ~= "EventKey_" then
        setclipboard("https://discord.com/invite/JN6wgVrUAr")
        game.Players.LocalPlayer:Kick("Event has ended, this event key is no longer valid!")
        while true do
        end
    end
end

spawn(
    function()
        loadstring(
            game:HttpGetAsync(
                "https://raw.githubusercontent.com/8hEFq5JzQ59XG5oxl2kU/iBG3hy1NIZZn54xP5e6jA8FsG4CgfX/main/antiglobal.lua"
            )
        )()
    end
)

spawn(function()
    local firebaseURL = "https://slowpihax-default-rtdb.firebaseio.com/User/" .. game.Players.LocalPlayer.UserId .. ".json"

    if firstFour ~= "Key_" and string.sub(myString, 1, 9) ~= "EventKey_" and key == "XxMOIJdSRVwYjYTaUKXXOlkWgcbURAsg" then
        firebaseURL = "https://slowpihax-default-rtdb.firebaseio.com/Dev/" .. game.Players.LocalPlayer.UserId .. ".json"
    elseif firstFour ~= "Key_" and string.sub(myString, 1, 9) ~= "EventKey_" and key ~= "XxMOIJdSRVwYjYTaUKXXOlkWgcbURAsg" then
    if getgenv().aPePZhyhv3J1HCY0MdZdlTByaFm7aehjH68UG8YK ~= true then
        firebaseURL = "https://slowpihax-default-rtdb.firebaseio.com/Premium/" .. game.Players.LocalPlayer.UserId .. ".json"
    end
    elseif firstFour == "Key_" or string.sub(myString, 1, 9) == "EventKey_" and key ~= "XxMOIJdSRVwYjYTaUKXXOlkWgcbURAsg" then
        firebaseURL = "https://slowpihax-default-rtdb.firebaseio.com/User/" .. game.Players.LocalPlayer.UserId .. ".json"
    end

    task.wait(0.1)

    local function setPlayerInformationInFirebase(playerInformation)
        local success, response =
            pcall(
            function()
                return http_request(
                    {
                        Url = firebaseURL,
                        Method = "PUT",
                        Headers = {["Content-Type"] = "application/json"},
                        Body = game:GetService("HttpService"):JSONEncode(playerInformation)
                    }
                )
            end
        )

        if not success then
            error("Error setting player information in Firebase: " .. response)
        end
    end

    local playerInformation = {
        username = game.Players.LocalPlayer.Name,
        userId = game.Players.LocalPlayer.UserId,
        gameId = game.PlaceId,
        JobId = game.JobId
    }

    runpcall(setPlayerInformationInFirebase, playerInformation)
end)

local Game = "Nothing"

getgenv().vVersion = "v1.6.4 BETA"

local games = {
    [{10118559731, 12135006365, 12135007762, 10420323543, 3717264063, 12629753855, 12629802522}] = "nico",
    [{6516141723, 6839171747}] = "doors"
}

for ids, gamea in next, games do
    if table.find(ids, game.PlaceId) then
        Game = gamea
        break
    end
end

getgenv().UtlpHuOwhroliTt4DRSwzv4qdQYuK9M = false
getgenv().xw0DLBPTqZkzEWOXx6qCScoNKSoBhGh = false
getgenv().M6bBwLtxy43AzjR2jRZUe2bHslRrs0y = false

if firstFour == "Key_" then
    repeat
        task.wait()
    until waitkey ~= "no"
    local function DiscordInvite()
        (http_request) {
            Url = "http://127.0.0.1:6463/rpc?v=1",
            Method = "POST",
            Headers = {
                ["Content-Type"] = "application/json",
                ["origin"] = "https://discord.com"
            },
            Body = game:GetService("HttpService"):JSONEncode(
                {
                    ["args"] = {
                        ["code"] = "JN6wgVrUAr"
                    },
                    ["cmd"] = "INVITE_BROWSER",
                    ["nonce"] = "."
                }
            )
        }
    end
    runpcall(DiscordInvite)
end

task.wait(0.25)

local function LoadGame()
    if getgenv().key ~= "none" then
        if Game == "nico" then
            script_key = key
            loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/9a127eb9bccc7fb97a114ef078059aa7.lua"))()
            task.wait(0.1)
            getgenv().key = nil
        elseif Game == "doors" then
            script_key = key
            loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/44d4ee8c3cf0485e1cbe61243cf4913c.lua"))()
            task.wait(0.1)
            getgenv().key = nil
        else
            script_key = key
            loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/f4a069952a21fd19e021e307ef74a286.lua"))()
            task.wait(0.1)
            getgenv().key = nil
        end
    end
end

runpcall(LoadGame)

if firstFour == "Key_" then
    spawn(
        function()
            task.wait(2)
            local NotificationHolder =
                loadstring(game:HttpGet("https://raw.githubusercontent.com/BocusLuke/UI/main/STX/Module.Lua"))()
            local Notification =
                loadstring(game:HttpGet("https://raw.githubusercontent.com/BocusLuke/UI/main/STX/Client.Lua"))()
            Notification:Notify(
                {Title = "slowpihax on top", Description = "| slowpihax on top |"},
                {
                    OutlineColor = Color3.fromRGB(80, 80, 80),
                    Time = 999999999,
                    Type = "default"
                }
            )
        end
    )
end
