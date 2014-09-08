class Dungeon

  attr_accessor :player

  def initialize(player_name)
    @player = Player.new(player_name)
    @rooms = []
  end

  def add_room(reference, name, description, connections)
    @rooms << Room.new(reference, name, description, connections)
  end


  def start(location)
    #room_name = "a"
    #room_name = gets.chomp
    @player.location = location
    show_current_description
  end

  def show_current_description
    puts find_room_in_dungeon(@player.location).full_description
  end

  def find_room_in_dungeon(reference)
    @rooms.detect { |room| room.reference == reference}
  end

  def find_room_in_direction(direction)
    find_room_in_dungeon(@player.location).connections[direction]
  end

  def go(direction)
    puts "You go " + direction.to_s
    @player.location = find_room_in_direction(direction)
    show_current_description
  end

  class Player
    attr_accessor :name, :location

    def initialize(name)
      @name = name
    end
  end

  class Room
    attr_accessor :reference, :name, :description, :connections

    def initialize(reference, name, description, connections)
      @reference = reference
      @name = name
      @description = description
      @connections = connections
    end

    def full_description
      @name + "\nYou are in " + @name
    end
  end

end

puts """
Welcome to your best nightmare! \n\nIf you're ready for an adventure, choose an alias.
"""
name = gets.chomp
puts "That's a super lame name, you'll pay for that later."


# Create the main dungeon object
my_dungeon = Dungeon.new(name)

#Add rooms to the dungeon
my_dungeon.add_room(:room1, "The Questions Room", "Answer the Question", {:south => :room2})
my_dungeon.add_room(:room2, "Small Cave", "a small, claustrophobic cave.", {:north => :room1})
#my_dungeon.add_room(:room3, "" )


puts "You are starting in the most northen room, Questions. To change rooms, pick a direction."
location = :room1
my_dungeon.start(location)


#location = gets.chomp.to_sym
#my_dungeon.go(location)





#puts location

#puts "Great"

#input = "n"
#while input != "exit"
  #input = gets.chomp.to_sym
  #my_dungeon.go(input)
#end
