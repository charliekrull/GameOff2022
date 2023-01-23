PlayState = Class{__includes = BaseState}

function PlayState:enter()
    self.camX = 0
    self.camY = 0   

    self.player = Player{
        walkSpeed = ENTITY_DEFS['player'].walkSpeed,
        animations = ENTITY_DEFS['player'].animations,

        x = 4 * TILE_SIZE,
        y = 31 * TILE_SIZE,

        width = 16,
        height = 32,

        texture = 'princess-damsel'
    }

    self.rooms = {['prison-cell'] = Room({tileMap = sti('tilemaps/prisonCell2.lua'), 
        player = self.player,
        width = 45,
        height = 42}),

        ['hallway'] = Room({tileMap = sti('tilemaps/hallway.lua'),
        player = self.player,
        width = 80,
        height = 36})
    }

    self.currentRoom = self.rooms['hallway']


    
    self.currentMap = self.currentRoom.tileMap
    self.player.room = self.currentRoom
    self.player.map = self.currentMap

    

    self.player.stateMachine = StateMachine{
        ['walk'] = function() return PlayerWalkState(self.player, self.currentRoom) end,
        ['idle'] = function() return PlayerIdleState(self.player) end
    }

    self.player:changeState('idle')

    Event.on("change-room", function(nextRoom)
        self:changeRoom(nextRoom)
        return false
    end)
    
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
    -- self.currentRoom:render()

   
        
    
    love.graphics.translate(-math.floor(self.camX), -math.floor(self.camY))
    self.currentMap:draw(-math.floor(self.camX), --function from sti
    -math.floor(self.camY ))


    for k, entity in pairs(self.currentRoom.entities) do
        entity:render()
    end

    for k, obj in pairs(self.currentRoom.objects) do
        obj:render()
    end
    
    self.player:render(self.currentRoom.renderOffsetX, self.currentRoom.renderOffsetY)
    
    love.graphics.pop()
end

function PlayState:updateCamera()
    self.camX = math.max(0,
        math.min(TILE_SIZE * self.currentMap.width - VIRTUAL_WIDTH,
        self.player.x - (VIRTUAL_WIDTH / 2 - 8)))

    self.camY = math.min(TILE_SIZE * self.currentMap.height - VIRTUAL_HEIGHT,
        self.player.y - (VIRTUAL_HEIGHT / 2 - 8)
    )
end

function PlayState:changeRoom(nextRoom)
    self.currentRoom = self.rooms[nextRoom]
    self.currentMap = self.currentRoom.tileMap
    self.player.room = self.currentRoom
    self.player.map = self.currentMap
    self.player.x = self.player.room.playerEntryPointX
    self.player.y = self.player.room.playerEntryPointY
end