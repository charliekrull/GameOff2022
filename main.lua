--[[
    Can't do much without a main.lua file
]]

require 'src/Dependencies'

--runs once when the game starts
function love.load()

    love.window.setTitle('Game Title')

    love.graphics.setDefaultFilter('nearest', 'nearest')

    push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT,
        {
            fullscreen = false,
            vsync = true,
            resizable = true
        })

    gStateMachine = StateMachine{
        ['start'] = function() return StartState() end,
        ['play'] = function() return PlayState() end
    }

    gStateMachine:change('start')

    love.keyboard.keysPressed = {}

end

function love.keypressed(key)
    love.keyboard.keysPressed[key] = true
end

function love.keyboard.wasPressed(key)
    return love.keyboard.keysPressed[key]
end

function love.resize(w, h)
    push:resize(w, h)
end

--called every frame
function love.update(dt)
    Timer.update(dt)
    gStateMachine:update(dt)

    love.keyboard.keysPressed = {}
end

function love.draw() 

    push:start()
    gStateMachine:render()
    push:finish()

end