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

    self:generateObjects()

    



    self.player = def.player
end


function Room:update(dt)
    self.player:update(dt)

    for k, entity in pairs(self.entities) do
        entity:processAI({room = self}, dt)
        entity:update(dt)
    end

    for k, object in pairs(self.objects) do
        object:update(dt)
    end
   
end

function Room:render()
    for y = 1, self.height do
        for x = 1, self.width do
            local tile = self.tiles[y][x]
            love.graphics.draw(gTextures['tilesheet'], gFrames['tiles'][tile.id],
            (x - 1) * TILE_SIZE + self.renderOffsetX,
            (y - 1) * TILE_SIZE + self.renderOffsetY)
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
                texture = 'tilesheet',
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
                walkSpeed = ENTITY_DEFS['cultist'].walkSpeed,
                animations = ENTITY_DEFS['cultist'].animations,

                --place the entity in the room
                x = ent.x,
                y = ent.y,

                width = ENTITY_DEFS['cultist'].width,
                height = ENTITY_DEFS['cultist'].height,

                texture = 'cultist',

                room = self

            }

            e.wayPoints = e:getWaypoints(self.tileMap)

            e.stateMachine = StateMachine{
                ['walk'] = function() return EntityWalkState(e, self) end,
                ['idle'] = function() return EntityIdleState(e) end,
                ['patrol'] = function() return EntityPatrolState(e, e.wayPoints) end
            }

            e:changeState('idle')

            table.insert(self.entities, e)

        end
    end

end

function Room:generateObjects() --add objects to the room
    if self.tileMap.layers['GameObjects'] then
        for k, obj in pairs(self.tileMap.layers['GameObjects'].objects) do
            if obj.name == 'door' then
                local door = GameObject{
                    width = obj.width,
                    height = obj.height,
                    x = obj.x,
                    y = obj.y,
                    solid = true,
                    texture = 'tilesheet',
                    frame = EMPTY_TILE
                    
                }

                

                table.insert(self.objects, door)

            elseif obj.name == 'TNT' then
                local tnt = GameObject{
                    width = TILE_SIZE,
                    height = TILE_SIZE,
                    x = obj.x,
                    y = obj.y,
                    solid = true,
                    texture = 'tilesheet',
                    frame = 70
                }

                table.insert(self.objects, tnt)
            
            end
        end
    end
end