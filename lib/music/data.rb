module Music
  class Data
    def initialize(data)
      @data = {
        users: {},
        songs: {},
        playlists: {},
      }.tap do |hash|
        data[:users].each {|u| hash[:users][u[:id]] = User.new(u) }
        data[:songs].each {|s| hash[:songs][s[:id]] = Song.new(s) }
        data[:playlists].each {|p| hash[:playlists][p[:id]] = Playlist.new(p) }
      end
    end

    def create(key, attributes)
      id = @data[key].length + 1

      case key
      when :users
        @data[key][id] ||= User.new(attributes.merge(id: id.to_s))
      when :songs
        @data[key][id] ||= Song.new(attributes.merge(id: id.to_s))
      when :playlists
        @data[key][id] ||= Playlist.new(attributes.merge(id: id.to_s))
      end
    end

    def remove(key, id)
      @data[key].delete(id)
    end

    def update(key, attributes)
      case key
      when :users
        @data[key][attributes[:id]] = User.new(attributes)
      when :songs
        @data[key][attributes[:id]] = Song.new(attributes)
      when :playlists
        @data[key][attributes[:id]] = Playlist.new(attributes)
      end
    end

    def change(changes)
      changes[:+].each { |key, _changes| _changes.each { |attributes| create(key, attributes) }}
      changes[:-].each { |key, _changes| _changes.each { |id| remove(key, id) }}
      changes[:~].each { |key, _changes| _changes.each { |attributes| update(key, attributes) }}
    end

    def to_h
      all.map do |key, items|
        [key, items.values.map(&:to_h)]
      end.to_h
    end

    def all
      @data
    end

    def users
      @data[:users]
    end

    def songs
      @data[:songs]
    end

    def playlists
      @data[:playlists]
    end
  end
end