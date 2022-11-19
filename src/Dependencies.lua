Class = require 'lib/class'
push = require 'lib/push'
Timer = require 'lib/knife/timer'
Event = require 'lib/knife/event'
sti = require 'lib/sti' --Simple Tiled Implementation, to use with .lua files from Tiled
require 'src/constants'

require 'src/states/BaseState'
require 'src/states/game/StartState'
require 'src/states/game/PlayState'
require 'src/StateMachine'
require 'src/GameObject'

require 'src/Entity'
require 'src/Player'
require 'src/entity_defs'
require 'src/util'

require 'src/Animation'

require 'src/states/entity/EntityIdleState'
require 'src/states/entity/EntityWalkState'
require 'src/states/entity/player/PlayerIdleState'
require 'src/states/entity/player/PlayerWalkState'

require 'src/world/Room'
require 'tilemaps/testMap'

gTextures = {
   ['princess-damsel'] = love.graphics.newImage('graphics/PD_Sprite_v1.png'),
   ['floor1'] = love.graphics.newImage('graphics/Floor_1.png'),
   ['wall1'] = love.graphics.newImage('graphics/Wall_1.png'),
   ['bat'] = love.graphics.newImage('graphics/Lil_Minionbat_V1_sheet.png'),
   ['tilesheet'] = love.graphics.newImage('graphics/Map_Tileset_06.png')
}

gFrames = { ['tiles'] = GenerateQuads(gTextures['tilesheet'], TILE_SIZE, TILE_SIZE),
['princess-damsel'] = GenerateQuads(gTextures['princess-damsel'], TILE_SIZE, 32),
['bat'] = GenerateQuads(gTextures['bat'], 32, TILE_SIZE)

}

gFonts = {
   ['large'] = love.graphics.newFont('fonts/joystix monospace.ttf', 24),
   ['medium'] = love.graphics.newFont('fonts/joystix monospace.ttf', 16),
   ['small'] = love.graphics.newFont('fonts/joystix monospace.ttf', 10)
}