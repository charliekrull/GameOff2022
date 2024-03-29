EntityIdleState = Class{__includes = BaseState}

function EntityIdleState:init(entity)
    self.entity = entity

    self.entity:changeAnimation('idle-'.. self.entity.direction)

    self.waitDuration = 0
    self.waitTimer = 0
    
end


function EntityIdleState:processAI(params, dt)
    if self.waitDuration == 0 then
       self.waitDuration = 1
       
    else
        self.waitTimer = self.waitTimer + dt
    end

    -- if self.waitTimer >= self.waitDuration then
    --     self.entity:changeState('patrol', {wayPoints = self.entity.wayPoints, pointIndex = self.entity.pointIndex})
    -- end
end

function EntityIdleState:render()
    local anim = self.entity.currentAnimation
    love.graphics.draw(gTextures[anim.texture], gFrames[anim.texture][anim:getCurrentFrame()], math.floor(self.entity.x), math.floor(self.entity.y))
end