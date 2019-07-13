class Pie 
  
  attr_accessor :title, :url
  @@all = []
  
  def initialize(title)
    @title = title 
    @utl = url
    @@all << self
  end
  
  def self.all
    @@all
  end

end