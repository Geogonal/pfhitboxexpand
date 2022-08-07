local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "Hitbox Extender"})
local Tab = Window:MakeTab({Name = 'Main', Icon = 'rbxassetid://2605986486', PremiumOnly = false})
local enabled = false
local teamcolor
local size = 10
local trans = 0.5
local part = 'Head'
function handler(plr)
    if enabled then
        teamcolor = game.Players.LocalPlayer.TeamColor
        print(teamcolor)
        if plr.Parent.Name ~= teamcolor then
            plr[part].Size = Vector3.new(size, size, size)
            plr[part].Mesh.Scale = Vector3.new(size, size, size)
            plr[part].Transparency = trans
        end
    end
end
function update()
    teamcolor = game.Players.LocalPlayer.TeamColor
    for i, v in pairs(game.Workspace.Players:GetChildren()) do
        if v.Name ~= teamcolor then
            for i2, v2 in pairs(v:GetChildren()) do
                if enabled then
                    v2[part].Size = Vector3.new(size, size, size)
                    v2[part].Mesh.Scale = Vector3.new(size, size, size)
                    v2[part].Transparency = trans
                else
                    v2[part].Size = Vector3.new(size, size, size)
                    v2[part].Mesh.Scale = Vector3.new(1, 1, 1)
                    v2[part].Transparency = 0
                end
            end
        end
    end
end
Tab:AddToggle({
	Name = "Hitbox extender",
	Default = false,
	Callback = function(val)
	    update()
        if val then
            enabled = true
        else
            enabled = false
        end
  	end
})
Tab:AddSlider({
    Name = "Size(studs)",
    Min = 5,
    Max = 35,
    Default = 10,
    Color = Color3.fromRGB(255, 255, 255),
    Increment = 1,
    ValueName = 'studs',
    Callback = function(val)
        update()
        size = val
    end
})
Tab:AddSlider({
    Name = "Transparency(might not be working)",
    Min = 0,
    Max = 1,
    Default = 0.5,
    Color = Color3.fromRGB(255,255,255),
    Increment = 0.01,
    ValueName = '',
    Callback = function(val)
        update()
        trans = val
    end
})
for i, v in pairs(game.Workspace.Players:GetChildren()) do
    if enabled then
        teamcolor = game.Players.LocalPlayer.TeamColor
        if v.Name ~= teamcolor then
            for i2, v2 in pairs(v:GetChildren()) do
                v2[part].Size = Vector3.new(size, size, size)
                v2[part].Mesh.Scale = Vector3.new(size, size, size)
                v2[part].Transparency = trans
            end
        end
    end
end
game.Workspace.Players["Bright blue"].ChildAdded:Connect(function(child)
    if child.Name == 'Player'  then
        handler(child)
    end 
end)
game.Workspace.Players["Bright orange"].ChildAdded:Connect(function(child)
    if child.Name == 'Player'  then
        handler(child)
    end 
end)
OrionLib:Init()