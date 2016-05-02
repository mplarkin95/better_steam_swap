# @author: Jonathan Cyr
#
# A ruby wrapper to interact with getting someone's steam inventory
# most information coming from here:
# http://stackoverflow.com/questions/17393099/getting-someones-steam-inventory

require 'json'
require 'httparty'

class Inventory
  attr_reader :inven_url
  attr_accessor :inven_hash

  def initialize(profile_id)
    @inven_url = "#{profile_id}" + "inventory/json/753/1"
    @inven_hash = Hash.new
  end

  # json guide:
  # success        => true if successful, false otherwise
  # rgInventory    => a hash of hashes, where each hash is a game, the hashes are
  #                   identified by their id
  # rgDescriptions => a hash of hashes
  def get_inven_info
    response = HTTParty.get("#{@inven_url}")
    hash = JSON.parse(response.body)
    puts response.body
    if hash["success"] = true
      return true
    else
      return false
    end
  end
end

# matt larkin
# 76561198028497405
# jonny cyr
# 76561198027527166
# m = Inventory.new(76561198028497405)
# m.get_inven_info
