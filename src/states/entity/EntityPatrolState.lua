EntityPatrolState = Class{__includes = BaseState}

function EntityPatrolState:init(entity, points)
    self.entity = entity
    self.wayPoints = points
    self.pointIndex = 1 --start with the first point of course
    self.nextPointX = self.wayPoints[self.pointIndex] 
    self.nextPointY = self.wayPoints[self.pointIndex + 1]

end

function EntityPatrolState:update(dt)

    
    if self.entity.direction == 'left' then
        self.entity.x = self.entity.x - self.entity.walkSpeed * dt
        

    elseif self.entity.direction == 'right' then
        self.entity.x = self.entity.x + self.entity.walkSpeed * dt
        
    elseif self.entity.direction == 'up' then
        self.entity.y = self.entity.y - self.entity.walkSpeed * dt
        
    elseif self.entity.direction == 'down' then
        self.entity.y = self.entity.y + self.entity.walkSpeed * dt
    
    
    end

    local distToNext = math.sqrt(math.abs(self.entity.x - self.nextPointX) ^ 2 + math.abs(self.entity.y - self.nextPointY) ^ 2)
    if distToNext <= 10 then
        self.pointIndex = math.max(1, (self.pointIndex + 2) % #self.wayPoints)

        self.nextPointX = self.wayPoints[self.pointIndex]
        self.nextPointY = self.wayPoints[self.pointIndex + 1]
    end
end

function EntityPatrolState:render()
    local anim = self.entity.currentAnimation
    love.graphics.draw(gTextures[anim.texture], gFrames[anim.texture][anim:getCurrentFrame()],
        math.floor(self.entity.x), math.floor(self.entity.y))

end

function EntityPatrolState:processAI(params, dt)

    local xDir = 'right'
    local yDir = 'down'
    
    local xDist = self.entity.x - self.nextPointX
    local yDist = self.entity.y - self.nextPointY

    if xDist >= 0 then
        xDir = 'left'
    end

    if yDist >= 0 then
        yDir = 'up'
    end


    if math.abs(xDist) > math.abs(yDist) then
        self.entity.direction = xDir
        self.entity:changeAnimation('walk-' .. xDir)

    else
        self.entity.direction = yDir
        self.entity:changeAnimation('walk-' .. yDir)
    end


end