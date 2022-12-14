PlayState = Class{__includes = BaseState}

function PlayState:enter()
    self.camX = 0
    self.camY = 0

    

    self.player = Player{
        walkSpeed = ENTITY_DEFS['player'].walkSpeed,
        animations = ENTITY_DEFS['player'].animations,

        x = 24 * TILE_SIZE,
        y = 20 * TILE_SIZE,

        width = 16,
        height = 32,

        texture = 'princess-damsel'
    }

    self.currentRoom = Room({tileMap = sti('tilemaps/prisonCell.lua'), 
        player = self.player,
        width = 45,
        height = 42})

    
    self.currentMap = self.currentRoom.tileMap
    self.player.room = self.currentRoom
    self.player.map = self.currentMap

    

    self.player.stateMachine = StateMachine{
        ['walk'] = function() return PlayerWalkState(self.player, self.currentRoom) end,
        ['idle'] = function() return PlayerIdleState(self.player) end
    }

    self.player:changeState('idle')
    
end

function PlayState:update(dt)
    if love.keyboard.wasPressed('escape') then
        love.event.quit()
    end
    self.player.stateMachine:update(dt)
    self:updateCamera()

    self.currentRoom:update(dt)
end

function PlayState:render()

   
    love.graphics.push()
    --render the world
    --self.currentRoom:render()

    
    
    love.graphics.translate(-math.floor(self.camX), -math.floor(self.camY))
    self.currentMap:draw(-math.floor(self.camX), -math.floor(self.camY)) --function from sti
    
   
    for k, entity in pairs(self.currentRoom.entities) do
        entity:render()
    end
    
    self.player:render()
    
    
    love.graphics.pop()
end

function PlayState:updateCamera()
    self.camX = math.max(0, 
        math.min(TILE_SIZE * self.currentMap.width - VIRTUAL_WIDTH,
        self.player.x - (VIRTUAL_WIDTH / 2 - 8)))

    self.camY =  math.max(0, math.min(TILE_SIZE * self.currentMap.height - VIRTUAL_HEIGHT,
        self.player.y - (VIRTUAL_HEIGHT / 2 - 8)))
end