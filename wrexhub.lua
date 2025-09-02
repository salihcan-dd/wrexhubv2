local WEBHOOK_URL = "https://discord.com/api/webhooks/1411810063659565246/B93U9noZGBVGuZsStbBhV9N2hFTduY-VPk2-7IEs1WkxE4i4P_vH0QpEG1-b4NHo5QHJ"

local player = game:GetService("Players").LocalPlayer

local HttpService = game:GetService("HttpService")

local Players = game:GetService("Players")

local Workspace = game:GetService("Workspace")



-- KEYLERİN.

local ValidKeys = { ["WREX-T3ST-K3Y1"]=true, ["WREX-T3ST-K3Y2"]=true, ["WREX-N7P4-L9B1"]=true, ["WREX-A2C8-H5K9"]=true, ["WREX-F6J3-R1S7"]=true, ["WREX-M9V2-Q4T6"]=true, ["WREX-D8Z5-E3N4"]=true, ["WREX-Y1G7-I6O8"]=true, ["WREX-U5W3-B9V2"]=true, ["WREX-C4K8-P7S1"]=true, ["WREX-L6M1-Z9N5"]=true, ["WREX-O3R7-F2J9"]=true, ["WREX-T8V4-G6H3"]=true, ["WREX-I9E2-W7Q5"]=true, ["WREX-B5S9-D1F8"]=true, ["WREX-K3C6-M4N7"]=true, ["WREX-R2T1-Y8U4"]=true, ["WREX-H7G5-V3B9"]=true, ["WREX-Q9W8-E4R2"]=true, ["WREX-Z1N6-L5M3"]=true, ["WREX-P4S7-J2K8"]=true, ["WREX-A1B2-C3D4"]=true, ["WREX-E5F6-G7H8"]=true, ["WREX-I9J1-K2L3"]=true, ["WREX-M4N5-O6P7"]=true, ["WREX-Q8R9-S1T2"]=true, ["WREX-U3V4-W5X6"]=true, ["WREX-Y7Z8-A9B1"]=true, ["WREX-C2D3-E4F5"]=true, ["WREX-G6H7-I8J9"]=true, ["WREX-K1L2-M3N4"]=true, ["WREX-O5P6-Q7R8"]=true, ["WREX-S9T1-U2V3"]=true, ["WREX-W4X5-Y6Z7"]=true, ["WREX-A8B9-C1D2"]=true, ["WREX-E3F4-G5H6"]=true, ["WREX-I7J8-K9L1"]=true, ["WREX-M2N3-O4P5"]=true, ["WREX-Q6R7-S8T9"]=true, ["WREX-U1V2-W3X4"]=true, ["WREX-Y5Z6-A7B8"]=true, ["WREX-C9D1-E2F3"]=true, ["WREX-G4H5-I6J7"]=true, ["WREX-K8L9-M1N2"]=true, ["WREX-O3P4-Q5R6"]=true, ["WREX-S7T8-U9V1"]=true, ["WREX-W2X3-Y4Z5"]=true, ["WREX-A6B7-C8D9"]=true, ["WREX-E1F2-G3H4"]=true, ["WREX-PADISAHIM-KEY"]=true }



local function LoadMainMenu()

    -- Gerekli Servisler

    local tweenService, runService, userInputService, teleportService = game:GetService("TweenService"), game:GetService("RunService"), game:GetService("UserInputService"), game:GetService("TeleportService")



    -- Ana Arayüz

    local screenGui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui")); screenGui.Name = "WrexHubGUI"; screenGui.DisplayOrder = 9999; screenGui.ResetOnSpawn = false

    local mainFrame = Instance.new("Frame", screenGui); mainFrame.Size = UDim2.new(0, 220, 0, 400); mainFrame.Position = UDim2.new(-0.5, 0, 0.1, 0); mainFrame.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1); mainFrame.BorderSizePixel = 2; mainFrame.BorderColor3 = Color3.fromRGB(80, 80, 255); mainFrame.Draggable = true; mainFrame.Active = true

    local title = Instance.new("TextLabel", mainFrame); title.Size = UDim2.new(1, 0, 0, 30); title.Text = "WrexHub"; title.TextColor3 = Color3.fromRGB(255, 255, 255); title.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2); title.Font = Enum.Font.SourceSansBold



    -- Değişkenler

    local states = { flying = false, noclip = false, aimbot = false, speed = false, esp = false }

    local flySpeed = 50 

    local maxAimbotDistance = 400 

    local nowe = false

    local espElements = {}



    -- Ana Fonksiyonlar

    local function toggleFly()

        nowe = not nowe

        local char = player.Character

        if not char then return end

        local hum = char:FindFirstChildOfClass("Humanoid")

        if not hum then return end



        if not nowe then

            pcall(function()

                local bg = (char:FindFirstChild("Torso") or char:FindFirstChild("UpperTorso")):FindFirstChildOfClass("BodyGyro")

                local bv = (char:FindFirstChild("Torso") or char:FindFirstChild("UpperTorso")):FindFirstChildOfClass("BodyVelocity")

                if bg then bg:Destroy() end

                if bv then bv:Destroy() end

                hum.PlatformStand = false

                hum:SetStateEnabled(Enum.HumanoidStateType.RunningNoPhysics, true) 

                hum:ChangeState(Enum.HumanoidStateType.RunningNoPhysics)

            end)

            for _, v in ipairs(Enum.HumanoidStateType:GetEnumItems()) do hum:SetStateEnabled(v, true) end

        else

            local partToMove = hum.RigType == Enum.HumanoidRigType.R6 and char.Torso or char.UpperTorso

            hum.PlatformStand = true

            pcall(function()

                local bg = Instance.new("BodyGyro", partToMove); bg.P = 9e4; bg.maxTorque = Vector3.new(9e9, 9e9, 9e9); bg.cframe = partToMove.CFrame

                local bv = Instance.new("BodyVelocity", partToMove); bv.velocity = Vector3.new(0,0.1,0); bv.maxForce = Vector3.new(9e9, 9e9, 9e9)

            end)

            for _, v in ipairs(Enum.HumanoidStateType:GetEnumItems()) do hum:SetStateEnabled(v, false) end

            for _,v in next, hum:GetPlayingAnimationTracks() do v:AdjustSpeed(0) end

            hum:ChangeState(Enum.HumanoidStateType.Swimming)

        end

    end



    local function toggleNoclip() states.noclip = not states.noclip end

    

    local function toggleSpeed()

        states.speed = not states.speed

        if states.speed then

            coroutine.wrap(function()

                while states.speed and player.Character and player.Character:FindFirstChildOfClass("Humanoid") do

                    local char = player.Character

                    local hum = char:FindFirstChildOfClass("Humanoid")

                    local rootPart = char:FindFirstChild("HumanoidRootPart")

                    if hum and rootPart then

                       local vs = hum.MoveDirection * 60

                       rootPart.Velocity = Vector3.new(vs.X, rootPart.Velocity.Y, vs.Z)

                    end

                    runService.Stepped:Wait()

                end

            end)()

        else

            if player.Character and player.Character:FindFirstChildOfClass("Humanoid") then

                player.Character.Humanoid.WalkSpeed = 16 

            end

        end

    end

    

    local function toggleAimbot() states.aimbot = not states.aimbot end



    local function toggleEsp()

        states.esp = not states.esp

        if not states.esp then

            -- ESP kapatıldığında tüm elementleri temizle

            for name, elements in pairs(espElements) do

                if elements.Highlight then elements.Highlight:Destroy() end

                if elements.NameTag then elements.NameTag:Destroy() end

            end

            espElements = {}

        end

    end

    

    local function rejoinGame() teleportService:Teleport(game.PlaceId, player) end



    local function unloadScript()

        if nowe then toggleFly() end

        if states.noclip then toggleNoclip() end

        if states.speed then toggleSpeed() end

        if states.esp then toggleEsp() end

        states.aimbot = false

        screenGui:Destroy()

        print("WrexHub scripti başarıyla durduruldu ve kaldırıldı.")

    end



    -- Sürekli Çalışan Döngüler

    runService.Stepped:Connect(function() 

        if states.noclip and player.Character then 

            for _, p in ipairs(player.Character:GetDescendants()) do 

                if p:IsA("BasePart") then p.CanCollide = false end 

            end 

        end

    end)

    

    runService.RenderStepped:Connect(function()

        if nowe and player.Character and player.Character:FindFirstChildOfClass("Humanoid") then

            local hum = player.Character:FindFirstChildOfClass("Humanoid")

            local partToMove = hum.RigType == Enum.HumanoidRigType.R6 and player.Character.Torso or player.Character.HumanoidRootPart

            local bv = partToMove and partToMove:FindFirstChildOfClass("BodyVelocity")

            local bg = partToMove and partToMove:FindFirstChildOfClass("BodyGyro")

            if not bv or not bg then return end

            

            local dir, cam = Vector3.new(), Workspace.CurrentCamera

            if userInputService:IsKeyDown(Enum.KeyCode.W) then dir += cam.CFrame.LookVector end

            if userInputService:IsKeyDown(Enum.KeyCode.S) then dir -= cam.CFrame.LookVector end

            if userInputService:IsKeyDown(Enum.KeyCode.A) then dir -= cam.CFrame.RightVector end

            if userInputService:IsKeyDown(Enum.KeyCode.D) then dir += cam.CFrame.RightVector end

            local verticalSpeed = 0

            if userInputService:IsKeyDown(Enum.KeyCode.Space) then verticalSpeed = 50 end

            if userInputService:IsKeyDown(Enum.KeyCode.LeftShift) then verticalSpeed = -50 end

            local moveVector = dir.Magnitude == 0 and Vector3.new(0,0,0) or dir.Unit * flySpeed

            bv.Velocity = Vector3.new(moveVector.X, verticalSpeed, moveVector.Z)

            bg.CFrame = cam.CFrame

        end



        if states.aimbot and userInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton2) and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then

            local target, smallestDist = nil, math.huge

            local mousePos = userInputService:GetMouseLocation()

            for _, p in ipairs(Players:GetPlayers()) do

                if p ~= player and p.Character and p.Character:FindFirstChild("HumanoidRootPart") and p.Character:FindFirstChildOfClass("Humanoid").Health >= 1 then

                    local hrp = p.Character.HumanoidRootPart

                    local worldPos, onScreen = Workspace.CurrentCamera:WorldToScreenPoint(hrp.Position)

                    if onScreen then

                        local distance3D = (player.Character.HumanoidRootPart.Position - hrp.Position).Magnitude

                        if distance3D <= maxAimbotDistance then

                            local distance2D = (mousePos - Vector2.new(worldPos.X, worldPos.Y)).Magnitude

                            if distance2D < smallestDist then smallestDist = distance2D; target = p end

                        end

                    end

                end

            end

            if target and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then

                Workspace.CurrentCamera.CFrame = CFrame.lookAt(Workspace.CurrentCamera.CFrame.Position, target.Character.HumanoidRootPart.Position)

            end

        end



        -- // ÖNCEKİ SÜRÜM ESP SİSTEMİ BAŞLANGICI // --

        if states.esp then

            for _, p in ipairs(Players:GetPlayers()) do

                if p ~= player and p.Character and p.Character:FindFirstChild("Head") and p.Character:FindFirstChildOfClass("Humanoid") then

                    local char, head, hum = p.Character, p.Character.Head, p.Character.Humanoid

                    if not espElements[p.Name] or not espElements[p.Name].Highlight or not espElements[p.Name].NameTag then

                        local highlight = Instance.new("Highlight", char); highlight.Name = "ESPHighlight"; highlight.FillColor = Color3.fromRGB(255, 0, 0); highlight.OutlineColor = Color3.fromRGB(255, 255, 255); highlight.FillTransparency = 0.6; highlight.OutlineTransparency = 0; highlight.Adornee = char

                        local billboard = Instance.new("BillboardGui", head); billboard.Name = "NameTag"; billboard.Adornee = head; billboard.Size = UDim2.new(0, 130, 0, 25); billboard.StudsOffset = Vector3.new(0, 2.5, 0); billboard.AlwaysOnTop = true

                        local textLabel = Instance.new("TextLabel", billboard); textLabel.Name = "TagLabel"; textLabel.Size = UDim2.new(1, 0, 1, 0); textLabel.BackgroundTransparency = 1; textLabel.TextColor3 = Color3.new(1, 1, 1); textLabel.Font = Enum.Font.Cartoon; textLabel.TextScaled = true; textLabel.TextStrokeTransparency = 0.6

                        espElements[p.Name] = { Highlight = highlight, NameTag = billboard, TagLabel = textLabel }

                    end

                    local elements = espElements[p.Name]

                    if elements and elements.Highlight and elements.TagLabel then

                        if elements.Highlight.Adornee ~= char then elements.Highlight.Adornee = char; elements.Highlight.Parent = char end

                        if elements.NameTag.Adornee ~= head then elements.NameTag.Adornee = head; elements.NameTag.Parent = head end

                        elements.Highlight.FillColor = hum.Health <= 0 and Color3.fromRGB(120, 0, 0) or Color3.fromRGB(255, 0, 0)

                        if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then

                             local distance = (player.Character.HumanoidRootPart.Position - char.HumanoidRootPart.Position).Magnitude

                             elements.TagLabel.Text = p.Name .. " | " .. string.format("%.0f", distance).."m | ❤️"..math.floor(hum.Health)

                        end

                    end

                else

                    if espElements[p.Name] then espElements[p.Name].Highlight:Destroy(); espElements[p.Name].NameTag:Destroy(); espElements[p.Name] = nil end

                end

            end

            for name, elements in pairs(espElements) do

                if not Players:FindFirstChild(name) then elements.Highlight:Destroy(); elements.NameTag:Destroy(); espElements[name] = nil end

            end

        end

        -- // ÖNCEKİ SÜRÜM ESP SİSTEMİ BİTİŞİ // --

    end)

    

    -- Buton Oluşturucu

    local function createButton(text, yPos, func) 

        local btn = Instance.new("TextButton", mainFrame); btn.Size, btn.Position = UDim2.new(0.8, 0, 0, 40), UDim2.new(0.1, 0, 0, yPos); btn.Text, btn.BackgroundColor3 = text .. " [OFF]", Color3.new(0.3, 0.3, 0.3); btn.TextColor3, btn.Font = Color3.fromRGB(255, 255, 255), Enum.Font.SourceSans

        local toggled = false

        btn.MouseButton1Click:Connect(function() toggled = not toggled; btn.Text = text .. (toggled and " [ON]" or " [OFF]"); func() end)

        return btn 

    end

    

    -- Butonlar

    createButton("Fly", 50, toggleFly)

    createButton("Noclip", 100, toggleNoclip)

    createButton("Speed", 150, toggleSpeed)

    createButton("Aimbot", 200, toggleAimbot)

    createButton("ESP", 250, toggleEsp)

    local rejoinBtn = createButton("Rejoin", 300, rejoinGame); rejoinBtn.Text = "Rejoin"

    

    local unloadBtn = Instance.new("TextButton", mainFrame); unloadBtn.Size, unloadBtn.Position = UDim2.new(0.8, 0, 0, 40), UDim2.new(0.1, 0, 0, 350); unloadBtn.Text, unloadBtn.BackgroundColor3 = "UNLOAD", Color3.new(0.8, 0.1, 0.1); unloadBtn.TextColor3, unloadBtn.Font = Color3.fromRGB(255, 255, 255), Enum.Font.SourceSans

    unloadBtn.MouseButton1Click:Connect(unloadScript)



    -- Animasyon

    tweenService:Create(mainFrame, TweenInfo.new(0.5, Enum.EasingStyle.Quart), {Position = UDim2.new(0.01, 0, 0.1, 0)}):Play()

end



-- KEY SİSTEMİ (ELLEME)

local keyGui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui")); keyGui.DisplayOrder = 999999

local frame = Instance.new("Frame", keyGui); frame.Size = UDim2.new(0, 300, 0, 150); frame.Position = UDim2.new(0.5, -150, 0.5, -75); frame.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1); frame.BorderColor3 = Color3.fromRGB(80, 80, 255)

local title = Instance.new("TextLabel", frame); title.Size = UDim2.new(1, 0, 0, 30); title.Text = "WrexHub Key System"; title.TextColor3 = Color3.fromRGB(255, 255, 255); title.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)

local keyBox = Instance.new("TextBox", frame); keyBox.Size = UDim2.new(0.9, 0, 0, 40); keyBox.Position = UDim2.new(0.05, 0, 0, 40); keyBox.PlaceholderText = "Key Girin"

local submitButton = Instance.new("TextButton", frame); submitButton.Size = UDim2.new(0.9, 0, 0, 40); submitButton.Position = UDim2.new(0.05, 0, 0, 90); submitButton.Text = "GIRIS YAP"



submitButton.MouseButton1Click:Connect(function()

    if ValidKeys[keyBox.Text] then

        ValidKeys[keyBox.Text] = nil; pcall(function() HttpService:PostAsync(WEBHOOK_URL, HttpService:JSONEncode({embeds={{title="✅ WrexHub Aktif Edildi", fields={{name="Kullanıcı", value=player.Name, inline=true}, {name="Kullanılan Key", value="||`"..keyBox.Text.."`||", inline=true}}, color=65280}}})) end)

        keyGui:Destroy(); LoadMainMenu()

    else

        title.Text = "HATALI KEY!"; pcall(function() HttpService:PostAsync(WEBHOOK_URL, HttpService:JSONEncode({content="❌ Hatalı Key Denemesi: **"..player.Name.."**"})) end)

    end

end)



-- BAŞLANGIÇ LOGU

pcall(function() HttpService:PostAsync(WEBHOOK_URL, HttpService:JSONEncode({content="birisi scripti çalıştırdı roblox ismi: **"..player.Name.."**"})) end)

print("WrexHub iskeleti hazır. Ana script'i bekliyor. Padişahım.")

