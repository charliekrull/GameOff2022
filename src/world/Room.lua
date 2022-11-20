Room = Class{}

function Room:init(def)
    self.width = def.width
    self.height = def.height
    
    self.tiles = {}
    self.tileMap = def.tileMap

    
    
    self.entities = {}

    self.objects = {}

    self:generateWalls()

    self:generateEntities()
   



    self.player = def.player
end


function Room:update(dt)
    self.player:update(dt)

    for k, entity in pairs(self.entities) do
        entity:processAI({room = self}, dt)
        entity:update(dt)
    end
   
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

function Room:generateWalls()
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
end


function Room:generateEntities() --put the entities in the right spots

    if self.tileMap.layers['Entities'] then
        for k, ent in pairs(self.tileMap.layers['Entities'].objects) do
            local e = Entity{
                walkSpeed = ENTITY_DEFS['bat'].walkSpeed,
                animations = ENTITY_DEFS['bat'].animations,

                --place the entity in the room
                x = ent.x,
                y = ent.y,

                width = ENTITY_DEFS['bat'].width,
                height = ENTITY_DEFS['bat'].height,

                texture = 'bat',

                room = self

            }

            e.stateMachine = StateMachine{
                ['walk'] = function() return EntityWalkState(e, self) end,
                ['idle'] = function() return EntityIdleState(e) end,
                ['patrol'] = function() return EntityPatrolState(e, {10 * TILE_SIZE, 6 * TILE_SIZE, 34 * TILE_SIZE, 6 * TILE_SIZE, 34 * TILE_SIZE, 34 * TILE_SIZE, 10 * TILE_SIZE, 34 * TILE_SIZE}) end
            }

            e:changeState('idle')

            table.insert(self.entities, e)

        end
    end

end

function Room:generateObjects() --add objects to the room

end