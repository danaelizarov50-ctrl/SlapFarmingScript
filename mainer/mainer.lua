-- ========================================
-- FROSTBITE GETTER + GUI
-- Создатель TreixForever
-- ========================================

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/violin-suzutsuki/LinoriaLib/main/Library.lua"))()
local Window = Library:CreateWindow("❄ Frostbite Helper by Grok")

local Tab = Window:CreateTab("Frostbite")

Tab:CreateButton({
    Name = "Получить Frostbite (Ice Trials)",
    Callback = function()
        print("Запуск получения Frostbite...")
        
        local char = game.Players.LocalPlayer.Character
        if char and char:FindFirstChild("HumanoidRootPart") then
            -- Телепорт в зону триала
            char.HumanoidRootPart.CFrame = CFrame.new( -250, 100, 950 ) -- пример координат Ice Trials
            
            wait(1)
            
            -- Активация награды
            for _, obj in ipairs(workspace:GetDescendants()) do
                if obj:IsA("ProximityPrompt") and (obj.Parent.Name:find("Ice") or obj.Parent.Name:find("Essence")) then
                    fireproximityprompt(obj)
                    print("Награда Ice Essence активирована!")
                end
            end
        end
    end
})

Tab:CreateButton({
    Name = "Equip Shard + Auto Freeze Setup",
    Callback = function()
        print("Подготовка к нормальному способу...")
        -- Здесь можно добавить логику экипировки Shard
    end
})

Tab:CreateToggle({
    Name = "Авто-повтор попыток",
    Default = false,
    Callback = function(state)
        _G.AutoFrost = state
        while _G.AutoFrost do
            wait(8)
            -- повтор функции
        end
    end
})

Tab:CreateLabel("Совет: Лучше использовать с другом, у которого уже есть Frostbite.")
