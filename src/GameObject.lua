GameObject = Class{}

function GameObject:init(def)

    self.type = def.type
    self.texture = def.texture
    self.frame = def.frame or 1

    --whether it impedes movement
    self.solid = def.solid

    self.x = def.x
    self.y = def.y
    self.width = def.width
    self.height = def.height
    --empty function for what happens when you collide with it
    self.onCollide = function() end

end

function GameObject:update(dt)

end

function GameObject:render()
    love.graphics.draw(gTextures[self.texture], gFrames[self.texture][self.frame], self.x, self.y)
end