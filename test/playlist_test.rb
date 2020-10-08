require 'test_helper'

describe Music::Playlist do
  it "initializes a playlist" do
    playlist = ::Music::Playlist.new(id: 1, owner_id: 1, song_ids: [1,2,3])

    _(playlist.id).must_equal 1
  end

  it "looks up owner" do
    data = {
      users: [ { id: 1, name: 'Sting' }, {id: 2, name: 'Stewart'} ],
      songs: [ { id: 1, artist: 'The Police', title: 'So Lonely' }, { id: 2, artist: 'The Police', title: 'Next to You' } ],
      playlists: [ { id: 1, owner_id: 1, song_ids: [1,2] } ]
    }

    music_data = ::Music.load(data)
    _(music_data.playlists[1].owner).must_equal music_data.users[1]
  end

  it "looks up songs" do
    data = {
      users: [ { id: 1, name: 'Sting' }, {id: 2, name: 'Stewart'} ],
      songs: [ { id: 1, artist: 'The Police', title: 'So Lonely' }, { id: 2, artist: 'The Police', title: 'Next to You' } ],
      playlists: [ { id: 1, owner_id: 1, song_ids: [1,2] } ]
    }

    music_data = ::Music.load(data)
    _(music_data.playlists[1].songs).must_equal music_data.songs.values
  end

  it "hashes itself" do
    playlist = ::Music::Playlist.new(id: 1, owner_id: 1, song_ids: [1,2,3])

    _(playlist.to_h).must_equal ({ id: 1, owner_id: 1, song_ids: [1,2,3] })
  end
end
