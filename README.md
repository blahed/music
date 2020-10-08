# Music

A little tool for managing and updating your music library data.

## Usage

```
$ bin/music INPUTFILE CHANGES OUTPUTFILE
```

To run using example data you can run the following:

```
$ bin/music example/spotify.json example/changes.json example/output.json
```

## How it works

Updating your data is done using a changes file. The shape of the changes file is fairly basic, but allows a simple interface for managing the data. The changes file is formatted with `JSON` and has three top level keys:
```json
{
    "+" : "USED FOR ADDING DATA",
    "-" : "USED FOR REMOVING DATA",
    "~" : "USED FOR MODIFYING EXISTING DATA",
}
```

### Adding users, songs, playlists

You can add users, songs, or playlists with the `+` key as explained above. To add a new playlist you might send something like:

```json
{
    "+" : {
      "playlists" : [
        {
          "owner_id" : "5",
          "song_ids" : [
            "3",
            "4",
            "5"
          ]
        }
      ]
    },
}
```

You don't need to give an `id` property, as the id will be auto assigned.

### Removing users, songs, playlists

Removing is even easier. You'll use the `-` key. To remove an existing playlist you could send something like this:

```json
"-" : {
  "playlists" : [
    "3"
  ]
}
```

Simply send an array of the ids that you'll like to remove.

### Modifying users, songs, playlists

Modifying an item is straightforward too. You'll want to send over the entire item with your changes applied. The item will need to have an `id` as it'll be used for lookup. Here's an example of adding a song to an existing playlist.

```json
{
  "~" : {
    "playlists" : [
      {
        "id" : "1",
        "owner_id" : "2",
        "song_ids" : [
          "8",
          "32",
          "1"
        ]
      }
    ]
  }
}
```


## Future plans

As your library grows, we may need to determine a better way to parse the large JSON file. Streaming using a library like `json-stream` or possibly using `yajl` could be options worth exploring. There's also the potential to speed up processing of the data by saving a few loops here and there. Right now, it's worth it to have more operations but code that is easier to read and follow.

The library was designed and built to allow future expansion. Objects were modeled simply and separately to allow growth without having class concerns mixed up too much. There's some basic association and a class variable store to allow referencing, which could be the foundation for a CLI based interface to search/modify/manage the data.