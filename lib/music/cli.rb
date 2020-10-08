require 'json'

module Music
  class CLI
    BANNER = <<~USAGE
      Usage:
        music INPUTFILE CHANGES OUTPUTFILE
      Description:
        Manage your music data
      Example:
        music spotify.json changes.json result.json
    USAGE


    def self.run
      input_path, changeset_path, output_path = ARGV

      data    = JSON.parse(File.read(input_path), symbolize_names: true)
      changes = JSON.parse(File.read(changeset_path), symbolize_names: true)

      Music.load(data)
      Music.update(changes)
      File.open(output_path, 'w') { |file| file.write JSON.pretty_generate(Music.data.to_h) }
    end
  end
end
