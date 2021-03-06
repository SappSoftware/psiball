arena_map = {}

local buttons = {}
local labels = {}
local fields = {}
local arena = {}

function arena_map:init()
  self:initializeButtons()
  self:initializeLabels()
  self:initializeFields()
  arena = Arena(SW, SH)
end

function arena_map:enter(from)
  love.graphics.setBackgroundColor(CLR.WHITE)
end

function arena_map:update(dt)
  self:handleMouse()
end

function arena_map:keypressed(key)
  
end

function arena_map:mousepressed(mousex, mousey, mouseButton)
  mousePoint:moveTo(mousex, mousey)
  
  if mouseButton == 1 then
    for i, field in pairs(fields) do
      field:highlight(mousePoint)
      field:mousepressed(mouseButton)
    end
    
    for i, button in pairs(buttons) do
      button:highlight(mousePoint)
      button:mousepressed(mouseButton)
    end
  end
end

function arena_map:mousereleased(mousex, mousey, mouseButton)
  mousePoint:moveTo(mousex, mousey)
  
  if mouseButton == 1 then
    for pos, field in pairs(fields) do
      field:highlight(mousePoint)
      field:mousereleased(mouseButton)
    end
    
    for pos, button in pairs(buttons) do
      button:highlight(mousePoint)
      button:mousereleased(mouseButton)
    end
  end
end


function arena_map:draw()
  love.graphics.setBackgroundColor(CLR.WHITE)
  drawFPS(fpsCounter)
  for key, button in pairs(buttons) do
    button:draw()
  end
  for pos, field in pairs(fields) do
    field:draw()
  end
  for pos, label in pairs(labels) do
    label:draw()
  end
  
  --if arena ~= {} then
    arena:draw()
  --end
  
  love.graphics.setColor(CLR.BLACK)
  love.graphics.rectangle("line", 0, 0, SW, SH)
end

function arena_map:resize(w,h)
  love.graphics.setFont(love.graphics.newFont(math.floor(h/64)))
  
  for key, button in pairs(buttons) do
    button:resize(SW, SH, w, h)
  end
  
  SW = w
  SH = h
end

function arena_map:initializeButtons()
  
end

function arena_map:initializeLabels()
  labels.title = Label("Arena", .5, .1, "center", CLR.BLACK)
end

function arena_map:initializeFields()
  --fields.genericField = FillableField(.5, .4, .15, .03, "Field Text", false, true, 16)
end

function arena_map:handleMouse()
  mousePoint:moveTo(love.mouse.getX(), love.mouse.getY())
  local highlightButton = false
  local highlightField = false
  
  for key, button in pairs(buttons) do
    if button:highlight(mousePoint) then
      highlightButton = true
    end
  end
  
  for key, field in pairs(fields) do
    if field:highlight(mousePoint) then
      highlightField = true
    end
  end
  
  if highlightButton then
    love.mouse.setCursor(CUR.H)
  elseif highlightField then
    love.mouse.setCursor(CUR.I)
  else
    love.mouse.setCursor()
  end
end

function arena_map:quit()
  
end