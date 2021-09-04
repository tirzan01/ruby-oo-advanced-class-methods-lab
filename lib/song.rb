class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def self.create
    song = self.new
    song.save
    song
  end

  def self.new_by_name(str)
    new_song = self.create
    new_song.name = str
    new_song
  end

  def self.create_by_name(str)
    self.new_by_name(str)
  end

  def self.find_by_name(str)
    self.all.find{ |song| song.name == str }
  end

  def self.find_or_create_by_name(str)
    find_song_by_name = self.find_by_name(str)
    find_song_by_name ? find_song_by_name : self.create_by_name(str)
  end

  def self.alphabetical
    self.all.sort{ |a, b| a.name <=> b.name }
  end

  def self.new_from_filename(str)
    str = str.split(' - ')
    name = str[1].split('.')[0]
    artist = str[0]
    song = self.new_by_name(name)
    song.artist_name = artist
    song
  end

  def self.create_from_filename(str)
    self.new_from_filename(str)
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    self.class.all << self
  end

end
