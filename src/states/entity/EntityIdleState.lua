EntityIdleState = Class{__includes = BaseState}

function EntityIdleState:init(entity)
    self.entity = entity
    
end


function EntityIdleState:processAI(params, dt)

end

function EntityIdleState:render()
    love.graphics.draw(gTextures[self.entity.texture], math.floor(self.entity.x), math.floor(self.entity.y))
end