StartState = Class{__includes = BaseState}

function StartState:init()
    self.backgroundR = math.random()
    self.backgroundG = math.random()
    self.backgroundB = math.random()
end

function StartState:update(dt)
    if love.keyboard.wasPressed('escape') then
        love.event.quit()
    end

    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
        gStateMachine:change('play')
    end
end

function StartState:render()
    love.graphics.clear(self.backgroundR, self.backgroundG, self.backgroundB, 1)
    love.graphics.setColor(1, 1, 1, 1)
    love.graphics.setFont(gFonts['large'])
    love.graphics.printf("Title Screen",
        0, VIRTUAL_HEIGHT / 2, VIRTUAL_WIDTH, 'center')
end