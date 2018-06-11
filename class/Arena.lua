Arena = Class{
  init = function(self, w, h, teams)
    self.teams = teams or nil
    self.floor = {}
    self.floor[1] = {}
    self.floor[1].circle = HC.circle(w*0.5, h*0.5, h*(0.9*0.5*0.5))
    self.floor[1].isActive = true
    
    self.floor[2] = {}
    self.floor[2].circle = HC.circle(w*0.5, h*0.5, h*(0.9*0.5*0.8))
    self.floor[2].isActive = true
    
    self.floor[3] = {}
    self.floor[3].circle = HC.circle(w*0.5, h*0.5, h*(0.9*0.5*1))
    self.floor[3].isActive = true
  end;
  
  draw = function(self)
    for i, floor in ipairs(self.floor) do
      if floor.isActive then
        love.graphics.setColor(CLR.BLACK)
        floor.circle:draw("line")
      end
    end
  end;
  
}