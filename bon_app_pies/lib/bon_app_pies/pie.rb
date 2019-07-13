class Pie 
  
  attr_accessor :title, :url
  @@all = []
  
  def initialize(title, url)
    @title = title 
    @utl = url
    @@all << self
  end
  
  def self.all
    @@all
  end

end