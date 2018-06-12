Team = Class{
  init = function(self, roster, name)
    self.roster = roster
    self.players = {{},{self.roster[1], self.roster[2], self.roster[3], self.roster[4], self.roster[5]}}
    self.name = name
    self.points = 0
    self.catches = 0
    self.dodges = 0
    self.deflections = 0
    self.hits = 0
    self.eliminations = 0
    self.ringouts = 0
    self.mvp = 0
  end;
  
  setupTeam = function(self)
    
  end;
}