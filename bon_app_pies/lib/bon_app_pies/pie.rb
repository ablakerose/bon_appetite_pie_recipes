class Pie

  attr_accessor :title, :url, :description, :ingredients, :directions
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
