Class = require 'lib/class'
push = require 'lib/push'
Timer = require 'lib/knife/timer'

require 'src/constants'

require 'src/states/BaseState'
require 'src/states/game/StartState'
require 'src/states/game/PlayState'
require 'src/StateMachine'

require 'src/Entity'
require 'src/Player'
require 'src/entity_defs'


require 'src/states/entity/EntityIdleState'
require 'src/states/entity/EntityWalkState'
require 'src/states/entity/player/PlayerIdleState'
require 'src/states/entity/player/PlayerWalkState'

require 'src/world/Room'

gTextures = {
   ['princess-damsel'] = love.graphics.newImage('graphics/PrincessDamsel_V2_e1.png'),
   ['floor1'] = love.graphics.newImage('graphics/Floor_1.png'),
   ['wall1'] = love.graphics.newImage('graphics/Wall_1.png'),
   ['bat'] = love.graphics.newImage('graphics/Lil_Minionbat_V1_noparticles.png')
}
