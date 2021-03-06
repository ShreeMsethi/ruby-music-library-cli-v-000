class Artist
  
  
  extend Concerns::Findable
  attr_accessor :name
  
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
  end
  
  def self.all
    @@all
  end
  
  def self.destroy_all
    @@all.clear
  end
  
  def save
    @@all << self
  end
  
  def self.create(name)
    artist = self.new(name)
    artist.save
    artist
  end
  
  # ----------------------------------------------------
  # After the songs empty array added in the initialize method 
  
  def songs
    @songs
  end
    
  # ----------------------------------------------------
  
  def add_song(song)
    song.artist = self if song.artist != self
    songs << song if songs.include?(song) == false
  end
  
  # ----------------------------------------------------

  def genres
    songs.map {|song| song.genre}.uniq
  end
  
end

