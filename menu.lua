local lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/ImInsane-1337/Roblox-UI/main/Prim%20Lib%20Source.lua"))()
local Lucide = loadstring(game:HttpGet("https://raw.githubusercontent.com/deividcomsono/lucide-roblox-direct/refs/heads/main/source.lua"))()

local window = lib.init("Lithium", Color3.fromRGB(255, 100, 100), Enum.KeyCode.End)

task.spawn(function()
    local coreGui = game:GetService("CoreGui")
    while true do
        pcall(function()
            for _, gui in pairs(coreGui:GetChildren()) do
                if gui:IsA("ScreenGui") and gui:FindFirstChild("uiBorder1") then
                    local b1 = gui.uiBorder1
                    if b1.Size.X.Offset < 800 then
                        b1.Size = UDim2.new(0, 800, 0, 500)
                        b1.uiBorder2.Size = UDim2.new(0, 798, 0, 498)
                        b1.uiBorder2.uiBorder3.Size = UDim2.new(0, 796, 0, 496)
                        b1.uiBorder2.uiBorder3.uiBack.Size = UDim2.new(0, 794, 0, 494)
                    end
                    
                    local back = b1.uiBorder2.uiBorder3.uiBack
                    local bottom = back.uiBottom
                    
                    if bottom:FindFirstChild("uiSearchButton") then
                        bottom.uiSearchButton.Visible = false
                    end
                    
                    local tabButtons = {}
                    for _, btn in pairs(bottom.uiBottomHolder:GetChildren()) do
                        if btn:IsA("Frame") and btn.Name == "uiTabButton" then
                            table.insert(tabButtons, btn)
                        end
                    end
                    
                    local tabWidth = 70
                    local totalWidth = #tabButtons * tabWidth
                    
                    bottom.uiBottomHolder.Size = UDim2.new(0, totalWidth, 1, -1)
                    bottom.uiBottomHolder.Position = UDim2.new(0.5, -totalWidth/2, 0, 1)
                    
                    for _, btn in pairs(tabButtons) do
                        btn.Size = UDim2.new(0, tabWidth, 1, 0)
                        local img = btn:FindFirstChild("uiTabButtonImage")
                        local lbl = btn:FindFirstChild("uiTabButtonLabel")
                        
                        if img and lbl then
                            if not img.Image:find("rbxassetid") then
                                local iconData = Lucide.GetAsset(img.Image)
                                if iconData then
                                    img.Image = iconData.Url
                                    img.ImageRectOffset = iconData.ImageRectOffset
                                    img.ImageRectSize = iconData.ImageRectSize
                                end
                            end
                            
                            img.ZIndex = 110
                            img.Visible = true
                            img.ImageColor3 = Color3.new(1, 1, 1)
                            img.Size = UDim2.new(0, 18, 0, 18)
                            img.Position = UDim2.new(0.5, -9, 0, 7)
                            
                            lbl.ZIndex = 111
                            lbl.Position = UDim2.new(0, 0, 1, -22)
                        end
                    end
                end
            end
        end)
        task.wait(0.5)
    end
end)

local aimbotTab = window.createTab("Aimbot", "crosshair")
local visualsTab = window.createTab("Visuals", "eye")
local exploitsTab = window.createTab("Exploits", "zap")
local miscTab = window.createTab("Misc", "settings")
local systemTab = window.createTab("System", "layers")

-- [ System Tab Setup ] --
local guiSection = systemTab.createSection("GUI Configuration")

guiSection.createColorpicker("Accent Color", Color3.fromRGB(255, 100, 100), false, "gui_accent_color", function(val)
    lib.setAccent(val)
end)

guiSection.createButton("Reset Accent", function()
    lib.setAccent(Color3.fromRGB(255, 100, 100))
end)

guiSection.createButton("Unload GUI", function()
    local coreGui = game:GetService("CoreGui")
    for _, gui in pairs(coreGui:GetChildren()) do
        if gui:IsA("ScreenGui") and gui:FindFirstChild("uiBorder1") then
            gui:Destroy()
        end
    end
end)

print("")
