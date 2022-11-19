EntityWalkState = Class{__includes = BaseState}

function EntityWalkState:init(entity, room)
    self.entity = entity
    self.room = room 
end

function EntityWalkState:update(dt)

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
end

function EntityWalkState:render()
    local anim = self.entity.currentAnimation
    love.graphics.draw(gTextures[anim.texture], gFrames[anim.texture][anim:getCurrentFrame()], math.floor(self.entity.x), math.floor(self.entity.y))
end