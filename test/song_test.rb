require 'test_helper'

describe Music::Song do
  it "initializes a song" do
    song = ::Music::Song.new(id: 1, artist: 'The Police', title: 'So Lonely')

    _(song.id).must_equal 1
    _(song.artist).must_equal 'The Police'
    _(song.title).must_equal 'So Lonely'
  end

  it "hashes itself" do
    song = ::Music::Song.new(id: 1, artist: 'The Police', title: 'So Lonely')

    _(song.to_h).must_equal ({ id: 1, artist: 'The Police', title: 'So Lonely' })
  end
end
