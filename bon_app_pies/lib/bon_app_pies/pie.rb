class Pie 
  
  attr_accessor :title, :url, :description, :ingredients
  @@all = []
  
  def initialize(title, url)
    @title = title 
    @url = url
    @@all << self
  end
  
  def self.all
    @@all
  end

end