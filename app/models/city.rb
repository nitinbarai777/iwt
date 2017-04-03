class City < ActiveRecord::Base

  validates :name, :presence => true, :length => {:maximum => 50}
  
end
