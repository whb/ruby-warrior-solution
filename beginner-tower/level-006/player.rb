class Player
  def initialize
    @rush = false
    @health = 0
  end

  def play_turn(warrior)
    @direction = :forward unless @direction
    if warrior.health < @health && warrior.feel(@direction).empty? && !@rush
      @direction = :backward
    end
    if warrior.feel(:backward).wall?
      @direction = :forward
      @rush = true
    end

    if warrior.health < 20 && warrior.health >= @health
      warrior.rest!
    else
      move(warrior, @direction)
    end
    @health = warrior.health
  end

  def move(warrior, direction)
    if warrior.feel(direction).empty?
      warrior.walk! direction
    elsif warrior.feel(direction).captive?
      warrior.rescue! direction
    else
      warrior.attack!
    end
  end
end
