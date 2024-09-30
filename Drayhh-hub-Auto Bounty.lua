getgenv().Configs = {
    -- Escolha de time
    ["Team"] = "Pirates", -- Pirates/Marines
    
    -- Configurações automáticas
    ["Auto Ken"] = true, -- Liga automaticamente Ken Haki
    ["Auto Buso"] = true, -- Liga automaticamente Buso Haki
    ["Auto turn on race v3"] = true, -- Liga automaticamente raça v3
    ["Auto turn on race v4"] = true, -- Liga automaticamente raça v4
    ["FPS Boost"] = false, -- Ativa/desativa boost de FPS para melhor desempenho
    ["Click Time"] = 0.2, -- Intervalo entre ataques
    
    -- Sistema de Bypass para Teleporte
    ["Bypass TP"] = true, -- Ativa bypass para evitar detecção de teleporte

    -- Tempo limite para derrotar um alvo
    ["Time to kill"] = 180, -- segundos - tempo máximo para derrotar o inimigo

    -- Configurações de chat automáticas
    ["Chat"] = {
        ["Enable"] = false, -- Ativar mensagens automáticas no chat
        ["Message"] = {"get good losers", "no skill?", "dont cry xd", "u cant win lol", "try to hunt me", "get a good gaming chair losers", "feeling no skill?"}, -- Mensagens personalizadas
    },
    
    -- Configurações para fugir quando a vida estiver baixa
    ["Run When Low Health"] = {
        ["Enable"] = true, -- Ativar corrida automática quando a vida estiver baixa
        ["Health"] = 3500, -- Valor mínimo de vida para fugir
        ["Come back"] = false -- Se deve voltar após recuperar a vida
    },

    -- Seleção de servidor por região
    ["Region"] = "Singapore", -- Escolha da região (ex.: Singapore, United States, Germany, France, etc.)

    -- Configurações de armas
    ["Weapons"] = {
        -- Configurações de ataque corpo a corpo
        ["Melee"] = {
            ["Enable"] = true, -- Ativar ataques corpo a corpo
            ["Delay"] = 2, -- Delay entre ataques
            ["Skills"] = {
                ["Z"] = {
                    ["Enable"] = true, -- Ativar habilidade Z
                    ["HoldTime"] = 0, -- Tempo segurando a habilidade
                },
                ["X"] = {
                    ["Enable"] = true, -- Ativar habilidade X
                    ["HoldTime"] = 0,
                },
                ["C"] = {
                    ["Enable"] = true, -- Ativar habilidade C
                    ["HoldTime"] = 0,
                }
            }
        },

        -- Configurações de frutas
        ["Fruit"] = {
            ["Enable"] = false, -- Ativar ataques de fruta
            ["Delay"] = 0.5, -- Delay entre ataques de fruta
            ["Skills"] = {
                ["Z"] = {
                    ["Enable"] = true, -- Ativar habilidade Z
                    ["HoldTime"] = 0,
                },
                ["X"] = {
                    ["Enable"] = true, -- Ativar habilidade X
                    ["HoldTime"] = 0,
                },
                ["C"] = {
                    ["Enable"] = false, -- Ativar habilidade C
                    ["HoldTime"] = 0,
                },
                ["V"] = {
                    ["Enable"] = false, -- Ativar habilidade V
                    ["HoldTime"] = 0,
                },
                ["F"] = {
                    ["Enable"] = false, -- Ativar habilidade F
                    ["HoldTime"] = 0,
                }
            }
        },

        -- Configurações de espada
        ["Sword"] = {
            ["Enable"] = false, -- Ativar ataques de espada
            ["Delay"] = 1, -- Delay entre ataques de espada
            ["Skills"] = {
                ["Z"] = {
                    ["Enable"] = true, -- Ativar habilidade Z
                    ["HoldTime"] = 0,
                },
                ["X"] = {
                    ["Enable"] = true, -- Ativar habilidade X
                    ["HoldTime"] = 0,
                }
            }
        },

        -- Configurações de armas de fogo
        ["Gun"] = {
            ["Enable"] = true, -- Ativar ataques de arma de fogo
            ["Delay"] = 2, -- Delay entre ataques
            ["Skills"] = {
                ["Z"] = {
                    ["Enable"] = true, -- Ativar habilidade Z
                    ["HoldTime"] = 0,
                },
                ["X"] = {
                    ["Enable"] = true, -- Ativar habilidade X
                    ["HoldTime"] = 0,
                }
            }
        }
    },

    -- Configurações de tema
    ["Theme"] = {
        ["Enable"] = true, -- Ativar temas
        ["Name"] = "Hutao", -- Temas disponíveis: Hutao, Raiden, Ayaka, Yelan
        ["Custom Theme"] = {
            ["Enable"] = false, -- Ativar tema customizado
            ["Text Color"] = Color3.fromRGB(231, 85, 88), -- Cor do texto
            ["Character Position"] = UDim2.new(0.563, 0, -0.175, 0) -- Posição do personagem na tela
        }
    }
}

-- Função para Auto Farm inimigos
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
