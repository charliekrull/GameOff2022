EntityWalkState = Class{__includes = BaseState}

function EntityWalkState:init(entity, room)
    self.entity = entity
    self.room = room

    self.moveDuration = 0
    self.moveTimer = 0
end

function EntityWalkState:update(dt)

    self.objHit = false

    if self.entity.direction == 'left' then
        self.entity.x = self.entity.x - self.entity.walkSpeed * dt
        

    elseif self.entity.direction == 'right' then
        self.entity.x = self.entity.x + self.entity.walkSpeed * dt
        
    elseif self.entity.direction == 'up' then
        self.entity.y = self.entity.y - self.entity.walkSpeed * dt
        
    elseif self.entity.direction == 'down' then
        self.entity.y = self.entity.y + self.entity.walkSpeed * dt
    
    
    end

    local collidedObjects = self.entity:checkObjectCollisions()

    if #collidedObjects > 0 then
        self.objHit = true
        if self.entity.direction == 'left' then
            self.entity.x = self.entity.x + self.entity.walkSpeed * dt

        elseif self.entity.direction == 'right' then
            self.entity.x = self.entity.x - self.entity.walkSpeed * dt

        elseif self.entity.direction == 'up' then
            self.entity.y = self.entity.y + self.entity.walkSpeed * dt

        elseif self.entity.direction == 'down' then
            self.entity.y = self.entity.y - self.entity.walkSpeed * dt
        end
    end

end

function EntityWalkState:processAI(params, dt)
    --decide when and how to move
    local room = params.room
    local directions = {'left', 'right', 'down', 'up'}

    if self.moveDuration == 0 then
        self.moveDuration = math.random(3)
        self.entity.direction = directions[math.random(#directions)]
        
        self.entity:changeAnimation('walk-' .. self.entity.direction)

    elseif self.moveTimer >= self.moveDuration or self.wallHit then
        self.moveTimer = 0

        if math.random(3) == 1 then
            self.entity:changeState('idle')

        else
            self.moveDuration = math.random(3)
            self.entity.direction = directions[math.random(#directions)]
            
            self.entity:changeAnimation('walk-' .. self.entity.direction)
        end
    
    end
    self.moveTimer = self.moveTimer + dt
end

function EntityWalkState:render()
    local anim = self.entity.currentAnimation
    love.graphics.draw(gTextures[anim.texture], gFrames[anim.texture][anim:getCurrentFrame()], math.floor(self.entity.x), math.floor(self.entity.y))
end