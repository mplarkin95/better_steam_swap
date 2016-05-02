# A ruby wrapper to interact with getting someone's steam inventory
# most information coming from here:
# http://stackoverflow.com/questions/17393099/getting-someones-steam-inventory

require 'json'
require 'httparty'

class Game
  # The json hash is the hash that is built from calling JSON.parse on the response
  # body of HTTParty.get on the url.
  #
  # The main hash is the hash created from the given profile id. Each value in the
  # main hash is a hash itself, where the name of the hash is the game and the keys
  # are: name, classid, description, amount, link
  # name:        the name of the game
  # classid:     the id associated with the game
  # description: the description of the game
  # amount:      how many copies of the game exists within the profile
  # link:        the link of the game in the steam store
  #
  # a = Game.new(123456789)
  # a.success? => true
  # a.print_hash => "game => values"
  # b = a.return_hash
  attr_accessor :json_hash, :main_hash

  def initialize(profile_id)
    inven_url = "#{profile_id}" + "inventory/json/753/1"
    response = HTTParty.get("#{inven_url}")
    @json_hash = JSON.parse(response.body)
    raise ArgumentError, "Given profile is private or ID is wrong" unless self.success?
    @main_hash = Hash.new
    build_hash
  end

  # Each json hash has a key called success, if success is true then the request work
  # otherwise it'll be false.
  def success?
    if @json_hash["success"] == true
      return true
    else
      return false
    end
  end

  def print_hash
    @main_hash.each do |key, value|
      puts "#{key} => #{value}"
    end
  end

  def return_hash
    return @main_hash
  end

  def return_games
    games_ary = Array.new
    @main_hash.each_key do |key|
      games_ary << key
    end
    return games_ary
  end

  def get_game_info(game_name)
    return @main_hash["#{game_name}"]
  end

  private

  def build_hash

    # Iterates through the descriptions hash in the JSON hash to get the information
    # on the given profile's inventory. This grabs the name, classid, descriptions,
    # and link of each game within the inventory. Classid is used later in the inventory
    # section of the JSON hash to count the amount of each game, as the amount key of
    # the rgInventory hash does not represent the actual amount of games.
    @json_hash["rgDescriptions"].each do |key, value|

      # Adds to the main hash, where the key is the name of the game
      # and the value is a hash (the value of the rgDescriptions is a hash).
      @main_hash[value["name"]] = Hash.new

      # Adds to the main hash values (which are hashes) associating the classid
      # with its corresponding game.
      @main_hash[value["name"]]["classid"] = value["classid"]

      # Adds to the main hash values associating each description with
      # its corresponding game.
      value["descriptions"].each do |desc|
        if @main_hash[value["name"]]["description"].nil?
          @main_hash[value["name"]]["description"] = desc["value"]
        else
          @main_hash[value["name"]]["description"] << desc["value"]
        end
      end

      # Adds the link to each corresponding game.
      value["actions"].each do |actions|
        @main_hash[value["name"]]["link"] = actions["link"]
      end

      # Adds the amount section for the main hash.
      @main_hash[value["name"]]["amount"] = 0
    end

    # Iterates through the inventory hash of the JSON hash, where each entry is
    # a hash itself. In each of those inner hashes, it checks to see if it has the same
    # classid as one that already exists and if it does that means that there is another
    # copy of that game so we increment the amount key of the main hash.
    @json_hash["rgInventory"].each do |key, value|
      @main_hash.each_key do |key|
        if @main_hash["#{key}"].has_value?(value["classid"])
          @main_hash["#{key}"]["amount"] += 1
        end
      end
    end

  end
end

# a = Game.new(76561198028497405)
#puts "#{a.success?}"
#puts "#{a.print_hash}"
