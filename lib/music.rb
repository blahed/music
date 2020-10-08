require 'music/data'
require 'music/playlist'
require 'music/song'
require 'music/user'
require 'music/cli'
require 'music/version'

module Music
  class Error < StandardError; end

  def self.load(data)
    @data = ::Music::Data.new(data)
  end

  def self.update(data)
    @data.change(data)
  end

  def self.data
    @data
  end
end
