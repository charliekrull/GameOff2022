EntityWalkState = Class{__includes = BaseState}

function EntityWalkState:init(entity, room)
    self.entity = entity
    self.room = room

    self.moveDuration = 0
    self.moveTimer = 0
end

function EntityWalkState:update(dt)

    self.objHit = false

    if self.entity.dx ~= 0 and self.entity.dy ~= 0 then
        self.entity.dx = self.entity.dx / math.sqrt(2)
        self.entity.dy = self.entity.dy / math.sqrt(2)
    end

    self.entity.x = self.entity.x + self.entity.dx * dt
    self.entity.y = self.entity.y + self.entity.dy * dt

    
    
    


    local collidedObjects = self.entity:checkObjectCollisions()

    if #collidedObjects > 0 then
        self.objHit = true
        self.entity.x = self.entity.x - self.entity.dx * dt
        self.entity.y = self.entity.y - self.entity.dy * dt
    end

end

function EntityWalkState:processAI(params, dt)
    --decide when and how to move
    local room = params.room
    local directions = {'left', 'right', 'down', 'up'}

    if self.moveDuration == 0 then
        self.moveDuration = math.random(3)
        self.dx = math.random(-1, 1) * self.walkSpeed
        self.dy = math.random(-1, 1) * self.walkSpeed
        if self.dx >= self.dy then
            self.direction = self.dx < 0 and 'left' or 'right'

        else
            self.direction = self.dy < 0 and 'up' or 'down'
        end

        
        self.entity:changeAnimation('walk-' .. self.entity.direction)

    elseif self.moveTimer >= self.moveDuration or self.wallHit then
        self.moveTimer = 0

        if math.random(3) == 1 then
            self.entity:changeState('idle')

        else
            self.moveDuration = math.random(3)
            if self.dx >= self.dy then
                self.direction = self.dx < 0 and 'left' or 'right'

            else
                self.direction = self.dy < 0 and 'up' or 'down'
            end
            
            self.entity:changeAnimation('walk-' .. self.entity.direction)
        end
    
    end
    self.moveTimer = self.moveTimer + dt
end

function EntityWalkState:render()
    local anim = self.entity.currentAnimation
    love.graphics.draw(gTextures[anim.texture], gFrames[anim.texture][anim:getCurrentFrame()], math.floor(self.entity.x), math.floor(self.entity.y))
end