class Player
  def play_turn(warrior)
    if warrior.feel.empty?
      warrior.walk! if warrior.health == 20
      warrior.rest! if warrior.health < 20
    else
      warrior.attack!
    end
  end
end
