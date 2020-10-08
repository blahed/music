module Music
  class Song
    attr_reader :id, :artist, :title

    def initialize(song)
      @id     = song[:id]
      @artist = song[:artist]
      @title  = song[:title]
    end

    def to_h
      {
        id: @id,
        artist: @artist,
        title: @title
      }
    end
  end
end
