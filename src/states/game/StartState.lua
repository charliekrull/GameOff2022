StartState = Class{__includes = BaseState}

function StartState:update(dt)
    if love.keyboard.wasPressed('escape') then
        love.event.quit()
    end
end

function StartState:render()
    love.graphics.printf("Sorry Stalwart Hero, Princess Damsel is in another castle!",
        0, VIRTUAL_HEIGHT / 2, VIRTUAL_WIDTH, 'center')
end