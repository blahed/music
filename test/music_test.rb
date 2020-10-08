require 'test_helper'

describe Music do
  it "has a version number" do
    refute_nil ::Music::VERSION
  end

  it "loads data" do
    data = {
      users: [ { id: 1, name: 'Sting' }, {id: 2, name: 'Stewart'} ],
      songs: [ { id: 1, artist: 'The Police', title: 'So Lonely' }, { id: 2, artist: 'The Police', title: 'Next to You' } ],
      playlists: [ { id: 1, owner_id: 1, song_ids: [1,2] } ]
    }

    music_data = ::Music.load(data)

    _(music_data.all).wont_be_empty
  end
end
