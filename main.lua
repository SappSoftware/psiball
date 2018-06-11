debug = true

HC = require "hc"
Shape = require "hc.shapes"

Gamestate = require "hump.gamestate"
Class = require "hump.class"
Vector = require "hump.vector"
Camera = require "hump.camera"

require "lib/CLR"
require "lib/FNT"
require "lib/CUR"
require "lib/helper"

require "Tserial"

require "class/Button"
require "class/FillableField"
require "class/Label"

require "class/Arena"

require "state/arena_map"
require "state/main_menu"
require "state/main_menu_options"
require "state/new_game"
require "state/load_game"
require "state/quit_game"

sprites = {}

SW = love.graphics.getWidth()
SH = love.graphics.getHeight()

mousePoint = {}

function love.load(arg)
  if debug then require("mobdebug").start() end
  if love.system.getOS() == "Windows" then
    require("lib/altRun")
  end
  Gamestate.registerEvents()
  love.keyboard.setKeyRepeat(true)
  FNT.DEFAULT = love.graphics.newFont(math.floor(SH/32))
  mousePoint = HC.point(0,0)
  love.graphics.setFont(FNT.DEFAULT)
  love.graphics.setBackgroundColor(CLR.WHITE)
  loadImages()
  fpsCounter = Label("FPS", .015, .97, "left", CLR.BLACK)
  Gamestate.switch(main_menu)
end

function love.update(dt)
  
end

function love.draw(dt)

end

function love.keypressed(key)

end

function loadImages()
end
