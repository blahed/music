require 'test_helper'

describe Music::Data do

  it "initializes data" do
    data = {
      users: [ { id: 1, name: 'Sting' }, {id: 2, name: 'Stewart'} ],
      songs: [ { id: 1, artist: 'The Police', title: 'So Lonely' }, { id: 2, artist: 'The Police', title: 'Next to You' } ],
      playlists: [ { id: 1, owner_id: 1, song_ids: [1,2] } ]
    }

    music_data = ::Music::Data.new(data)

    _(music_data.all).wont_be_empty
    _(music_data.users).wont_be_empty
    _(music_data.songs).wont_be_empty
    _(music_data.playlists).wont_be_empty
  end

  it "adds data" do
    data = {
      users: [ { id: 1, name: 'Sting' }, {id: 2, name: 'Stewart'} ],
      songs: [ { id: 1, artist: 'The Police', title: 'So Lonely' }, { id: 2, artist: 'The Police', title: 'Next to You' } ],
      playlists: [ { id: 1, owner_id: 1, song_ids: [1,2] } ]
    }

    music_data = ::Music::Data.new(data)

    music_data.create(:users, {name: "Andy"})

    _(music_data.users.length).must_equal 3
    _(music_data.users[3].name).must_equal "Andy"
  end

  it "removes data" do
    data = {
      users: [ { id: 1, name: 'Sting' }, {id: 2, name: 'Stewart'} ],
      songs: [ { id: 1, artist: 'The Police', title: 'So Lonely' }, { id: 2, artist: 'The Police', title: 'Next to You' } ],
      playlists: [ { id: 1, owner_id: 1, song_ids: [1,2] } ]
    }

    music_data = ::Music::Data.new(data)

    music_data.remove(:users, 2)

    _(music_data.users.length).must_equal 1
    _(music_data.users[2]).must_be_nil
  end

  it "updates data" do
    data = {
      users: [ { id: 1, name: 'Sting' }, {id: 2, name: 'Stewart'} ],
      songs: [ { id: 1, artist: 'The Police', title: 'So Lonely' }, { id: 2, artist: 'The Police', title: 'Next to You' }, {id: 3, artist: 'The Police', title: 'Roxanne'} ],
      playlists: [ { id: 1, owner_id: 1, song_ids: [1,2] } ]
    }

    music_data = ::Music::Data.new(data)

    music_data.update(:playlists, { id: 1, owner_id: 1, song_ids: [1,2,3] })

    _(music_data.playlists.length).must_equal 1
    _(music_data.playlists[1].instance_variable_get(:@song_ids).size).must_equal 3
    _(music_data.playlists[1].instance_variable_get(:@song_ids).last).must_equal 3
  end

  it "hashes itself" do
    data = {
      users: [ { id: 1, name: 'Sting' }, {id: 2, name: 'Stewart'} ],
      songs: [ { id: 1, artist: 'The Police', title: 'So Lonely' }, { id: 2, artist: 'The Police', title: 'Next to You' }, {id: 3, artist: 'The Police', title: 'Roxanne'} ],
      playlists: [ { id: 1, owner_id: 1, song_ids: [1,2] } ]
    }

    music_data = ::Music::Data.new(data)

    _(music_data.to_h).must_equal data
  end
end
