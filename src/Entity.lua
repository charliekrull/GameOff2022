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

    --drawing offsets in case of padded sprites
    self.offsetX = def.offsetX or 0
    self.offsetY = def.offsetY or 0

    self.walkSpeed = def.walkSpeed
    self.texture = def.texture

    self.room = def.room
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

function Entity:changeState(name)
    self.stateMachine:change(name)
end

function Entity:changeAnimation(name)
    self.currentAnimation = self.animations[name]
end

function Entity:update(dt)
    self.stateMachine:update(dt)

    if self.currentAnimation then
        self.currentAnimation:update(dt)
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