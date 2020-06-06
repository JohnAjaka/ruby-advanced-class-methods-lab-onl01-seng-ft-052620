require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    self.all << song
    song
  end

  def self.new_by_name(song_title)
    song = self.new
    song.name = song_title
    song
  end

  def self.create_by_name(song_title)
    song = self.new
    song.name = song_title
    @@all << song
    song
  end

  def self.find_by_name(song_title)
    found = self.all.find {|song| song.name == song_title}
    found
  end

  def self.find_or_create_by_name(song_title)
    found = self.find_by_name(song_title)
    if found
      found
    else
      self.create_by_name(song_title)
    end
  end
  
  def self.alphabetical
    alphabetized = self.all.sort_by{|song| song.name}
    alphabetized
  end

  def self.new_from_filename(full_name)
    split_by_dash = full_name.split(" - ")
    split_by_dash[1] = split_by_dash[1].chomp(".mp3")
    song = self.new
    song.artist_name = split_by_dash[0]
    song.name = split_by_dash[1]
    song
  end

  def self.create_from_filename(filename)
    song_prop = self.new_from_filename(filename)
    song = self.create
    song.name = song_prop.name
    song.artist_name = song_prop.artist_name
    song
  end

  def self.destroy_all
    self.all.clear
  end
end
