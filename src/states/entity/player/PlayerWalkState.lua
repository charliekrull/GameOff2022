PlayerWalkState = Class{__includes = EntityWalkState}

function PlayerWalkState:init(player, room)
    self.entity = player
    self.room = room
end

function PlayerWalkState:update(dt)

    self.entity.dx = 0
    self.entity.dy = 0

    if love.keyboard.isDown('left') then
        self.entity.direction = 'left'
        self.entity.dx = -self.entity.walkSpeed
        

    end
        
    if love.keyboard.isDown('right') then
        self.entity.direction = 'right'
        self.entity.dx = self.entity.walkSpeed
        
    end

    if love.keyboard.isDown('down') then
        self.entity.direction = 'down'
        self.entity.dy = self.entity.walkSpeed
        
    end

    if love.keyboard.isDown('up') then
        self.entity.direction = 'up'
        self.entity.dy = -self.entity.walkSpeed
        

    end

    self.entity:changeAnimation('walk-'..self.entity.direction)

    if self.dx == 0 and self.dy == 0 then
        self.entity:changeState('idle')
    end






    EntityWalkState.update(self, dt)
end