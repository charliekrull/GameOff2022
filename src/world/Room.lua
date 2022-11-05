Room = Class{}

function Room:init(player)
    self.width = MAP_WIDTH
    self.height = MAP_HEIGHT
    
    self.tiles = {}
    self:generateWallsAndFloors()
    
    self.entities = {}

    self.objects = {}

    self.player = player
end

function Room:generateWallsAndFloors()
    for y = 1, self.height do
        table.insert(self.tiles, {})

        for x = 1, self.width do
            local id = TILE_WALL
            if not (x == 1 or x == self.width or y == 1 or y == self.height) then
                id = TILE_FLOOR

            end

            table.insert(self.tiles[y], {
                id = id
            })
        end
    end
end

function Room:update(dt)
    self.player:update(dt)
end

function Room:render()
    for y = 1, self.height do
        for x = 1, self.width do
            local tile = self.tiles[y][x]
            love.graphics.draw(gTextures[tile.id],
            (x - 1) * TILE_SIZE,
            (y - 1) * TILE_SIZE)
        end
    end
end