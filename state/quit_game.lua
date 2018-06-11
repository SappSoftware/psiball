quit_game = {}

local buttons = {}
local labels = {}
local fields = {}

function quit_game:init()
  self:initializeButtons()
  self:initializeLabels()
  self:initializeFields()
end

function quit_game:enter(from)
  love.graphics.setBackgroundColor(CLR.WHITE)
end

function quit_game:update(dt)
  self:handleMouse()
end

function quit_game:keypressed(key)
  for pos, field in pairs(fields) do
    field:keypressed(key)
  end
  if key == "escape" then
    Gamestate.pop()
  end
end

function quit_game:textinput(text)
  for pos, field in pairs(fields) do
    field:textinput(text)
  end
end

function quit_game:mousepressed(mousex, mousey, mouseButton)
  mousePoint:moveTo(mousex, mousey)
  
  if mouseButton == 1 then
    for pos, field in pairs(fields) do
      field:highlight(mousePoint)
      field:mousepressed(mouseButton)
    end
    
    for pos, button in pairs(buttons) do
      button:highlight(mousePoint)
      button:mousepressed(mouseButton)
    end
  end
end

function quit_game:mousereleased(mousex, mousey, mouseButton)
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


function quit_game:draw()
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
  
  love.graphics.setColor(CLR.BLACK)
  love.graphics.rectangle("line", 0, 0, SW, SH)
end

function quit_game:initializeButtons()
  buttons.yes = Button(.35, .7, .3, .1, "Yes", CLR.BLACK)
  buttons.no = Button(.66, .7, .3, .1, "No", CLR.BLACK)
  
  buttons.yes.action = function()
    love.event.quit()
  end
  
  buttons.no.action = function()
    love.mouse.setCursor()
    Gamestate.pop()
  end
end

function quit_game:initializeLabels()
  labels.title = Label("Quit to Desktop", .5, .1, "center", CLR.BLACK)
end

function quit_game:initializeFields()
  
end

function quit_game:handleMouse()
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

function quit_game:quit()
  
end