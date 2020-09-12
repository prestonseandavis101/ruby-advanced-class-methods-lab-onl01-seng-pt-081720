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
self.all.sort_by{|song|song.name}
  
#binding.pry
end

def self.new_from_filename(song)
  artist_name = song.split(" - ")[0] #--> gets rid of the "-", and splits the string into an array with two strings, the [0] collects the firt element of the array, which is "Thundercat"
 
  song_name = song.split(" - ")[1] #--> this collects the second element in the string, [1], or, "For Love I Come.mp3" and assigns it to the instance variable song_name
 
  song_name = song_name.split(".mp3")[0] #--->this splits off ".mp3" from the string and creates an array with one element that you collect with [0]
 
  new_song = Song.new #--> this creates a new instance of a song

new_song.artist_name = artist_name #---> assigns artist_name to new_song

new_song.name = song_name 

new_song
  
end


def self.create_from_filename(song)
   artist_name = song.split(" - ")[0]
   song_name = song.split(" - ")[1]
    song_name = song_name.split(".mp3")[0]
    new_song = Song.new 
    new_song.artist_name = artist_name
    new_song.song_name = song_name
    Song.save
    new_song
    
end

def self.destroy_all
  self.all.clear
  
end

end

