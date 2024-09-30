-- Exemplo de script simples para Auto Farm em Roblox

getgenv().Configs = {
    ["Auto Farm"] = true,
    ["Speed"] = 0.5,  -- Define a velocidade do farming
    ["Attack Distance"] = 50, -- Define a distância de ataque
}

-- Função para farmar inimigos
local function farmEnemies()
    local player = game.Players.LocalPlayer
    while Configs["Auto Farm"] do
        for _, enemy in pairs(workspace.Enemies:GetChildren()) do
            if enemy.Humanoid.Health > 0 then
                -- Mover o jogador para a posição do inimigo
                player.Character.HumanoidRootPart.CFrame = enemy.HumanoidRootPart.CFrame * CFrame.new(0, Configs["Attack Distance"], 0)
                
                -- Simular ataque
                game:GetService("VirtualUser"):Button1Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
                wait(Configs["Speed"]) -- Esperar um tempo definido pela velocidade
                game:GetService("VirtualUser"):Button1Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
            end
        end
        wait(1)
    end
end

-- Iniciar o farming
if Configs["Auto Farm"] then
    farmEnemies()
end
