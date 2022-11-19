EntityIdleState = Class{__includes = BaseState}

function EntityIdleState:init(entity)
    self.entity = entity

    self.entity:changeAnimation('idle-'.. self.entity.direction)

    self.waitDuration = 0
    self.waitTimer = 0
    
end


function EntityIdleState:processAI(params, dt)
    if self.waitDuration == 0 then
       self.waitDuration = math.random(3)
       
    else
        self.waitTimer = self.waitTimer + dt
    end

    if self.waitTimer >= self.waitDuration then
        self.entity:changeState('walk')
    end
end

function EntityIdleState:render()
    local anim = self.entity.currentAnimation
    love.graphics.draw(gTextures[anim.texture], gFrames[anim.texture][anim:getCurrentFrame()], math.floor(self.entity.x), math.floor(self.entity.y))
end