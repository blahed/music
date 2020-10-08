module Music
  class Playlist
    attr_reader :id

    def initialize(playlist)
      @id       = playlist[:id]
      @owner_id = playlist[:owner_id]
      @song_ids = playlist[:song_ids]
    end

    def owner
      @owner ||= Music.data.users[@owner_id]
    end

    def songs
     @songs ||= @song_ids.map { |id| Music.data.songs[id] }
    end

    def to_h
      {
        id: @id,
        owner_id: @owner_id,
        song_ids: @song_ids
      }
    end
  end
end
