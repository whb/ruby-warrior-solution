class Player
  def initialize
    @health = 0
    @rush = false
  end

  def play_turn(warrior)
    @rush = true if warrior.health >= 20
    if warrior.health < 20 && warrior.health >= @health
      warrior.rest!
      @rush = false
    elsif warrior.health < @health && warrior.feel.empty? && !@rush
      warrior.walk! :backward
    elsif warrior.feel.wall?
      warrior.pivot!
    else
      move(warrior)
    end
    @health = warrior.health
  end

  def move(warrior)
    if warrior.feel.empty?
      warrior.walk!
    elsif warrior.feel.captive?
      warrior.rescue!
    else
      warrior.attack!
    end
  end
end
