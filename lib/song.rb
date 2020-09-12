require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    @@all << self
  end

def self.create
  song = self.new
  song.save
  song
end

def self.new_by_name(song_name)
  song = self.new
  song.name = song_name
  song

end

def self.create_by_name(song_name)
  song = self.create 
  song.name = song_name
song
end

def self.find_by_name(song_name)
  
  @@all.find{|song|song.name == song_name}
end

def self.find_or_create_by_name(song_name)
  
  self.find_by_name(song_name)||self.create_by_name(song_name)
  
  end

def self.alphabetical
  @@all.sort_by{|song_1, song_2| song_1 <=> song_2}
#binding.pry
end

def self.new_from_filename
end

def self.create_from_filename
end

def self.destroy_all
  
end

end

