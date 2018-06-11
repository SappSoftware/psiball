Player = Class{
  init = function(self, player_name, discipline, attributes)
    self.name = player_name
    self.attributes = attributes
    self.discipline = discipline
    self.position = {1,1}
    self.hasBall = false
    self.action = nil
  end;
}