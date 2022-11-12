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

    --self.currentRoom = Room(self.player)
    self.currentMap = sti('tilemaps/testMap.lua')
end

function PlayState:update(dt)
    if love.keyboard.wasPressed('escape') then
        love.event.quit()
    end
    self.player.stateMachine:update(dt)
    --self.currentRoom:update(dt)
end

function PlayState:render()
    love.graphics.push()
    --render the world
    --self.currentRoom:render()
    self.currentMap:draw() --function from sti, deal with it yo

   

    self.player:render()
    love.graphics.pop()
end