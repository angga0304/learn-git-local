class Player
  attr_accessor :nama, :blood, :mana
  
  def initialize nama
    @nama = nama
    @blood = 100
    @mana = 40
  end

  def attack
    @mana -=20
  end
 
  def attacked
    @blood -=20
  end
end
