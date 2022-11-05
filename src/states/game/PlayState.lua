PlayState = Class{__includes = BaseState}

function PlayState:init()
    self.player = Player{
        walkSpeed = ENTITY_DEFS['player'].walkSpeed,

        x = VIRTUAL_WIDTH / 2 - 8,
        y = VIRTUAL_HEIGHT / 2 - 16,

        width = 16,
        height = 32,

        texture = 'princess-damsel'
    }

    self.player.stateMachine = StateMachine{
        ['walk'] = function() return PlayerWalkState(self.player) end,
        ['idle'] = function() return PlayerIdleState(self.player) end
    }

    self.player:changeState('idle')
end

function PlayState:update(dt)
    if love.keyboard.wasPressed('escape') then
        love.event.quit()
    end
    self.player.stateMachine:update(dt)
end

function PlayState:render()
    love.graphics.push()
    --render the world
    self.player:render()
    love.graphics.pop()
end