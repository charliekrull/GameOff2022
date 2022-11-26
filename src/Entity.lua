--[[
    An entity we need to keep track of, ie an enemy, the player
]]

Entity = Class{}

function Entity:init(def)
    self.direction = 'down'
    

    self.animations = self:createAnimations(def.animations)

    self.x = def.x
    self.y = def.y

    self.width = def.width
    self.height = def.height

    --point representing the midpoint of their FOV
    self.aheadX = self.x + self.width/2
    self.aheadY = self.y + 10

    --drawing offsets in case of padded sprites
    self.offsetX = def.offsetX or 0
    self.offsetY = def.offsetY or 0

    self.walkSpeed = def.walkSpeed
    self.texture = def.texture

    self.room = def.room

    self.pointIndex = 1
    self.wayPoints = {}

    
end

function Entity:createAnimations(animations)
    local animationsReturned = {}

    for k, animationDef in pairs(animations) do
        animationsReturned[k] = Animation{
            texture = animationDef.texture,
            frames = animationDef.frames,
            interval = animationDef.interval
        }
    end

    return animationsReturned
end

function Entity:collides(target)
    return not (self.x + self.width < target.x or self.x > target.x + target.width or
                self.y + self.height < target.y or self.y > target.y + target.height)
end

function Entity:changeState(name, params)
    self.stateMachine:change(name, params)
end

function Entity:changeAnimation(name)
    self.currentAnimation = self.animations[name]
end

function Entity:update(dt)
    self.stateMachine:update(dt)

    if self.currentAnimation then
        self.currentAnimation:update(dt)
    end

    if self.direction == 'down' then
        self.aheadX = self.x + self.width/2
        self.aheadY = self.y + 20

    elseif self.direction == 'up' then
        self.aheadX = self.x + self.width/2
        self.aheadY = self.y - 20

    elseif self.direction == 'right' then
        
        self.aheadX = self.x + 20
        self.aheadY = self.y + self.height/2

    elseif self.direction == 'left' then
        self.aheadX = self.x - 20
        self.aheadY = self.y + self.height/2    
    
    end
end

function Entity:processAI(params, dt)
    self.stateMachine:processAI(params, dt)
end

function Entity:render(adjacentOffsetX, adjacentOFfsetY)
    self.x, self.y = self.x + (adjacentOffsetX or 0), self.y + (adjacentOFfsetY or 0)
    self.stateMachine:render()
    love.graphics.setColor(1, 1, 1, 1)
    self.x, self.y = self.x - (adjacentOffsetX or 0), self.y - (adjacentOFfsetY or 0)

    --draw an indicator if the entity can see the player, for debugging purposes
    if self:canSee(self.room.player) then
        love.graphics.setColor(1, 0, 0, 1)
        love.graphics.rectangle('fill', self.x + 4, self.y - 16, 8, 8)
        love.graphics.setColor(1, 1, 1, 1)
    end

    love.graphics.setColor(0, 0, 1, 1)
    love.graphics.circle('fill', self.aheadX, self.aheadY, 2)
    love.graphics.setColor(1, 1, 1, 1)
end

function Entity:checkObjectCollisions()
    local collidedObjects = {}

    for k, object in pairs(self.room.objects) do
        if self:collides(object) then
            if object.solid then
                table.insert(collidedObjects, object)
            elseif object.consumable then
                object.onConsume(self)
                table.remove(self.room.objects, k)
            end
        end
    end

    return collidedObjects

end

function Entity:canSee(player) --used for entities other than the player that will be searching for her
    --calculate the distance between player and entity
    local distToPlayer = math.sqrt(math.abs(player.x - self.x) ^ 2 + math.abs(player.y - self.y) ^ 2)

    if distToPlayer <= 120 then
    --doing some trigonometry ripped from the internet
        --start by getting the vector to the midline of the FOV
        local selfToMid = math.sqrt((self.x + self.width/2 - self.aheadX)^2 + (self.y + self.height/2 - self.aheadY)^2)
        --then from self to the player
        local selfToPlayer = math.sqrt((self.x + self.width/2 - player.x)^2 + (self.y + self.height/2 - player.y)^2)
        --we'll also need from the player to the midpoint
        local midToPlayer = math.sqrt((player.x - self.aheadX) ^ 2 + (player.y - self.aheadY)^2)

        --calculate the angle between them
        local angle = math.acos((selfToMid^2 + selfToPlayer^2 - midToPlayer^2)/(2 * selfToMid * selfToPlayer))

        if angle < math.pi/2 then
            local points = bresenham(self.x, self.y, player.x, player.y)
            for k, point in pairs(points) do
                for l, obj in pairs(self.room.objects) do
                    if not (point['x'] < obj.x or point['x'] > obj.x + obj.width or point['y'] < obj.y or point['y'] > obj.y + obj.height) then
                        
                        return false
                    end


                end
            end

            return true
            
        end

    end
    
    return false
    
end

function Entity:getWaypoints(tilemap)
    local waypoints = {}
    local currentX = 0
    local currentY = 0
    for k, route in pairs(tilemap.layers['Routes'].objects) do
        if route.x == self.x and route.y == self.y then
            for l, point in ipairs(route.polygon) do

                currentX = currentX + point.x
                currentY = currentY + point.y
                
                waypoints[#waypoints + 1] = currentX
                waypoints[#waypoints + 1] = currentY

                currentX = 0
                currentY = 0

               
            end
        end        
    end

    

    return waypoints
end