Room = Class{}

function Room:init(def)
    self.width = def.width
    self.height = def.height
    
    self.tiles = {}
    self.tileMap = def.tileMap

    
    
    self.entities = {}

    self.objects = {}

    if self.tileMap.layers['Walls'] then
        for k, obj in pairs(self.tileMap.layers['Walls'].objects) do
            local wall = GameObject{
                width = obj.width,
                height = obj.height,
                solid = true,
                x = obj.x,
                y = obj.y,
                texture = gTextures['tilesheet'],
                frame = EMPTY_TILE
            }
            table.insert(self.objects, wall)
            
        end
    end

    self.player = def.player
end


function Room:update(dt)
    self.player:update(dt)
end

function Room:render()
    for y = 1, self.height do
        for x = 1, self.width do
            local tile = self.tiles[y][x]
            love.graphics.draw(gTextures['tilesheet'], gFrames['tiles'][tile.id],
            (x - 1) * TILE_SIZE,
            (y - 1) * TILE_SIZE)
        end
    end
    for k, obj in pairs(self.objects) do
        obj:render()
    end
end
