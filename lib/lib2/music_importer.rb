class MusicImporter

attr_reader :path

  # initializes accepts a file path to a directory or MP3 file.
    def initialize(path)
      @path = path
    end

    def files
       @files ||= Dir.glob("#{path}/*.mp3").collect{ |f| f.gsub("#{path}/", "") }
    end

    def import
      files.each{ |f| Song.create_from_filename(f) }
    end
  end