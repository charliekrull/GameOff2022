PlayerWalkState = Class{__includes = EntityWalkState}

function PlayerWalkState:init(player)
    self.entity = player
end

function PlayerWalkState:update(dt)
    if love.keyboard.isDown('left') then
        self.entity.direction = 'left'
        
    elseif love.keyboard.isDown('right') then
        self.entity.direction = 'right'

    elseif love.keyboard.isDown('down') then
        self.entity.direction = 'down'

    elseif love.keyboard.isDown('up') then
        self.entity.direction = 'up'

    else
        self.entity:changeState('idle')
    end

    EntityWalkState.update(self, dt)
end